{{ config(enabled=var('sap_using_ekpo', True)) }}

with base as (
    select *
    from {{ ref('stg_sap__ekpo_tmp') }}
),

fields as (
    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_sap__ekpo_tmp')),
                staging_columns=get_ekpo_columns()
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
