{{ config(enabled=var('sap_using_t000', True)) }}

{% set source_columns = adapter.get_columns_in_relation(ref('stg_sap__t000_tmp')) %}

with base as (
    select {{ remove_slashes_from_col_names(source_columns) }}
    from {{ ref('stg_sap__t000_tmp') }}
),

fields as (
    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=source_columns,
                staging_columns=get_t000_columns()
            )
        }}
    from base
),

final as (
    select
        cast(mandt as {{ dbt.type_string() }}) as mandt,
        cast(logsys as {{ dbt.type_string() }}) as logsys,
        _fivetran_deleted,
        _fivetran_synced
    from fields
)

select *
from final
