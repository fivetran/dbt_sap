{{ config(enabled=var('sap_using_t503', True)) }}

{% set source_columns = adapter.get_columns_in_relation(ref('stg_sap__t503_tmp')) %}

with base as (

    select {{ remove_slashes_from_col_names(source_columns) }}
    from {{ ref('stg_sap__t503_tmp') }}
),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=source_columns,
                staging_columns=get_t503_columns()
            )
        }}
    from base
),

final as (

    select    
        cast(mandt as {{ dbt.type_string() }}) as mandt,
        persg,
        persk,
        abart,
        abtyp,
        aksta,
        ansta,
        antyp,
        austa,
        burkz,
        inwid,
        konty,
        molga,
        trfkz,
        typsz,
        zeity
    from fields
)

select * 
from final