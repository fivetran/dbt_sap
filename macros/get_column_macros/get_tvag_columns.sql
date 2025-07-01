{% macro get_tvag_columns() %}

{% set columns = [
    {"name": "_fivetran_deleted", "datatype": "boolean"},
    {"name": "_fivetran_rowid", "datatype": dbt.type_numeric()},
    {"name": "_fivetran_synced", "datatype": dbt.type_timestamp()},
    {"name": "abgru", "datatype": dbt.type_string()},
    {"name": "dragr", "datatype": dbt.type_string()},
    {"name": "ep_off", "datatype": dbt.type_string()},
    {"name": "fk_erl", "datatype": dbt.type_string()},
    {"name": "fsh_pqr_spec", "datatype": dbt.type_string()},
    {"name": "hvr_change_time", "datatype": dbt.type_string()},
    {"name": "hvr_is_deleted", "datatype": dbt.type_string()},
    {"name": "kowrr", "datatype": dbt.type_string()},
    {"name": "mandt", "datatype": dbt.type_string()},
] %}

{{ return(columns) }}

{% endmacro %}

