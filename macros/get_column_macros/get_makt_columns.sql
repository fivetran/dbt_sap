{% macro get_makt_columns() %}

{% set columns = [
    {"name": "_fivetran_deleted", "datatype": "boolean"},
    {"name": "_fivetran_rowid", "datatype": dbt.type_numeric()},
    {"name": "_fivetran_synced", "datatype": dbt.type_timestamp()},
    {"name": "maktx", "datatype": dbt.type_string()},
    {"name": "mandt", "datatype": dbt.type_string()},
    {"name": "matnr", "datatype": dbt.type_string()},
    {"name": "spras", "datatype": dbt.type_string()},
] %}

{{ return(columns) }}

{% endmacro %}

