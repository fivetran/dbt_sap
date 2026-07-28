{% set staging_cols = adapter.get_columns_in_relation(ref('stg_sap__faglflexa')) %}

{# Exclude Fivetran metadata and faglflexa_timestamp, which is aliased as timestamp_at in the compat view #}
{% set exclude_cols = ['_fivetran_synced', '_fivetran_deleted', '_fivetran_rowid', 'faglflexa_timestamp'] %}

{% set compare_cols = [] %}
{% for col in staging_cols %}
    {% if col.name | lower not in exclude_cols %}
        {% do compare_cols.append(col.name | lower) %}
    {% endif %}
{% endfor %}

with comp_view as (
    select
        {% for col in compare_cols %}
        {{ col }}{% if not loop.last %},{% endif %}
        {% endfor %}
    from {{ ref('faglflexa') }}
),

staging as (
    select
        {% for col in compare_cols %}
        {{ col }}{% if not loop.last %},{% endif %}
        {% endfor %}
    from {{ ref('stg_sap__faglflexa') }}
),

unmatched as (
    select * from comp_view
    except
    select * from staging
)

-- If this test fails, the faglflexa compatibility view is missing columns present in stg_sap__faglflexa.
-- Update models/compatibility_views/mart/faglflexa.sql to include the missing columns.
select * from unmatched
