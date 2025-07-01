{{ config(enabled=var('sap_using_ekbe', True)) }}

with base as (
    select *
    from {{ ref('stg_sap__ekbe_tmp') }}
),

fields as (
    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_sap__ekbe_tmp')),
                staging_columns=get_ekbe_columns()
            )
        }}
    from base
),

final as (
    select
        arewb,
        arewr,
        arewr_pop,
        areww,
        bamng,
        bekkn,
        belnr,
        bewtp,
        bldat,
        bpmng,
        bpmng_pop,
        bpweb,
        bpwes,
        budat,
        buzei,
        bwart,
        bwtar,
        charg,
        cpudt,
        cputm,
        dmbtr,
        dmbtr_pop,
        ebeln,
        ebelp,
        elikz,
        ematn,
        ernam,
        et_upd,
        etens,
        evere,
        fsh_collection,
        fsh_season,
        fsh_season_year,
        fsh_theme,
        gjahr,
        grund,
        hswae,
        hvr_change_time,
        hvr_is_deleted,
        introw,
        inv_item_origin,
        j_sc_die_comp_f,
        knumv,
        kudif,
        lemin,
        lfbnr,
        lfgja,
        lfpos,
        lsmeh,
        lsmng,
        mandt,
        matnr,
        menge,
        menge_pop,
        mwskz,
        packno,
        reewr,
        refwr,
        retamt_fc,
        retamt_lc,
        retamtp_fc,
        retamtp_lc,
        rewrb,
        saprl,
        sgt_scat,
        shkzg,
        srvpos,
        vbeln_st,
        vbelp_st,
        vgabe,
        waers,
        weora,
        werks,
        wesbb,
        wesbs,
        wkurs,
        wrbtr,
        wrbtr_pop,
        wrf_charstc1,
        wrf_charstc2,
        wrf_charstc3,
        xblnr,
        xmacc,
        xunpl,
        xwoff,
        xwsbr,
        zekkn
    from fields
)

select *
from final
