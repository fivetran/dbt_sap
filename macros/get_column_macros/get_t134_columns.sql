{% macro get_t134_columns() %}

{% set columns = [
    {"name": "_fivetran_deleted", "datatype": "boolean"},
    {"name": "_fivetran_rowid", "datatype": dbt.type_numeric()},
    {"name": "_fivetran_synced", "datatype": dbt.type_timestamp()},
    {"name": "aranz", "datatype": dbt.type_string()},
    {"name": "ardel", "datatype": dbt.type_string()},
    {"name": "begru", "datatype": dbt.type_string()},
    {"name": "bsext", "datatype": dbt.type_string()},
    {"name": "bsint", "datatype": dbt.type_string()},
    {"name": "cchis", "datatype": dbt.type_string()},
    {"name": "chneu", "datatype": dbt.type_string()},
    {"name": "class", "datatype": dbt.type_string()},
    {"name": "ctype", "datatype": dbt.type_string()},
    {"name": "ekalr", "datatype": dbt.type_string()},
    {"name": "envop", "datatype": dbt.type_string()},
    {"name": "flref", "datatype": dbt.type_string()},
    {"name": "hvr_change_time", "datatype": dbt.type_string()},
    {"name": "hvr_is_deleted", "datatype": dbt.type_int()},
    {"name": "izust", "datatype": dbt.type_string()},
    {"name": "kkref", "datatype": dbt.type_string()},
    {"name": "kzgrp", "datatype": dbt.type_string()},
    {"name": "kzkfg", "datatype": dbt.type_string()},
    {"name": "kzmpn", "datatype": dbt.type_string()},
    {"name": "kzpip", "datatype": dbt.type_string()},
    {"name": "kzprc", "datatype": dbt.type_string()},
    {"name": "kzrac", "datatype": dbt.type_string()},
    {"name": "kzvpr", "datatype": dbt.type_string()},
    {"name": "mandt", "datatype": dbt.type_string()},
    {"name": "mbref", "datatype": dbt.type_string()},
    {"name": "mstae", "datatype": dbt.type_string()},
    {"name": "mtart", "datatype": dbt.type_string()},
    {"name": "mtref", "datatype": dbt.type_string()},
    {"name": "numke", "datatype": dbt.type_string()},
    {"name": "numki", "datatype": dbt.type_string()},
    {"name": "prdru", "datatype": dbt.type_string()},
    {"name": "pstat", "datatype": dbt.type_string()},
    {"name": "vmtpo", "datatype": dbt.type_string()},
    {"name": "vnumke", "datatype": dbt.type_string()},
    {"name": "vnumki", "datatype": dbt.type_string()},
    {"name": "vprsv", "datatype": dbt.type_string()},
    {"name": "vtype", "datatype": dbt.type_string()},
    {"name": "wmakg", "datatype": dbt.type_string()}
] %}

{{ return(columns) }}

{% endmacro %}

