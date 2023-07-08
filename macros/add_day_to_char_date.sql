--Convert date strings to dates, add one day, and then convert back to strings. This will avoid null records in our end model--the initial date range setup would join on date ranges in the end model that don't exist
				
{% macro add_day_to_char_date(date_string) %}

    {% if target.type == 'postgres' %}
    to_char(to_date({{ date_string }}, 'YYYYMMDD') + interval '1 day', 'YYYYMMDD')
    {% elif target.type == 'bigquery' %}
    format_date('%Y%m%d', date_add(parse_date('%Y%m%d', {{ date_string }}), interval 1 day))
    {% elif target.type == 'databricks' %}
    date_format(date_add(to_date({{ date_string }}, 'yyyyMMdd'), 1), 'yyyyMMdd')
    {% else %}
    to_char(dateadd(day, 1, to_date({{ date_string }}, 'YYYYMMDD')), 'YYYYMMDD')
    {% endif %}

{% endmacro %}