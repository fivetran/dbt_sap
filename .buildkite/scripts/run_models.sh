#!/bin/bash

set -euo pipefail

apt-get update
apt-get install libsasl2-dev

python3 -m venv venv
. venv/bin/activate
pip install --upgrade pip setuptools
pip install -r integration_tests/requirements.txt
mkdir -p ~/.dbt
cp integration_tests/ci/sample.profiles.yml ~/.dbt/profiles.yml

db=$1
echo `pwd`
cd integration_tests
dbt deps
dbt seed --target "$db" --full-refresh
dbt run --target "$db" --full-refresh
dbt test --target "$db" 

# 1. Single variable override
dbt run --vars '{sap_using_ekbe: False}' --target "$db" --full-refresh
dbt test --vars '{sap_using_ekbe: False}' --target "$db"

# 2. Multiple purchasing tables
dbt run --vars '{sap_using_ekko: False, sap_using_ekpo: False, sap_using_eket: False}' --target "$db" --full-refresh
dbt test --vars '{sap_using_ekko: False, sap_using_ekpo: False, sap_using_eket: False}' --target "$db"

# 3. Full sales doc group
dbt run --vars '{sap_using_vbak: False, sap_using_vbap: False, sap_using_vbuk: False, sap_using_vbup: False}' --target "$db" --full-refresh
dbt test --vars '{sap_using_vbak: False, sap_using_vbap: False, sap_using_vbuk: False, sap_using_vbup: False}' --target "$db"

# 4. Full material group
dbt run --vars '{sap_using_mara: False, sap_using_makt: False, sap_using_t134: False, sap_using_t134t: False}' --target "$db" --full-refresh
dbt test --vars '{sap_using_mara: False, sap_using_makt: False, sap_using_t134: False, sap_using_t134t: False}' --target "$db"

# 5. Cross-domain disable test
dbt run --vars '{sap_using_pa0000: False, sap_using_ska1: False, sap_using_tvagt: False}' --target "$db" --full-refresh
dbt test --vars '{sap_using_pa0000: False, sap_using_ska1: False, sap_using_tvagt: False}' --target "$db"

# 6. Smaller pair (document status and type descriptions)
dbt run --vars '{sap_using_dd07t: False, sap_using_t161t: False}' --target "$db" --full-refresh
dbt test --vars '{sap_using_dd07t: False, sap_using_t161t: False}' --target "$db"

# 7. General ledger flex tables
dbt run --vars '{sap_using_faglflexa: False, sap_using_faglflext: False}' --target "$db" --full-refresh
dbt test --vars '{sap_using_faglflexa: False, sap_using_faglflext: False}' --target "$db"

# 8. Vendor master data
dbt run --vars '{sap_using_lfa1: False}' --target "$db" --full-refresh
dbt test --vars '{sap_using_lfa1: False}' --target "$db"

# 9. Company master data
dbt run --vars '{sap_using_t001: False, sap_using_t001w: False}' --target "$db" --full-refresh
dbt test --vars '{sap_using_t001: False, sap_using_t001w: False}' --target "$db"

dbt run-operation fivetran_utils.drop_schemas_automation --target "$db"

