{{ config(enabled=var('sap_using_vbup', True)) }}

with base as (
    select *
    from {{ ref('stg_sap__vbup_tmp') }}
),

fields as (
    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_sap__vbup_tmp')),
                staging_columns=get_vbup_columns()
            )
        }}
    from base
),

final as (
    select
        _fivetran_deleted,
        _fivetran_synced,
        _fivetran_sap_archived,
        cast(mandt as {{ dbt.type_string() }}) as mandt,
        cast(posnr as {{ dbt.type_string() }}) as posnr,
        cast(vbeln as {{ dbt.type_string() }}) as vbeln,
        uvpak,
        uvvlk,
        mill_vs_vssta,
        pksta,
        lssta,
        vlstp,
        absta,
        fksta,
        fkivp,
        lfgsa,
        rrsta,
        lfsta,
        fksaa,
        wbsta,
        ltsps,
        costa,
        fssta,
        kosta,
        uvpik,
        uvfak,
        uvall,
        rfgsa,
        uvprs,
        lvsta,
        rfsta,
        cmppj,
        cmppi,
        hdall,
        besta,
        pdsta,
        fsh_ar_stat_itm,
        manek,
        gbsta,
        uvwak,
        dcsta,
        uvp05,
        uvp02,
        uvp04,
        koqua,
        uvp01,
        uvp03
    from fields
)

select *
from final
