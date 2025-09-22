{% macro get_sapsll_clsnr_columns() %}

{% set columns = [
    {"name": "bemeh", "datatype": dbt.type_string()},
    {"name": "ccngn", "datatype": dbt.type_string()},
    {"name": "datab", "datatype": dbt.type_string()},
    {"name": "datbi", "datatype": dbt.type_string()},
    {"name": "mandt", "datatype": dbt.type_string()},
    {"name": "nosct", "datatype": dbt.type_string()}
] %}

{{ return(columns) }}

{% endmacro %}