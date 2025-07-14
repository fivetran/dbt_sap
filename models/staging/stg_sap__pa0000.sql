{{ config(enabled=var('sap_using_pa0000', True)) }}

{% set source_columns = adapter.get_columns_in_relation(ref('stg_sap__pa0000_tmp')) %}

with base as (

    select {{ remove_slashes_from_col_names(source_columns) }}
    from {{ ref('stg_sap__pa0000_tmp') }}
),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=source_columns,
                staging_columns=get_pa0000_columns()
            )
        }}
    from base
),

final as (
    
    select
        cast(mandt as {{ dbt.type_string() }}) as mandt,
        pernr,
        subty,
        objps,
        sprps,
        endda,
        begda,
        seqnr,
        aedtm,
        flag1,
        flag2,
        flag3,
        flag4,
        grpvl,
        histo,
        itbld,
        itxex,
        massg,
        massn,
        ordex,
        preas,
        refex,
        rese1,
        rese2,
        stat1,
        stat2,
        stat3,
        uname
    from fields
)

select *
from final