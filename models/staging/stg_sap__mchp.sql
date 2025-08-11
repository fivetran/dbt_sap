{{ config(enabled=var('sap_using_mchp', True)) }}

{% set source_columns = adapter.get_columns_in_relation(ref('stg_sap__mchp_tmp')) %}

with base as (
    select {{ remove_slashes_from_col_names(source_columns) }}
    from {{ ref('stg_sap__mchp_tmp') }}
),

fields as (
    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=source_columns,
                staging_columns=get_mchp_columns()
            )
        }}
    from base
),

final as (
    select
    *
    from fields
)

select *
from final
