{{ config(enabled=var('sap_using_tvag', True)) }}

with base as (
    select *
    from {{ ref('stg_sap__tvag_tmp') }}
),

fields as (
    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_sap__tvag_tmp')),
                staging_columns=get_tvag_columns()
            )
        }}
    from base
),

final as (
    select
        abgru,
        dragr,
        ep_off,
        fk_erl,
        fsh_pqr_spec,
        hvr_change_time,
        hvr_is_deleted,
        kowrr,
        mandt
    from fields
)

select *
from final
