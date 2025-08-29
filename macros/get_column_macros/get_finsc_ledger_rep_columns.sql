{% macro get_finsc_ledger_rep_columns() %}

{% set columns = [
    {"name": "_fivetran_deleted", "datatype": dbt.type_boolean()},
    {"name": "_fivetran_sap_archived", "datatype": dbt.type_boolean()},
    {"name": "_fivetran_synced", "datatype": dbt.type_timestamp()},
    {"name": "mandt", "datatype": dbt.type_string()},
    {"name": "rldnr", "datatype": dbt.type_string()},
    {"name": "rldnr_pers", "datatype": dbt.type_string()}
] %}

{{ return(columns) }}

{% endmacro %}