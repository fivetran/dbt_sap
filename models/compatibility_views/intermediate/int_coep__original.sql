{{ config(enabled=(var('sap_using_coep', True) and var('sap_using_prps', True) and var('sap_using_acdoca', True) and var('sap_using_finsc_cmp_versnd', True) and var('sap_using_tka01', True))) }}

with coep_base as (

    select *
    from {{ ref('stg_sap__coep') }}

),

prps_base as (

    select *
    from {{ ref('stg_sap__prps') }}

),

acdoca_final as (

    select *
    from {{ ref('int_coep__acdoca_final') }}

)

select
    c.mandt as mandt,
    c.kokrs,
    c.belnr,
    c.buzei,
    c.perio,
    c.wtgbtr,
    c.wogbtr,
    c.wkgbtr,
    c.wkfbtr,
    c.pagbtr,
    c.pafbtr,
    c.megbtr,
    c.mefbtr,
    c.mbgbtr,
    c.mbfbtr,
    c.lednr,
    c.objnr as objnr,
    c.gjahr,
    c.wrttp,
    c.versn,
    c.kstar,
    c.hrkft,
    c.vrgng,
    c.parob,
    c.parob1,
    c.uspob,
    c.vbund,
    c.pargb,
    c.beknz,
    c.twaer,
    c.owaer,
    c.meinh,
    c.meinb,
    c.muvflg as mvflg,
    c.sgtxt,
    c.refbz,
    c.zlenr,
    c.bw_refbz,
    c.gkont,
    c.gkoar,
    c.werks as werks,
    c.matnr as matnr,
    c.rbest,
    c.ebeln,
    c.ebelp,
    c.zekkn,
    c.erlkz,
    c.pernr,
    cast('00' as {{ dbt.type_string() }}) as btrkl,
    c.paobjnr,
    c.beltp,
    c.bukrs,
    c.gsber,
    c.fkber,
    c.scope as scope,
    c.logsyso,
    c.pkstar,
    c.pbukrs,
    c.pfkber,
    c.pscope,
    c.logsysp,
    c.dabrz,
    c.bwstrat,
    c.objnr_hk,
    c.timestmp,
    c.qmnum,
    c.geber,
    c.pgeber,
    c.grant_nbr,
    c.pgrant_nbr,
    c.refbz_fi,
    c.segment,
    c.psegment,
    c.posnr,
    c.prctr as prctr,
    c.pprct,
    c.budget_pd,
    c.pbudget_pd,
    c.prodper,
    c.awtyp,
    c.awkey,
    c.awsys,
    c.kwaer,
    c.kostl as kostl,
    c.lstar,
    c.aufnr,
    c.autyp,
    c.pspnr as pspnr,
    c.pspid,
    c.vbeln,
    c.vbposnr,
    c.ce4key,
    case
        when (c.accasty is null or c.accasty = '') then rtrim(substring(c.objnr, 1, 2))
        else c.accasty
    end as accasty,
    c.accas,
    case
        when not (cast(c.objnr_n1 as {{ dbt.type_string() }}) = '') then (
            case
                when c.objnr_n1 like 'KS%' then replace(rtrim(replace(rtrim(concat(rtrim(concat('KS', rtrim(substring(concat(rtrim(c.kokrs), '€€€€'), 1, 4)))), rtrim(c.kostl))), rtrim('€'), rtrim(' €'))), rtrim('€'), rtrim(''))
                when c.objnr_n1 like 'KL%' then replace(rtrim(replace(rtrim(concat(rtrim(concat(rtrim(concat('KL', rtrim(substring(concat(rtrim(c.kokrs), '€€€€'), 1, 4)))), rtrim(substring(concat(rtrim(c.kostl), '€€€€€€€€€€'), 1, 10)))), rtrim(c.lstar))), rtrim('€'), rtrim(' €'))), rtrim('€'), rtrim(''))
                when c.objnr_n1 like 'OR%' then concat('OR', rtrim(c.aufnr))
                when c.objnr_n1 like 'PR%' then coalesce(p.objnr, cast('' as {{ dbt.type_string() }}))
                else cast('' as {{ dbt.type_string() }})
            end
        )
        else cast('' as {{ dbt.type_string() }})
    end as objnr_n1,
    case
        when not (cast(c.objnr_n2 as {{ dbt.type_string() }}) = '') then (
            case
                when c.objnr_n2 like 'KS%' then replace(rtrim(replace(rtrim(concat(rtrim(concat('KS', rtrim(substring(concat(rtrim(c.kokrs), '€€€€'), 1, 4)))), rtrim(c.kostl))), rtrim('€'), rtrim(' €'))), rtrim('€'), rtrim(''))
                when c.objnr_n2 like 'KL%' then replace(rtrim(replace(rtrim(concat(rtrim(concat(rtrim(concat('KL', rtrim(substring(concat(rtrim(c.kokrs), '€€€€'), 1, 4)))), rtrim(substring(concat(rtrim(c.kostl), '€€€€€€€€€€'), 1, 10)))), rtrim(c.lstar))), rtrim('€'), rtrim(' €'))), rtrim('€'), rtrim(''))
                when c.objnr_n2 like 'OR%' then concat('OR', rtrim(c.aufnr))
                when c.objnr_n2 like 'PR%' then coalesce(p.objnr, cast('' as {{ dbt.type_string() }}))
                else cast('' as {{ dbt.type_string() }})
            end
        )
        else cast('' as {{ dbt.type_string() }})
    end as objnr_n2,
    case
        when not (cast(c.objnr_n3 as {{ dbt.type_string() }}) = '') then (
            case
                when c.objnr_n3 like 'KS%' then replace(rtrim(replace(rtrim(concat(rtrim(concat('KS', rtrim(substring(concat(rtrim(c.kokrs), '€€€€'), 1, 4)))), rtrim(c.kostl))), rtrim('€'), rtrim(' €'))), rtrim('€'), rtrim(''))
                when c.objnr_n3 like 'KL%' then replace(rtrim(replace(rtrim(concat(rtrim(concat(rtrim(concat('KL', rtrim(substring(concat(rtrim(c.kokrs), '€€€€'), 1, 4)))), rtrim(substring(concat(rtrim(c.kostl), '€€€€€€€€€€'), 1, 10)))), rtrim(c.lstar))), rtrim('€'), rtrim(' €'))), rtrim('€'), rtrim(''))
                when c.objnr_n3 like 'OR%' then concat('OR', rtrim(c.aufnr))
                when c.objnr_n3 like 'PR%' then coalesce(p.objnr, cast('' as {{ dbt.type_string() }}))
                else cast('' as {{ dbt.type_string() }})
            end
        )
        else cast('' as {{ dbt.type_string() }})
    end as objnr_n3,
    c.erkrs,
    c.paccas,
    c.paccasty,
    c.pkostl,
    c.plstar,
    c.paufnr,
    c.pautyp,
    c.ppspnr,
    c.ppspid,
    c.pvbeln,
    c.pvbposnr,
    c.pce4key,
    c.quant1,
    c.quant2,
    c.quant3,
    c.qunit1,
    c.qunit2,
    c.qunit3

from acdoca_final as c
left outer join prps_base as p
    on cast(p.mandt as {{ dbt.type_string() }}) = cast(c.mandt as {{ dbt.type_string() }})
    and cast(p.posid as {{ dbt.type_string() }}) = cast(c.pspnr as {{ dbt.type_string() }})
    and cast(c.mandt as {{ dbt.type_string() }}) = cast(p.mandt as {{ dbt.type_string() }})