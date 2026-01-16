{% macro get_finsc_cmp_versnd_columns() %}

{% set columns = [
    {"name": "_fivetran_deleted", "datatype": dbt.type_boolean()},
    {"name": "_fivetran_sap_archived", "datatype": dbt.type_boolean()},
    {"name": "_fivetran_synced", "datatype": dbt.type_timestamp()},
    {"name": "bukrs", "datatype": dbt.type_string()},
    {"name": "field_name_buzei", "datatype": dbt.type_string()},
    {"name": "field_name_pafbtr_add", "datatype": dbt.type_string()},
    {"name": "field_name_pafbtr_subtract", "datatype": dbt.type_string()},
    {"name": "field_name_pagbtr_add", "datatype": dbt.type_string()},
    {"name": "field_name_pagbtr_subtract", "datatype": dbt.type_string()},
    {"name": "field_name_refbz", "datatype": dbt.type_string()},
    {"name": "field_name_wkfbtr_add", "datatype": dbt.type_string()},
    {"name": "field_name_wkfbtr_subtract", "datatype": dbt.type_string()},
    {"name": "field_name_wkgbtr_add", "datatype": dbt.type_string()},
    {"name": "field_name_wkgbtr_subtract", "datatype": dbt.type_string()},
    {"name": "field_name_wogbtr_add", "datatype": dbt.type_string()},
    {"name": "field_name_wogbtr_subtract", "datatype": dbt.type_string()},
    {"name": "field_name_wtgbtr_add", "datatype": dbt.type_string()},
    {"name": "field_name_wtgbtr_subtract", "datatype": dbt.type_string()},
    {"name": "mandt", "datatype": dbt.type_string()},
    {"name": "rldnr", "datatype": dbt.type_string()},
    {"name": "set_to_zero", "datatype": dbt.type_string()},
    {"name": "versn", "datatype": dbt.type_string()}
] %}

{{ return(columns) }}

{% endmacro %}