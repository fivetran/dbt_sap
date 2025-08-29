{% macro get__sapsll_maritc_columns() %}

{% set columns = [
    {"name": "_fivetran_deleted", "datatype": dbt.type_boolean()},
    {"name": "_fivetran_sap_archived", "datatype": dbt.type_boolean()},
    {"name": "_fivetran_synced", "datatype": dbt.type_timestamp()},
    {"name": "ccngn", "datatype": dbt.type_string()},
    {"name": "crea_date_time", "datatype": dbt.type_numeric()},
    {"name": "crea_uname", "datatype": dbt.type_string()},
    {"name": "datab", "datatype": "date"},
    {"name": "datbi", "datatype": "date"},
    {"name": "lchg_date_time", "datatype": dbt.type_numeric()},
    {"name": "lchg_uname", "datatype": dbt.type_string()},
    {"name": "mandt", "datatype": dbt.type_string()},
    {"name": "matnr", "datatype": dbt.type_string()},
    {"name": "stcts", "datatype": dbt.type_string()},
    {"name": "tclrm", "datatype": dbt.type_string()}
] %}

{{ return(columns) }}

{% endmacro %}