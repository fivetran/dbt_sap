{% macro get_t006_columns() %}

{% set columns = [
    {"name": "_fivetran_deleted", "datatype": "boolean"},
    {"name": "_fivetran_synced", "datatype": dbt.type_timestamp()},
    {"name": "_fivetran_sap_archived", "datatype": "boolean"},
    {"name": "mandt", "datatype": dbt.type_string()},
    {"name": "msehi", "datatype": dbt.type_string()},
    {"name": "temp_unit", "datatype": dbt.type_string()},
    {"name": "temp_value", "datatype": dbt.type_float()},
    {"name": "nennr", "datatype": dbt.type_numeric()},
    {"name": "kzex3", "datatype": dbt.type_string()},
    {"name": "primary", "datatype": dbt.type_string(),"quote": True, "alias": "is_primary"},
    {"name": "decan", "datatype": dbt.type_numeric()},
    {"name": "press_unit", "datatype": dbt.type_string()},
    {"name": "kzkeh", "datatype": dbt.type_string()},
    {"name": "exp10", "datatype": dbt.type_numeric()},
    {"name": "zaehl", "datatype": dbt.type_numeric()},
    {"name": "kz2eh", "datatype": dbt.type_string()},
    {"name": "famunit", "datatype": dbt.type_string()},
    {"name": "press_val", "datatype": dbt.type_float()},
    {"name": "andec", "datatype": dbt.type_numeric()},
    {"name": "kz1eh", "datatype": dbt.type_string()},
    {"name": "addko", "datatype": dbt.type_numeric()},
    {"name": "isocode", "datatype": dbt.type_string()},
    {"name": "kzex6", "datatype": dbt.type_string()},
    {"name": "expon", "datatype": dbt.type_numeric()},
    {"name": "dimid", "datatype": dbt.type_string()},
    {"name": "kzwob", "datatype": dbt.type_string()}
] %}

{{ return(columns) }}

{% endmacro %}