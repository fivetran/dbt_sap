{% macro get_finsc_ld_cmp_columns() %}

{% set columns = [
    {"name": "bukrs", "datatype": dbt.type_string()},
    {"name": "curposb", "datatype": dbt.type_string()},
    {"name": "curposc", "datatype": dbt.type_string()},
    {"name": "curposd", "datatype": dbt.type_string()},
    {"name": "curpose", "datatype": dbt.type_string()},
    {"name": "curposf", "datatype": dbt.type_string()},
    {"name": "curposg", "datatype": dbt.type_string()},
    {"name": "curposk", "datatype": dbt.type_string()},
    {"name": "curposo", "datatype": dbt.type_string()},
    {"name": "curposv", "datatype": dbt.type_string()},
    {"name": "mandt", "datatype": dbt.type_string()},
    {"name": "rldnr", "datatype": dbt.type_string()}
] %}

{{ return(columns) }}

{% endmacro %}