{{ config(enabled=var('sap_using_sapsll_nosca', True)) }}

{% set source_columns = adapter.get_columns_in_relation(ref('stg_sap__sapsll_nosca_tmp')) %}

with base as (
    select {{ remove_slashes_from_col_names(source_columns) }}
    from {{ ref('stg_sap__sapsll_nosca_tmp') }}
),

fields as (
    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=source_columns,
                staging_columns=get_sapsll_nosca_columns()
            )
        }}
    from base
),

final as (
    select
        cast(stcts as {{ dbt.type_string() }}) as stcts,
        cast(datab as {{ dbt.type_string() }}) as datab,
        cast(datbi as {{ dbt.type_string() }}) as datbi,
        cast(mandt as {{ dbt.type_string() }}) as mandt,
        cast(nosct as {{ dbt.type_string() }}) as nosct
    from fields
)

select *
from final
