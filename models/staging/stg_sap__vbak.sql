{{ config(enabled=var('sap_using_vbak', True)) }}

with base as (
    select *
    from {{ ref('stg_sap__vbak_tmp') }}
),

fields as (
    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_sap__vbak_tmp')),
                staging_columns=get_vbak_columns()
            )
        }}
    from base
),

final as (
    select *
    from fields
)

select *
from final