{{ config(enabled=var('sap_using_ekbe', True)) }}

{% set source_columns = adapter.get_columns_in_relation(ref('stg_sap__ekbe_tmp')) %}

with base as (
    select {{ remove_slashes_from_col_names(source_columns) }}
    from {{ ref('stg_sap__ekbe_tmp') }}
),

fields as (
    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=source_columns,
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
        cast(ebeln as {{ dbt.type_string() }}) as ebeln,
        cast(ebelp as {{ dbt.type_string() }}) as ebelp,
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
        cast(mandt as {{ dbt.type_string() }}) as mandt,
        cast(matnr as {{ dbt.type_string() }}) as matnr,
        cast(menge as {{ dbt.type_numeric() }}) as menge,
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
        cast(shkzg as {{ dbt.type_string() }}) as shkzg,
        srvpos,
        vbeln_st,
        vbelp_st,
        cast(vgabe as {{ dbt.type_string() }}) as vgabe,
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
