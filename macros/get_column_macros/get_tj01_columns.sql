{% macro get_tj01_columns() %}

{% set columns = [
    {"name": "_fivetran_deleted", "datatype": dbt.type_boolean()},
    {"name": "_fivetran_synced", "datatype": dbt.type_timestamp()},
    {"name": "vrgng", "datatype": dbt.type_string()},
    {"name": "wtkat", "datatype": dbt.type_string()},
    {"name": "xcosp", "datatype": dbt.type_string()},
    {"name": "xcoss", "datatype": dbt.type_string()}
] %}

{{ return(columns) }}

{% endmacro %}