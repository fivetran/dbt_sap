{{ config(enabled=var('sap_using_tvagt', True)) }}

with base as (
    select *
    from {{ ref('stg_sap__tvagt_tmp') }}
),

fields as (
    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_sap__tvagt_tmp')),
                staging_columns=get_tvagt_columns()
            )
        }}
    from base
),

final as (
    select
        abgru,
        bezei,
        mandt,
        spras
    from fields
)

select *
from final
