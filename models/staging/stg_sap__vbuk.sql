{{ config(enabled=var('sap_using_vbuk', True)) }}

{% set source_columns = adapter.get_columns_in_relation(ref('stg_sap__vbuk_tmp')) %}

with base as (
    select {{ remove_slashes_from_col_names(source_columns) }}
    from {{ ref('stg_sap__vbuk_tmp') }}
),

fields as (
    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=source_columns,
                staging_columns=get_vbuk_columns()
            )
        }}
    from base
),

final as (
    select
        cast(mandt as {{ dbt.type_string() }}) as mandt,
        aedat,
        cast(vbeln as {{ dbt.type_string() }}) as vbeln,
        rfstk,
        rfgsk,
        bestk,
        lfstk,
        lfgsk,
        wbstk,
        fkstk,
        fksak,
        buchk,
        abstk,
        gbstk,
        kostk,
        lvstk,
        uvals,
        uvvls,
        uvfas,
        uvall,
        uvvlk,
        uvfak,
        uvprs,
        vbtyp,
        vbobj,
        fkivk,
        relik,
        uvk01,
        uvk02,
        uvk03,
        uvk04,
        uvk05,
        uvs01,
        uvs02,
        uvs03,
        uvs04,
        uvs05,
        pkstk,
        cmpsa,
        cmpsb,
        cmpsc,
        cmpsd,
        cmpse,
        cmpsf,
        cmpsg,
        cmpsh,
        cmpsi,
        cmpsj,
        cmpsk,
        cmpsl,
        cmps0,
        cmps1,
        cmps2,
        cmgst,
        trsta,
        koquk,
        costa,
        saprl,
        uvpas,
        uvpis,
        uvwas,
        uvpak,
        uvpik,
        uvwak,
        uvgek,
        cmpsm,
        dcstk,
        vestk,
        vlstk,
        rrsta,
        block,
        fsstk,
        lsstk,
        spstg,
        pdstk,
        fmstk,
        manek,
        spe_tmpid,
        hdall,
        hdals,
        cmps_cm,
        cmps_te,
        vbtyp_ext,
        fsh_ar_stat_hdr,
        hvr_is_deleted,
        hvr_change_time,
        _fivetran_deleted,
        _fivetran_rowid,
        _fivetran_synced
    from fields
)

select *
from final
