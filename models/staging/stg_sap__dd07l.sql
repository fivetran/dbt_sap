{{ config(enabled=var('sap_using_dd07l', True)) }}

with base as (
    select *
    from {{ ref('stg_sap__dd07l_tmp') }}
),

fields as (
    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_sap__dd07l_tmp')),
                staging_columns=get_dd07l_columns()
            )
        }}
    from base
),

final as (
    select
        domvalue_l,
        domname,
        as4vers,
        hvr_change_time
    from fields
)

select *
from final
