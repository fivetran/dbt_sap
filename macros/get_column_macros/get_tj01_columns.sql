{% macro get_tj01_columns() %}

{% set columns = [
    {"name": "_fivetran_deleted", "datatype": dbt.type_boolean()},
    {"name": "_fivetran_sap_archived", "datatype": dbt.type_boolean()},
    {"name": "_fivetran_synced", "datatype": dbt.type_timestamp()},
    {"name": "actgrp", "datatype": dbt.type_string()},
    {"name": "anwst", "datatype": dbt.type_string()},
    {"name": "nvvrg", "datatype": dbt.type_string()},
    {"name": "persp", "datatype": dbt.type_string()},
    {"name": "prvrg", "datatype": dbt.type_string()},
    {"name": "psikz", "datatype": dbt.type_string()},
    {"name": "subgrp", "datatype": dbt.type_string()},
    {"name": "vrgco", "datatype": dbt.type_string()},
    {"name": "vrgjv", "datatype": dbt.type_string()},
    {"name": "vrgng", "datatype": dbt.type_string()},
    {"name": "vrgsv", "datatype": dbt.type_string()},
    {"name": "wtkat", "datatype": dbt.type_string()},
    {"name": "xcoej", "datatype": dbt.type_string()},
    {"name": "xcoejl", "datatype": dbt.type_string()},
    {"name": "xcoejr", "datatype": dbt.type_string()},
    {"name": "xcoejt", "datatype": dbt.type_string()},
    {"name": "xcoep", "datatype": dbt.type_string()},
    {"name": "xcoepb", "datatype": dbt.type_string()},
    {"name": "xcoepl", "datatype": dbt.type_string()},
    {"name": "xcoepr", "datatype": dbt.type_string()},
    {"name": "xcoept", "datatype": dbt.type_string()},
    {"name": "xcofp", "datatype": dbt.type_string()},
    {"name": "xcooi", "datatype": dbt.type_string()},
    {"name": "xcosp", "datatype": dbt.type_string()},
    {"name": "xcoss", "datatype": dbt.type_string()},
    {"name": "xfmgm", "datatype": dbt.type_string()}
] %}

{{ return(columns) }}

{% endmacro %}