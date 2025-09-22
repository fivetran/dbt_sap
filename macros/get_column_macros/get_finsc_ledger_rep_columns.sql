{% macro get_finsc_ledger_rep_columns() %}

{% set columns = [
    {"name": "mandt", "datatype": dbt.type_string()},
    {"name": "rldnr", "datatype": dbt.type_string()},
    {"name": "rldnr_pers", "datatype": dbt.type_string()}
] %}

{{ return(columns) }}

{% endmacro %}