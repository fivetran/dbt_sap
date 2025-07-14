{{ config(enabled=var('sap_using_dd07l', True)) }}

{% set source_columns = adapter.get_columns_in_relation(ref('stg_sap__dd07l_tmp')) %}

with base as (
    select {{ remove_slashes_from_col_names(source_columns) }}
    from {{ ref('stg_sap__dd07l_tmp') }}
),

fields as (
    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=source_columns,
                staging_columns=get_dd07l_columns()
            )
        }}
    from base
),

final as (
    select
        as4local,
        as4vers,
        domname,
        valpos,
        domvalue_l,
        hvr_change_time,
        _fivetran_deleted,
        _fivetran_rowid,
        _fivetran_synced
    from fields
)

select *
from final
