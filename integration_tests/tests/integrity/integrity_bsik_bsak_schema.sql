{{ config(
    tags="fivetran_validations",
    enabled=var('fivetran_validation_tests_enabled', false) and var('sap_using_bseg', True) and var('sap_using_bkpf', True) and var('sap_using_bsak_bck', True)
) }}

-- depends_on: {{ ref('bsik') }}
-- depends_on: {{ ref('bsak') }}

-- bsik and bsak share the classic vendor line item layout, so users can union them.
-- Returns one row per column position where the name or data type differs.
{% set mismatches = [] %}
{% if execute %}
    {% set bsik_columns = adapter.get_columns_in_relation(ref('bsik')) %}
    {% set bsak_columns = adapter.get_columns_in_relation(ref('bsak')) %}
    {% for position in range([bsik_columns | length, bsak_columns | length] | max) %}
        {% set bsik_column = bsik_columns[position] if position < bsik_columns | length else none %}
        {% set bsak_column = bsak_columns[position] if position < bsak_columns | length else none %}
        {% set bsik_name = bsik_column.name | lower if bsik_column else '' %}
        {% set bsak_name = bsak_column.name | lower if bsak_column else '' %}
        {% set bsik_type = bsik_column.dtype | lower if bsik_column else '' %}
        {% set bsak_type = bsak_column.dtype | lower if bsak_column else '' %}
        {% if bsik_name != bsak_name or bsik_type != bsak_type %}
            {% do mismatches.append({'position': position + 1, 'bsik_name': bsik_name, 'bsak_name': bsak_name, 'bsik_type': bsik_type, 'bsak_type': bsak_type}) %}
        {% endif %}
    {% endfor %}
{% endif %}

{% if mismatches | length > 0 %}
{% for mismatch in mismatches %}
select
    {{ mismatch.position }} as column_position,
    '{{ mismatch.bsik_name }}' as bsik_column,
    '{{ mismatch.bsak_name }}' as bsak_column,
    '{{ mismatch.bsik_type }}' as bsik_type,
    '{{ mismatch.bsak_type }}' as bsak_type
{% if not loop.last %}union all{% endif %}
{% endfor %}
{% else %}
select
    cast(null as {{ dbt.type_int() }}) as column_position
from {{ ref('bsik') }}
where 1 = 0
{% endif %}
