{% macro get__sapsll_tunos_columns() %}

{% set columns = [
    {"name": "_fivetran_deleted", "datatype": dbt.type_boolean()},
    {"name": "_fivetran_sap_archived", "datatype": dbt.type_boolean()},
    {"name": "_fivetran_synced", "datatype": dbt.type_timestamp()},
    {"name": "ctsty", "datatype": dbt.type_string()},
    {"name": "land1", "datatype": dbt.type_string()},
    {"name": "mandt", "datatype": dbt.type_string()},
    {"name": "stcts", "datatype": dbt.type_string()}
] %}

{{ return(columns) }}

{% endmacro %}