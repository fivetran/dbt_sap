{{ config(enabled=var('sap_using_t134', True)) }}

{% set source_columns = adapter.get_columns_in_relation(ref('stg_sap__t134_tmp')) %}

with base as (
    select {{ remove_slashes_from_col_names(source_columns) }}
    from {{ ref('stg_sap__t134_tmp') }}
),

fields as (
    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=source_columns,
                staging_columns=get_t134_columns()
            )
        }}
    from base
),

final as (
    select
        aranz,
        ardel,
        begru,
        bsext,
        bsint,
        cchis,
        chneu,
        class,
        ctype,
        ekalr,
        envop,
        flref,
        hvr_change_time,
        hvr_is_deleted,
        izust,
        kkref,
        kzgrp,
        kzkfg,
        kzmpn,
        kzpip,
        kzprc,
        kzrac,
        kzvpr,
        cast(mandt as {{ dbt.type_string() }}) as mandt,
        mbref,
        mstae,
        mtart,
        mtref,
        numke,
        numki,
        prdru,
        pstat,
        vmtpo,
        vnumke,
        vnumki,
        vprsv,
        vtype,
        wmakg,
        _fivetran_deleted,
        _fivetran_synced,
        _fivetran_rowid
    from fields
)

select *
from final
