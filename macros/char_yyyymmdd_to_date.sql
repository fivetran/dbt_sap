-- This macro takes a string and converts it to date. If the string is not valid, it will return a null value.
{% macro char_yyyymmdd_to_date(date_string) -%}
    {{ adapter.dispatch('char_yyyymmdd_to_date')(date_string) }}
{%- endmacro %}

{% macro default__char_yyyymmdd_to_date(date_string) %}
    to_date(cast({{ date_string }} as {{ dbt.type_string() }}), 'YYYYMMDD')
{% endmacro %}

{% macro bigquery__char_yyyymmdd_to_date(date_string) %}
    safe.parse_date('%Y%m%d', cast({{ date_string }} as string))
{% endmacro %}

{% macro snowflake__char_yyyymmdd_to_date(date_string) %}
    try_to_date(cast({{ date_string }} as varchar), 'YYYYMMDD')
{% endmacro %}

{% macro postgres__char_yyyymmdd_to_date(date_string) %}
    case
        when {{ date_string }}::text ~ '^[0-9]{8}$'
            and substring({{ date_string }}::text, 5, 2)::int between 1 and 12
            and substring({{ date_string }}::text, 7, 2)::int between 1 and 31
        then to_date({{ date_string }}::text, 'YYYYMMDD')
        else null
    end
{% endmacro %}

{% macro databricks__char_yyyymmdd_to_date(date_string) %}
    to_date(cast({{ date_string }} as string), 'yyyyMMdd')
{% endmacro %}