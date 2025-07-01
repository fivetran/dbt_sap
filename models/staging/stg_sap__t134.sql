{{ config(enabled=var('sap_using_t134', True)) }}

with base as (
    select *
    from {{ ref('stg_sap__t134_tmp') }}
),

fields as (
    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_sap__t134_tmp')),
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
        mandt,
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
        wmakg
    from fields
)

select *
from final
