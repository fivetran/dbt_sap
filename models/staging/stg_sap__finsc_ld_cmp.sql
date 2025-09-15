{{ config(enabled=var('sap_using_finsc_ld_cmp', True)) }}

{% set source_columns = adapter.get_columns_in_relation(ref('stg_sap__finsc_ld_cmp_tmp')) %}

with base as (
    select {{ remove_slashes_from_col_names(source_columns) }}
    from {{ ref('stg_sap__finsc_ld_cmp_tmp') }}
),

fields as (
    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=source_columns,
                staging_columns=get_finsc_ld_cmp_columns()
            )
        }}
    from base
),

final as (
    select
        curposk,
        curposo,
        curposv,
        curposb,
        curposc,
        curposd,
        curpose,
        curposf,
        curposg,
        cast(mandt as {{ dbt.type_string() }}) as mandt,
        cast(bukrs as {{ dbt.type_string() }}) as bukrs,
        cast(rldnr as {{ dbt.type_string() }}) as rldnr
    from fields
)

select *
from final
