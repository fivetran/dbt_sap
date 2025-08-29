{% macro get__sapsll_nosca_columns() %}

{% set columns = [
    {"name": "_fivetran_deleted", "datatype": dbt.type_boolean()},
    {"name": "_fivetran_sap_archived", "datatype": dbt.type_boolean()},
    {"name": "_fivetran_synced", "datatype": dbt.type_timestamp()},
    {"name": "datab", "datatype": dbt.type_string()},
    {"name": "datab_date", "datatype": "date"},
    {"name": "datbi", "datatype": "date"},
    {"name": "mandt", "datatype": dbt.type_string()},
    {"name": "nosct", "datatype": dbt.type_string()},
    {"name": "stcts", "datatype": dbt.type_string()}
] %}

{{ return(columns) }}

{% endmacro %}