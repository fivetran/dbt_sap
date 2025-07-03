{{ config(enabled=var('sap_using_makt', True)) }}

{% set source_columns = adapter.get_columns_in_relation(ref('stg_sap__makt_tmp')) %}

with base as (
    select {{ remove_slashes_from_col_names(source_columns) }}
    from {{ ref('stg_sap__makt_tmp') }}
),

fields as (
    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=source_columns,
                staging_columns=get_makt_columns()
            )
        }}
    from base
),

final as (
    select
        maktx,
        cast(mandt as {{ dbt.type_string() }}) as mandt,
        cast(matnr as {{ dbt.type_string() }}) as matnr,
        spras
    from fields
)

select *
from final

