{{ config(enabled=var('sap_using__sapsll_maritc', True)) }}

{% set source_columns = adapter.get_columns_in_relation(ref('stg_sap___sapsll_maritc_tmp')) %}

with base as (
    select {{ remove_slashes_from_col_names(source_columns) }}
    from {{ ref('stg_sap___sapsll_maritc_tmp') }}
),

fields as (
    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=source_columns,
                staging_columns=get__sapsll_maritc_columns()
            )
        }}
    from base
),

final as (
    select
        mandt,
        matnr,
        stcts,
        datab,
        datbi,
        ccngn
    from fields
)

select *
from final
