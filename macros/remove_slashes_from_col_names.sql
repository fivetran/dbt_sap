-- This macro takes a string and converts it to date. If the string is not valid, it will return a null value.
{% macro remove_slashes_from_col_names(column_list) -%}
    {{ adapter.dispatch('remove_slashes_from_col_names')(column_list) }}
{%- endmacro %}

{% macro default__remove_slashes_from_col_names(column_list) %}
    {%- for col in column_list %}
        {{ adapter.quote(col.name) }} as {{ col.name | replace('/', '_') }}{{ ',' if not loop.last -}}
    {% endfor -%}
{% endmacro %}