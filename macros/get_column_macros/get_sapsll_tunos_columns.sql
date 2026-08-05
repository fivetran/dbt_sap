{% macro get_sapsll_tunos_columns() %}

{% set columns = [
    {"name": "_fivetran_deleted", "datatype": "boolean"},
    {"name": "ctsty", "datatype": dbt.type_string()},
    {"name": "land1", "datatype": dbt.type_string()},
    {"name": "mandt", "datatype": dbt.type_string()},
    {"name": "stcts", "datatype": dbt.type_string()}
] %}

{{ return(columns) }}

{% endmacro %}