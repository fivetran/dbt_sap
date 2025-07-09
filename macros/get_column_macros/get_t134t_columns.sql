{% macro get_t134t_columns() %}

{% set columns = [
    {"name": "_fivetran_deleted", "datatype": "boolean"},
    {"name": "_fivetran_rowid", "datatype": dbt.type_numeric()},
    {"name": "_fivetran_synced", "datatype": dbt.type_timestamp()},
    {"name": "mandt", "datatype": dbt.type_string()},
    {"name": "mtart", "datatype": dbt.type_string()},
    {"name": "mtbez", "datatype": dbt.type_string()},
    {"name": "spras", "datatype": dbt.type_string()}
] %}

{{ return(columns) }}

{% endmacro %}

