{% macro get_matdoc_extract_columns() %}

{% set columns = [
    {"name": "_cwm_consumption_qty", "datatype": dbt.type_numeric()},
    {"name": "_cwm_meins", "datatype": dbt.type_string()},
    {"name": "_cwm_meins_sid", "datatype": dbt.type_string()},
    {"name": "_cwm_stock_qty_l1", "datatype": dbt.type_numeric()},
    {"name": "_cwm_stock_qty_l2", "datatype": dbt.type_numeric()},
    {"name": "_fivetran_deleted", "datatype": dbt.type_boolean()},
    {"name": "_fivetran_sap_archived", "datatype": dbt.type_boolean()},
    {"name": "_fivetran_synced", "datatype": dbt.type_timestamp()},
    {"name": "bukrs", "datatype": dbt.type_string()},
    {"name": "charg_sid", "datatype": dbt.type_string()},
    {"name": "consumption_qty", "datatype": dbt.type_numeric()},
    {"name": "cpudt_l1", "datatype": "date"},
    {"name": "cpudt_l2", "datatype": "date"},
    {"name": "disub_owner_sid", "datatype": dbt.type_string()},
    {"name": "gjper", "datatype": dbt.type_string()},
    {"name": "gjper_curr_per", "datatype": dbt.type_string()},
    {"name": "kunnr_sid", "datatype": dbt.type_string()},
    {"name": "kzbws", "datatype": dbt.type_string()},
    {"name": "lbbsa_sid", "datatype": dbt.type_string()},
    {"name": "lgort_sid", "datatype": dbt.type_string()},
    {"name": "lifnr_sid", "datatype": dbt.type_string()},
    {"name": "mandt", "datatype": dbt.type_string()},
    {"name": "mat_kdauf", "datatype": dbt.type_string()},
    {"name": "mat_kdpos", "datatype": dbt.type_string()},
    {"name": "mat_pspnr", "datatype": dbt.type_string()},
    {"name": "matbf", "datatype": dbt.type_string()},
    {"name": "meins", "datatype": dbt.type_string()},
    {"name": "periv", "datatype": dbt.type_string()},
    {"name": "record_type", "datatype": dbt.type_string()},
    {"name": "resourcename_sid", "datatype": dbt.type_string()},
    {"name": "sobkz", "datatype": dbt.type_string()},
    {"name": "stock_ind_l2", "datatype": dbt.type_string()},
    {"name": "stock_qty_l1", "datatype": dbt.type_numeric()},
    {"name": "stock_qty_l2", "datatype": dbt.type_numeric()},
    {"name": "stock_vkwrt_l1", "datatype": dbt.type_numeric()},
    {"name": "stock_vkwrt_l2", "datatype": dbt.type_numeric()},
    {"name": "waers", "datatype": dbt.type_string()},
    {"name": "werks", "datatype": dbt.type_string()},
    {"name": "xobew", "datatype": dbt.type_string()}
] %}

{{ return(columns) }}

{% endmacro %}