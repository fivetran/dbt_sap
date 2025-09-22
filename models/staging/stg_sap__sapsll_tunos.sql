{{ config(enabled=var('sap_using_sapsll_tunos', True)) }}

{% set source_columns = adapter.get_columns_in_relation(ref('stg_sap__sapsll_tunos_tmp')) %}

with base as (
    select {{ remove_slashes_from_col_names(source_columns) }}
    from {{ ref('stg_sap__sapsll_tunos_tmp') }}
),

fields as (
    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=source_columns,
                staging_columns=get_sapsll_tunos_columns()
            )
        }}
    from base
),

final as (
    select
        cast(mandt as {{ dbt.type_string() }}) as mandt,
        cast(land1 as {{ dbt.type_string() }}) as land1,
        cast(ctsty as {{ dbt.type_string() }}) as ctsty,
        cast(stcts as {{ dbt.type_string() }}) as stcts
    from fields
)

select *
from final
