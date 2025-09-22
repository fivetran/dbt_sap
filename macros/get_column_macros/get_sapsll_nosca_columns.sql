{% macro get_sapsll_nosca_columns() %}

{% set columns = [
    {"name": "datab", "datatype": dbt.type_string()},
    {"name": "datbi", "datatype": dbt.type_string()},
    {"name": "mandt", "datatype": dbt.type_string()},
    {"name": "nosct", "datatype": dbt.type_string()},
    {"name": "stcts", "datatype": dbt.type_string()}
] %}

{{ return(columns) }}

{% endmacro %}