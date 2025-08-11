{{ config(enabled=var('sap_using__sapsll_clsnr', True)) }}

{% set source_columns = adapter.get_columns_in_relation(ref('stg_sap___sapsll_clsnr_tmp')) %}

with base as (
    select {{ remove_slashes_from_col_names(source_columns) }}
    from {{ ref('stg_sap___sapsll_clsnr_tmp') }}
),

fields as (
    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=source_columns,
                staging_columns=get__sapsll_clsnr_columns()
            )
        }}
    from base
),

final as (
    select
        nosct,
        ccngn,
        datab,
        datbi,
        mandt,
        bemeh
    from fields
)

select *
from final
