-- Subtract one day back to revert end date back to its initial value in the end model

{% macro subtract_day_to_char_date(date_string) %}

    {% if target.type == 'postgres' %}
    to_char(to_date({{ date_string }}, 'YYYYMMDD') - interval '1 day', 'YYYYMMDD')
    {% elif target.type == 'bigquery' %}
    format_date('%Y%m%d', date_sub(parse_date('%Y%m%d', {{ date_string }}), interval 1 day))
    {% elif target.type == 'databricks' %}
    date_format(date_sub(to_date({{ date_string }}, 'yyyyMMdd'), 1), 'yyyyMMdd')
    {% else %}
    to_char(dateadd(day, -1, to_date({{ date_string }}, 'YYYYMMDD')), 'YYYYMMDD')
    {% endif %}

{% endmacro %}