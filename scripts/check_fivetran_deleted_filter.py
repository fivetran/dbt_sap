#!/usr/bin/env python3
"""
Checks that every staging model with a `_fivetran_deleted` column applies the
standard soft-delete filter, and that the column is never re-exposed in the
model's final output.

A model is in scope if its get_*_columns() macro declares `_fivetran_deleted`.
For each in-scope model this script verifies:
  1. The filter `where not coalesce(_fivetran_deleted, false)` is present.
  2. `_fivetran_deleted` does not appear in the model's own SQL text outside
     of that filter line (i.e. it isn't selected into the final output).

Usage:
    python3 scripts/check_fivetran_deleted_filter.py

Exits non-zero if any in-scope model is missing the filter or leaks the
column into its output.
"""

import re
import sys
from pathlib import Path

REPO_ROOT = Path(__file__).resolve().parent.parent
STAGING_DIR = REPO_ROOT / "models" / "staging"
MACRO_DIR = REPO_ROOT / "macros" / "get_column_macros"

FILTER_PATTERN = re.compile(r"where\s+not\s+coalesce\(\s*_fivetran_deleted\s*,\s*false\s*\)", re.IGNORECASE)
COLUMN_DECL_PATTERN = re.compile(r'"name"\s*:\s*"_fivetran_deleted"')
DELETED_REFERENCE_PATTERN = re.compile(r"_fivetran_deleted")


def macro_declares_deleted(model_name: str) -> bool:
    macro_path = MACRO_DIR / f"get_{model_name}_columns.sql"
    if not macro_path.exists():
        return False
    return bool(COLUMN_DECL_PATTERN.search(macro_path.read_text()))


def check_model(model_path: Path) -> list:
    """Returns a list of problem strings for this model, empty if clean."""
    problems = []
    content = model_path.read_text()

    has_filter = bool(FILTER_PATTERN.search(content))
    if not has_filter:
        problems.append("missing `where not coalesce(_fivetran_deleted, false)` filter")

    # every reference to _fivetran_deleted outside the filter line itself
    # would mean it's leaking into the model's own select list
    non_filter_lines = [
        line for line in content.splitlines()
        if DELETED_REFERENCE_PATTERN.search(line) and not FILTER_PATTERN.search(line)
    ]
    if non_filter_lines:
        problems.append(
            "references _fivetran_deleted outside the filter line "
            f"(possible leak into output): {non_filter_lines}"
        )

    return problems


def main() -> int:
    model_files = sorted(STAGING_DIR.glob("stg_sap__*.sql"))
    # base/_tmp models are raw passthroughs and are expected to carry the
    # column - they're not part of this check.
    model_files = [f for f in model_files if not f.stem.endswith("_tmp")]

    in_scope = []
    skipped = []
    failures = {}

    for model_path in model_files:
        model_name = model_path.stem.removeprefix("stg_sap__")
        if not macro_declares_deleted(model_name):
            skipped.append(model_name)
            continue
        in_scope.append(model_name)
        problems = check_model(model_path)
        if problems:
            failures[model_name] = problems

    print(f"Checked {len(in_scope)} staging models with a _fivetran_deleted column "
          f"({len(skipped)} skipped - no such column declared).\n")

    if failures:
        print(f"FAILED: {len(failures)} model(s) missing the filter or leaking the column:\n")
        for model_name, problems in failures.items():
            print(f"  stg_sap__{model_name}")
            for p in problems:
                print(f"    - {p}")
        return 1

    print(f"PASSED: all {len(in_scope)} in-scope models filter _fivetran_deleted "
          "and don't expose it in output.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
