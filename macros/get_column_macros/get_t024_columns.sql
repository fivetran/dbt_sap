{% macro get_t024_columns() %}

{% set columns = [
    {"name": "_fivetran_deleted", "datatype": "boolean"},
    {"name": "_fivetran_rowid", "datatype": dbt.type_numeric()},
    {"name": "_fivetran_synced", "datatype": dbt.type_timestamp()},
    {"name": "_fivetran_sap_archived", "datatype": dbt.type_string()},
    {"name": "ekgrp", "datatype": dbt.type_string()},
    {"name": "eknam", "datatype": dbt.type_string()},
    {"name": "ektel", "datatype": dbt.type_string()},
    {"name": "ldest", "datatype": dbt.type_string()},
    {"name": "mandt", "datatype": dbt.type_string()},
    {"name": "smtp_addr", "datatype": dbt.type_string()},
    {"name": "tel_extens", "datatype": dbt.type_string()},
    {"name": "tel_number", "datatype": dbt.type_string()},
    {"name": "telfx", "datatype": dbt.type_string()}
] %}

{{ return(columns) }}

{% endmacro %}

