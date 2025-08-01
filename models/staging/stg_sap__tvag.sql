{{ config(enabled=var('sap_using_tvag', True)) }}

{% set source_columns = adapter.get_columns_in_relation(ref('stg_sap__tvag_tmp')) %}

with base as (
    select {{ remove_slashes_from_col_names(source_columns) }}
    from {{ ref('stg_sap__tvag_tmp') }}
),

fields as (
    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=source_columns,
                staging_columns=get_tvag_columns()
            )
        }}
    from base
),

final as (
    select
        _fivetran_deleted,
        _fivetran_rowid,
        _fivetran_synced,
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
