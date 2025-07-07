{% macro get_t024e_columns() %}

{% set columns = [
    {"name": "ekorg", "datatype": dbt.type_string()},
    {"name": "mandt", "datatype": dbt.type_string()},
    {"name": "ekotx", "datatype": dbt.type_string()},
    {"name": "txfus", "datatype": dbt.type_string()},
    {"name": "txgru", "datatype": dbt.type_string()},
    {"name": "bpeff", "datatype": dbt.type_string()},
    {"name": "txkop", "datatype": dbt.type_string()},
    {"name": "kalse", "datatype": dbt.type_string()},
    {"name": "txadr", "datatype": dbt.type_string()},
    {"name": "mkals", "datatype": dbt.type_string()},
    {"name": "bukrs", "datatype": dbt.type_string()},
    {"name": "bukrs_ntr", "datatype": dbt.type_string()},
    {"name": "_fivetran_deleted", "datatype": "boolean"},
    {"name": "_fivetran_synced", "datatype": dbt.type_timestamp()},
    {"name": "_fivetran_sap_archived", "datatype": dbt.type_string()}
] %}

{{ return(columns) }}

{% endmacro %}

