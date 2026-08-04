{% macro get_anla_columns() %}

{% set columns = [
    {"name": "_fivetran_deleted", "datatype": "boolean"},
    {"name": "_fivetran_synced", "datatype": dbt.type_timestamp()},
    {"name": "mandt", "datatype": dbt.type_string()},
    {"name": "bukrs", "datatype": dbt.type_string()},
    {"name": "anln1", "datatype": dbt.type_string()},
    {"name": "anln2", "datatype": dbt.type_string()},
    {"name": "ktogr", "datatype": dbt.type_string()}
] %}

{{ return(columns) }}

{% endmacro %}
