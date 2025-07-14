{{ config(enabled=var('sap_using_lfa1', True)) }}

{% set source_columns = adapter.get_columns_in_relation(ref('stg_sap__lfa1_tmp')) %}

with base as (

    select {{ remove_slashes_from_col_names(source_columns) }}
    from {{ ref('stg_sap__lfa1_tmp') }}
),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=source_columns,
                staging_columns=get_lfa1_columns()
            )
        }}
    from base
),

final as (
    
    select
        cast(mandt as {{ dbt.type_string() }}) as mandt,
        lifnr,
        brsch,
        ktokk,
        land1,
        loevm,
        name1,
        name2,
        name3,
        ort01,
        ort02,
        pfach,
        pstl2,
        pstlz,
        regio,
        sortl,
        spras,
        stcd1,
        stcd2,
        stcd3,
        stras,
        telf1,
        telfx,
        xcpdk,
        vbund,
        kraus,
        pfort,
        werks
    from fields
)

select *
from final