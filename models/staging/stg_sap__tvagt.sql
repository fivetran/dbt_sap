{{ config(enabled=var('sap_using_tvagt', True)) }}

{% set source_columns = adapter.get_columns_in_relation(ref('stg_sap__tvagt_tmp')) %}

with base as (
    select {{ remove_slashes_from_col_names(source_columns) }}
    from {{ ref('stg_sap__tvagt_tmp') }}
),

fields as (
    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=source_columns,
                staging_columns=get_tvagt_columns()
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
        bezei,
        cast(mandt as {{ dbt.type_string() }}) as mandt,
        spras
    from fields
)

select *
from final
