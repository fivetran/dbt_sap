{% macro get_t000_columns() %}

{% set columns = [
    {"name": "_fivetran_deleted", "datatype": dbt.type_boolean()},
    {"name": "_fivetran_sap_archived", "datatype": dbt.type_boolean()},
    {"name": "_fivetran_synced", "datatype": dbt.type_timestamp()},
    {"name": "adrnr", "datatype": dbt.type_string()},
    {"name": "cccategory", "datatype": dbt.type_string()},
    {"name": "cccopylock", "datatype": dbt.type_string()},
    {"name": "cccoractiv", "datatype": dbt.type_string()},
    {"name": "ccimaildis", "datatype": dbt.type_string()},
    {"name": "ccnocascad", "datatype": dbt.type_string()},
    {"name": "ccnocliind", "datatype": dbt.type_string()},
    {"name": "ccorigcont", "datatype": dbt.type_string()},
    {"name": "ccsoftlock", "datatype": dbt.type_string()},
    {"name": "cctemplock", "datatype": dbt.type_string()},
    {"name": "changedate", "datatype": "date"},
    {"name": "changeuser", "datatype": dbt.type_string()},
    {"name": "logsys", "datatype": dbt.type_string()},
    {"name": "mandt", "datatype": dbt.type_string()},
    {"name": "mtext", "datatype": dbt.type_string()},
    {"name": "mwaer", "datatype": dbt.type_string()},
    {"name": "ort01", "datatype": dbt.type_string()}
] %}

{{ return(columns) }}

{% endmacro %}