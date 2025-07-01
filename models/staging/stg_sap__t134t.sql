{{ config(enabled=var('sap_using_t134t', True)) }}

with base as (
    select *
    from {{ ref('stg_sap__t134t_tmp') }}
),

fields as (
    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_sap__t134t_tmp')),
                staging_columns=get_t134t_columns()
            )
        }}
    from base
),

final as (
    select
        mandt,
        mtart,
        mtbez,
        spras
    from fields
)

select *
from final
