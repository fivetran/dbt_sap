{{ config(enabled=var('sap_using_dd07t', True)) }}

{% set source_columns = adapter.get_columns_in_relation(ref('stg_sap__dd07t_tmp')) %}

with base as (
    select {{ remove_slashes_from_col_names(source_columns) }}
    from {{ ref('stg_sap__dd07t_tmp') }}
),

fields as (
    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=source_columns,
                staging_columns=get_dd07t_columns()
            )
        }}
    from base
),

final as (
    select
        as4local,
        as4vers,
        ddlanguage,
        ddtext,
        domname,
        domvalue_l,
        valpos,
        hvr_change_time
    from fields
)

select *
from final
