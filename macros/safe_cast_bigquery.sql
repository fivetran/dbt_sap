-- This macro uses SAFE_CAST on BigQuery so values that cannot convert return null instead of failing the query, and a plain cast everywhere else.
-- Do not swap this for dbt.safe_cast: it compiles to TRY_CAST on Snowflake, which rejects BINARY input. See DECISIONLOG.md.
{% macro safe_cast_bigquery(field, type) -%}
    {{ adapter.dispatch('safe_cast_bigquery', 'sap')(field, type) }}
{%- endmacro %}

{% macro default__safe_cast_bigquery(field, type) %}
    cast({{ field }} as {{ type }})
{% endmacro %}

{% macro bigquery__safe_cast_bigquery(field, type) %}
    safe_cast({{ field }} as {{ type }})
{% endmacro %}
