{% macro get_tvagt_columns() %}

{% set columns = [
    {"name": "_fivetran_deleted", "datatype": "boolean"},
    {"name": "_fivetran_rowid", "datatype": dbt.type_numeric()},
    {"name": "_fivetran_synced", "datatype": dbt.type_timestamp()},
    {"name": "abgru", "datatype": dbt.type_string()},
    {"name": "bezei", "datatype": dbt.type_string()},
    {"name": "mandt", "datatype": dbt.type_string()},
    {"name": "spras", "datatype": dbt.type_string()}
] %}

{{ return(columns) }}

{% endmacro %}

