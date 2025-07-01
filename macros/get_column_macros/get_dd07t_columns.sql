{% macro get_dd07t_columns() %}

{% set columns = [
    {"name": "_fivetran_deleted", "datatype": "boolean"},
    {"name": "_fivetran_rowid", "datatype": dbt.type_numeric()},
    {"name": "_fivetran_synced", "datatype": dbt.type_timestamp()},
    {"name": "domname", "datatype": dbt.type_string()},
    {"name": "domvalue_l", "datatype": dbt.type_string()},
    {"name": "as4vers", "datatype": dbt.type_string()},
    {"name": "ddlanguage", "datatype": dbt.type_string()},
    {"name": "ddtext", "datatype": dbt.type_string()},
    {"name": "hvr_change_time", "datatype": dbt.type_string()}
] %}

{{ return(columns) }}

{% endmacro %}
