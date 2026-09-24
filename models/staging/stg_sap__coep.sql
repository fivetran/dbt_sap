{{ config(enabled=var('sap_using_coep', True)) }}

{% set source_columns = adapter.get_columns_in_relation(ref('stg_sap__coep_tmp')) %}

with base as (

    select {{ remove_slashes_from_col_names(source_columns) }}
    from {{ ref('stg_sap__coep_tmp') }}
),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=source_columns,
                staging_columns=get_coep_columns()
            )
        }}
    from base
),

final as (

    select
        _fivetran_synced,
        _fivetran_sap_archived,
        mandt,
        kokrs,
        belnr,
        buzei,
        perio,
        wtgbtr,
        wogbtr,
        wkgbtr,
        wkfbtr,
        pagbtr,
        pafbtr,
        megbtr,
        mefbtr,
        mbgbtr,
        mbfbtr,
        lednr,
        objnr,
        gjahr,
        cast(wrttp as {{ dbt.type_string() }}) as wrttp,
        versn,
        kstar,
        hrkft,
        vrgng,
        parob,
        parob1,
        uspob,
        vbund,
        pargb,
        beknz,
        twaer,
        owaer,
        meinh,
        meinb,
        mvflg,
        sgtxt,
        refbz,
        zlenr,
        bw_refbz,
        gkont,
        gkoar,
        werks,
        matnr,
        rbest,
        ebeln,
        ebelp,
        zekkn,
        erlkz,
        pernr,
        btrkl,
        cast(objnr_n1 as {{ dbt.type_string() }}) as objnr_n1,
        cast(objnr_n2 as {{ dbt.type_string() }}) as objnr_n2,
        cast(objnr_n3 as {{ dbt.type_string() }}) as objnr_n3,
        paobjnr,
        beltp,
        bukrs,
        gsber,
        fkber,
        scope,
        logsyso,
        pkstar,
        pbukrs,
        pfkber,
        pscope,
        logsysp,
        dabrz,
        bwstrat,
        objnr_hk,
        timestmp,
        qmnum,
        geber,
        pgeber,
        grant_nbr,
        pgrant_nbr,
        refbz_fi,
        segment,
        psegment,
        posnr,
        prctr,
        pprct,
        budget_pd,
        pbudget_pd,
        prodper,
        awtyp,
        awkey,
        awsys,
        kwaer,
        accas,
        accasty,
        kostl,
        lstar,
        aufnr,
        autyp,
        pspnr,
        pspid,
        vbeln,
        vbposnr,
        ce4key,
        erkrs,
        paccas,
        paccasty,
        pkostl,
        plstar,
        paufnr,
        pautyp,
        ppspnr,
        ppspid,
        pvbeln,
        pvbposnr,
        pce4key,
        quant1,
        quant2,
        quant3,
        qunit1,
        qunit2,
        qunit3

    from fields
    where not coalesce(_fivetran_deleted, false)
)

select * from final