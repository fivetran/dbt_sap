{% macro get_mchp_columns() %}

{% set columns = [
    {"name": "_fivetran_deleted", "datatype": dbt.type_boolean()},
    {"name": "_fivetran_sap_archived", "datatype": dbt.type_boolean()},
    {"name": "_fivetran_synced", "datatype": dbt.type_timestamp()},
    {"name": "charg", "datatype": dbt.type_string()},
    {"name": "dokar", "datatype": dbt.type_string()},
    {"name": "doknr", "datatype": dbt.type_string()},
    {"name": "doktl", "datatype": dbt.type_string()},
    {"name": "dokvr", "datatype": dbt.type_string()},
    {"name": "ebrid", "datatype": dbt.type_string()},
    {"name": "ebrstatus", "datatype": dbt.type_string()},
    {"name": "mandt", "datatype": dbt.type_string()},
    {"name": "matnr", "datatype": dbt.type_string()},
    {"name": "valdat", "datatype": "date"},
    {"name": "vers_stat", "datatype": dbt.type_string()},
    {"name": "version", "datatype": dbt.type_string()},
    {"name": "werks", "datatype": dbt.type_string()}
] %}

{{ return(columns) }}

{% endmacro %}