{{ config(enabled=var('sap_using_lfa1', True)) }}

{% set source_columns = adapter.get_columns_in_relation(ref('stg_sap__lfa1_tmp')) %}

with base as (

    select {{ remove_slashes_from_col_names(source_columns) }}
    from {{ ref('stg_sap__lfa1_tmp') }}
),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=source_columns,
                staging_columns=get_lfa1_columns()
            )
        }}
    from base
),

final as (
    
    select
        cast(mandt as {{ dbt.type_string() }}) as mandt,
        lifnr,
        land1,
        name1,
        name2,
        name3,
        name4,
        ort01,
        ort02,
        pfach,
        pstl2,
        pstlz,
        regio,
        sortl,
        stras,
        adrnr,
        mcod1,
        mcod2,
        mcod3,
        anred,
        bahns,
        bbbnr,
        bbsnr,
        begru,
        brsch,
        bubkz,
        datlt,
        dtams,
        dtaws,
        erdat,
        ernam,
        esrnr,
        konzs,
        ktokk,
        kunnr,
        lnrza,
        loevm,
        sperr,
        sperm,
        spras,
        stcd1,
        stcd2,
        stkza,
        stkzu,
        telbx,
        telf1,
        telf2,
        telfx,
        teltx,
        telx1,
        xcpdk,
        xzemp,
        vbund,
        fiskn,
        stceg,
        stkzn,
        sperq,
        gbort,
        gbdat,
        sexkz,
        kraus,
        revdb,
        qssys,
        ktock,
        pfort,
        werks,
        ltsna,
        werkr,
        plkal,
        duefl,
        txjcd,
        sperz,
        scacd,
        sfrgr,
        lzone,
        xlfza,
        dlgrp,
        fityp,
        stcdt,
        regss,
        actss,
        stcd3,
        stcd4,
        stcd5,
        ipisp,
        taxbs,
        profs,
        stgdl,
        emnfr,
        lfurl,
        j_1kfrepre,
        j_1kftbus,
        j_1kftind,
        confs,
        updat,
        uptim,
        nodel,
        qssysdat,
        podkzb,
        fisku,
        stenr,
        carrier_conf,
        min_comp,
        term_li,
        crc_num,
        cvp_xblck,
        rg,
        exp,
        uf,
        rgdate,
        ric,
        rne,
        rnedate,
        cnae,
        legalnat,
        crtn,
        icmstaxpay,
        indtyp,
        tdt,
        comsize,
        decregpc,
        j_sc_capital,
        j_sc_currency,
        alc,
        pmt_office,
        ppa_relevant,
        psofg,
        psois,
        pson1,
        pson2,
        pson3,
        psovn,
        psotl,
        psohs,
        psost,
        transport_chain,
        staging_time,
        scheduling_type,
        submi_relevant,
        _fivetran_deleted,
        _fivetran_synced,
        _fivetran_rowid
    from fields
)

select *
from final