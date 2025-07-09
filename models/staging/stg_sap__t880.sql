{{ config(enabled=var('sap_using_t880', True)) }}

{% set source_columns = adapter.get_columns_in_relation(ref('stg_sap__t880_tmp')) %}

with base as (

    select {{ remove_slashes_from_col_names(source_columns) }}
    from {{ ref('stg_sap__t880_tmp') }}
),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=source_columns,
                staging_columns=get_t880_columns()
            )
        }}
    from base
),

final as (

    select
        _fivetran_deleted,
        _fivetran_rowid,
        _fivetran_synced,
        city,
        cntry,
        curr,
        glsip,
        indpo,
        langu,
        lccomp,
        cast(mandt as {{ dbt.type_string() }}) as mandt,
        mclnt,
        mcomp,
        modcp,
        name1,
        name2,
        pobox,
        pstlc,
        rcomp,
        resta,
        rform,
        stret,
        strt2,
        zweig
    from fields
)

select * 
from final