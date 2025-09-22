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

dbt run --vars '{sap_using_ekko: False, sap_using_ekpo: False, sap_using_eket: False}' --target "$db" --full-refresh
dbt test --vars '{sap_using_ekko: False, sap_using_ekpo: False, sap_using_eket: False}' --target "$db"

dbt run --vars '{sap_using_vbak: False, sap_using_vbap: False, sap_using_vbuk: False, sap_using_vbup: False}' --target "$db" --full-refresh
dbt test --vars '{sap_using_vbak: False, sap_using_vbap: False, sap_using_vbuk: False, sap_using_vbup: False}' --target "$db"

dbt run --vars '{sap_using_mara: False, sap_using_makt: False, sap_using_t134: False, sap_using_t134t: False}' --target "$db" --full-refresh
dbt test --vars '{sap_using_mara: False, sap_using_makt: False, sap_using_t134: False, sap_using_t134t: False}' --target "$db"

dbt run --vars '{sap_using_dd07t: False, sap_using_t161t: False, sap_using_t001w: False}' --target "$db" --full-refresh
dbt test --vars '{sap_using_dd07t: False, sap_using_t161t: False, sap_using_t001w: False}' --target "$db"

dbt run --vars '{sap_using_acdoca: False, sap_using_marc: False, sap_using_t000: False, sap_using_mchp: False, sap_using_sapsll_tunos: False, sap_using_finsc_ledger_rep: False}' --target "$db" --full-refresh
dbt test --vars '{sap_using_acdoca: False, sap_using_marc: False, sap_using_t000: False, sap_using_mchp: False, sap_using_sapsll_tunos: False, sap_using_finsc_ledger_rep: False}' --target "$db"

dbt run-operation fivetran_utils.drop_schemas_automation --target "$db"

