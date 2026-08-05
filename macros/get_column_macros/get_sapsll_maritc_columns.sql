{% macro get_sapsll_maritc_columns() %}

{% set columns = [
    {"name": "_fivetran_deleted", "datatype": "boolean"},
    {"name": "ccngn", "datatype": dbt.type_string()},
    {"name": "datab", "datatype": dbt.type_string()},
    {"name": "datbi", "datatype": dbt.type_string()},
    {"name": "mandt", "datatype": dbt.type_string()},
    {"name": "matnr", "datatype": dbt.type_string()},
    {"name": "stcts", "datatype": dbt.type_string()}
] %}

{{ return(columns) }}

{% endmacro %}