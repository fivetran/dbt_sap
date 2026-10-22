# Decision Log

## The `hist_tax_factor` columns may come back empty

SAP stores `hist_tax_factor`, `hist_tax_factor1`, `hist_tax_factor2`, and `hist_tax_factor3` as raw bytes, and the `bsad`, `bsak`, and `bsid` compatibility views convert those bytes to text. Some warehouses allow that conversion only when the bytes spell valid text. These bytes often do not, and a single bad row fails the whole query, which made the views impossible to read.

On BigQuery, Fivetran uses `SAFE_CAST` on these four columns so invalid values return null rather than causing the query to fail. We chose potentially empty columns over unqueryable views. Valid values and all other columns are unaffected.

On Snowflake, Redshift, Databricks, and Postgres, these columns use plain `cast`. The BigQuery workaround is not applied because [`dbt.safe_cast`](https://docs.getdbt.com/reference/dbt-jinja-functions/cross-database-macros?version=2#safe_cast) compiles to `TRY_CAST` on Snowflake, which does not support `BINARY` inputs and causes the entire query to fail regardless of value. Plain `cast` has not been observed to fail on these destinations.

If you need these values, please open an issue on our [package issue page](https://github.com/fivetran/dbt_sap/issues). Returning them properly means decoding what SAP packs into the field, which is a larger change.
