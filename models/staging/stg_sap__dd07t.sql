{{ config(enabled=var('sap_using_dd07t', True)) }}

with base as (
    select *
    from {{ ref('stg_sap__dd07t_tmp') }}
),

fields as (
    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_sap__dd07t_tmp')),
                staging_columns=get_dd07t_columns()
            )
        }}
    from base
),

final as (
    select
        domname,
        domvalue_l,
        as4vers,
        ddlanguage,
        ddtext,
        hvr_change_time
    from fields
)

select *
from final
