{% macro get_t161t_columns() %}

{% set columns = [
    {"name": "_fivetran_deleted", "datatype": "boolean"},
    {"name": "_fivetran_rowid", "datatype": dbt.type_numeric()},
    {"name": "_fivetran_synced", "datatype": dbt.type_timestamp()},
    {"name": "batxt", "datatype": dbt.type_string()},
    {"name": "bsart", "datatype": dbt.type_string()},
    {"name": "bstyp", "datatype": dbt.type_string()},
    {"name": "mandt", "datatype": dbt.type_string()},
    {"name": "spras", "datatype": dbt.type_string()}
] %}

{{ return(columns) }}

{% endmacro %}

