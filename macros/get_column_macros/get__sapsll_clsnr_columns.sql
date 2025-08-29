{% macro get__sapsll_clsnr_columns() %}

{% set columns = [
    {"name": "_fivetran_deleted", "datatype": dbt.type_boolean()},
    {"name": "_fivetran_sap_archived", "datatype": dbt.type_boolean()},
    {"name": "_fivetran_synced", "datatype": dbt.type_timestamp()},
    {"name": "aenam", "datatype": dbt.type_string()},
    {"name": "beme2", "datatype": dbt.type_string()},
    {"name": "bemeh", "datatype": dbt.type_string()},
    {"name": "ccngn", "datatype": dbt.type_string()},
    {"name": "chtsp", "datatype": dbt.type_numeric()},
    {"name": "crtsp", "datatype": dbt.type_numeric()},
    {"name": "cuom1", "datatype": dbt.type_string()},
    {"name": "cuom2", "datatype": dbt.type_string()},
    {"name": "datab", "datatype": dbt.type_string()},
    {"name": "datab_date", "datatype": "date"},
    {"name": "datbi", "datatype": "date"},
    {"name": "ernam", "datatype": dbt.type_string()},
    {"name": "mandt", "datatype": dbt.type_string()},
    {"name": "nosct", "datatype": dbt.type_string()},
    {"name": "tcnid", "datatype": dbt.type_string()}
] %}

{{ return(columns) }}

{% endmacro %}