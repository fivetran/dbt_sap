{{ config(enabled=var('sap_using_anla', True)) }}

{% set source_columns = adapter.get_columns_in_relation(ref('stg_sap__anla_tmp')) %}

with base as (

    select {{ remove_slashes_from_col_names(source_columns) }}
    from {{ ref('stg_sap__anla_tmp') }}
),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=source_columns,
                staging_columns=get_anla_columns()
            )
        }}
    from base
),

final as (

    select
        _fivetran_deleted,
        _fivetran_synced,
        cast(mandt as {{ dbt.type_string() }}) as mandt,
        cast(bukrs as {{ dbt.type_string() }}) as bukrs,
        cast(anln1 as {{ dbt.type_string() }}) as anln1,
        cast(anln2 as {{ dbt.type_string() }}) as anln2,
        cast(ktogr as {{ dbt.type_string() }}) as ktogr
    from fields
    where not coalesce(_fivetran_deleted, false)
)

select *
from final
