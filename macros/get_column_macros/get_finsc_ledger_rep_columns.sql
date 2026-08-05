{% macro get_finsc_ledger_rep_columns() %}

{% set columns = [
    {"name": "_fivetran_deleted", "datatype": "boolean"},
    {"name": "mandt", "datatype": dbt.type_string()},
    {"name": "rldnr", "datatype": dbt.type_string()},
    {"name": "rldnr_pers", "datatype": dbt.type_string()}
] %}

{{ return(columns) }}

{% endmacro %}