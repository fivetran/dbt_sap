{% macro get_sapsll_clsnr_columns() %}

{% set columns = [
    {"name": "_fivetran_deleted", "datatype": "boolean"},
    {"name": "_fivetran_synced", "datatype": dbt.type_timestamp()},
    {"name": "bemeh", "datatype": dbt.type_string()},
    {"name": "ccngn", "datatype": dbt.type_string()},
    {"name": "datab", "datatype": dbt.type_string()},
    {"name": "datbi", "datatype": dbt.type_string()},
    {"name": "mandt", "datatype": dbt.type_string()},
    {"name": "nosct", "datatype": dbt.type_string()}
] %}

{{ return(columns) }}

{% endmacro %}