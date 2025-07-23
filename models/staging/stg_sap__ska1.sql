{{ config(enabled=var('sap_using_ska1', True)) }}

{% set source_columns = adapter.get_columns_in_relation(ref('stg_sap__ska1_tmp')) %}

with base as (

    select {{ remove_slashes_from_col_names(source_columns) }}
    from {{ ref('stg_sap__ska1_tmp') }}
),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=source_columns,
                staging_columns=get_ska1_columns()
            )
        }}
    from base
),

final as (
    
    select 
        cast(mandt as {{ dbt.type_string() }}) as mandt,
        ktopl,
        saknr,
        bilkt,
        gvtyp,
        vbund,
        xbilk,
        sakan,
        erdat,
        ernam,
        ktoks,
        xloev,
        xspea,
        xspeb,
        xspep,
        func_area,
        mustr,	
        _fivetran_rowid,
        _fivetran_deleted,
        _fivetran_synced
    from fields
)

select *
from final
