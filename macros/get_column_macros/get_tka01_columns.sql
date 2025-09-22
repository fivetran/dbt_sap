{% macro get_tka01_columns() %}

{% set columns = [
    {"name": "_fivetran_deleted", "datatype": dbt.type_boolean()},
    {"name": "_fivetran_synced", "datatype": dbt.type_timestamp()},
    {"name": "kokrs", "datatype": dbt.type_string()},
    {"name": "logsystem", "datatype": dbt.type_string()},
    {"name": "mandt", "datatype": dbt.type_string()}
] %}

{{ return(columns) }}

{% endmacro %}