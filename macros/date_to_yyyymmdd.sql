{% macro date_to_yyyymmdd(date_expression="current_date") %}
    {{ adapter.dispatch('date_to_yyyymmdd', 'sap')(date_expression) }}
{% endmacro %}

{% macro default__date_to_yyyymmdd(date_expression) %}
    to_char({{ date_expression }}, 'YYYYMMDD')
{% endmacro %}

{% macro bigquery__date_to_yyyymmdd(date_expression) %}
    format_date('%Y%m%d', {{ date_expression }})
{% endmacro %}

{% macro databricks__date_to_yyyymmdd(date_expression) %}
    date_format({{ date_expression }}, 'yyyyMMdd')
{% endmacro %}
