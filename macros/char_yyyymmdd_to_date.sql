{% macro char_yyyymmdd_to_date(date_string) -%}
{{ adapter.dispatch('char_yyyymmdd_to_date')(date_string) }}
{%- endmacro %}

{% macro default__char_yyyymmdd_to_date(date_string) %}
    to_date({{ date_string }}, 'yyyymmdd')
{% endmacro %}

{% macro postgres__char_yyyymmdd_to_date(date_string) %}
    to_date({{ date_string }}, 'yyyymmdd')
{% endmacro %}

{% macro bigquery__char_yyyymmdd_to_date(date_string) %}
    parse_date('%Y%m%d', {{ date_string }})
{% endmacro %}

{% macro databricks__char_yyyymmdd_to_date(date_string) %}
    to_date({{ date_string }}, 'yyyyMMdd')
{% endmacro %}
