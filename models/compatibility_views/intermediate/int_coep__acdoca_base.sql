{{ config(enabled=(var('sap_using_acdoca', True) and var('sap_using_finsc_cmp_versnd', True) and var('sap_using_tka01', True))) }}

with acdoca_base as (

    select *
    from {{ ref('stg_sap__acdoca') }}

),

finsc_cmp_versnd_base as (

    select *
    from {{ ref('stg_sap__finsc_cmp_versnd') }}

),

tka01_base as (

    select *
    from {{ ref('stg_sap__tka01') }}

),

v_coep_acdoca_r1 as (

    select
        a.rclnt as mandt,
        a.kokrs as kokrs,
        a.belnr as belnr,
        case
            when v.field_name_buzei = 'CO_BUZEI' then a.co_buzei
            when v.field_name_buzei = 'CO_BUZEI1' then a.co_buzei1
            when v.field_name_buzei = 'CO_BUZEI2' then a.co_buzei2
            when v.field_name_buzei = 'CO_BUZEI5' then a.co_buzei5
            when v.field_name_buzei = 'CO_BUZEI6' then a.co_buzei6
            when v.field_name_buzei = 'CO_BUZEI7' then a.co_buzei7
            else a.co_buzei
        end as buzei,
        a.rldnr as rldnr,
        v.versn as versn,
        a.budat,
        a.poper as perio,
        a.rwcur as twaer,
        case v.field_name_wtgbtr_add
            when 'WSL' then a.wsl
            when 'WSL2' then a.wsl2
            when 'WSL3' then a.wsl3
            else cast(0 as {{ dbt.type_numeric() }})
        end as wtgbtr_add,
        case v.field_name_wtgbtr_subtract
            when 'WSL' then a.wsl
            when 'WSL2' then a.wsl2
            when 'WSL3' then a.wsl3
            else cast(0 as {{ dbt.type_numeric() }})
        end as wtgbtr_subtract,
        case
            when (a.rocur is null or cast(a.rocur as {{ dbt.type_string() }}) = '' or cast(t.xwbuk as {{ dbt.type_string() }}) = 'X') then a.rhcur
            else a.rocur
        end as owaer,
        case
            when cast(v.set_to_zero as {{ dbt.type_string() }}) = 'X' then 0
            when v.field_name_wogbtr_add = 'CO_OSL' then a.co_osl
            when v.field_name_wogbtr_add = 'HSL' then a.hsl
            when v.field_name_wogbtr_add = 'OSL' then a.osl
            when v.field_name_wogbtr_add = 'VSL' then a.vsl
            when v.field_name_wogbtr_add = 'BSL' then a.bsl
            when v.field_name_wogbtr_add = 'CSL' then a.csl
            when v.field_name_wogbtr_add = 'DSL' then a.dsl
            when v.field_name_wogbtr_add = 'ESL' then a.esl
            when v.field_name_wogbtr_add = 'FSL' then a.fsl
            when v.field_name_wogbtr_add = 'GSL' then a.gsl
            when v.field_name_wogbtr_add = 'KSL' then a.ksl
            else cast(0 as {{ dbt.type_numeric() }})
        end as wogbtr_add,
        case v.field_name_wogbtr_subtract
            when 'HSL' then a.hsl
            when 'OSL' then a.osl
            when 'CO_OSL' then a.co_osl
            when 'VSL' then a.vsl
            when 'BSL' then a.bsl
            when 'CSL' then a.csl
            when 'DSL' then a.dsl
            when 'ESL' then a.esl
            when 'FSL' then a.fsl
            when 'GSL' then a.gsl
            when 'KSL' then a.ksl
            else cast(0 as {{ dbt.type_numeric() }})
        end as wogbtr_subtract,
        case
            when cast(v.set_to_zero as {{ dbt.type_string() }}) = 'X' then a.rkcur
            when v.field_name_wkgbtr_add = 'KSL' then a.rkcur
            when v.field_name_wkgbtr_add = 'OSL' then a.rocur
            when v.field_name_wkgbtr_add = 'VSL' then a.rvcur
            when v.field_name_wkgbtr_add = 'BSL' then a.rbcur
            when v.field_name_wkgbtr_add = 'CSL' then a.rccur
            when v.field_name_wkgbtr_add = 'DSL' then a.rdcur
            when v.field_name_wkgbtr_add = 'ESL' then a.recur
            when v.field_name_wkgbtr_add = 'FSL' then a.rfcur
            when v.field_name_wkgbtr_add = 'GSL' then a.rgcur
            when v.field_name_wkgbtr_add = 'HSL' then a.rhcur
            when v.field_name_wkgbtr_subtract = 'KSL' then a.rkcur
            when v.field_name_wkgbtr_subtract = 'OSL' then a.rocur
            when v.field_name_wkgbtr_subtract = 'VSL' then a.rvcur
            when v.field_name_wkgbtr_subtract = 'BSL' then a.rbcur
            when v.field_name_wkgbtr_subtract = 'CSL' then a.rccur
            when v.field_name_wkgbtr_subtract = 'DSL' then a.rdcur
            when v.field_name_wkgbtr_subtract = 'ESL' then a.recur
            when v.field_name_wkgbtr_subtract = 'FSL' then a.rfcur
            when v.field_name_wkgbtr_subtract = 'GSL' then a.rgcur
            when v.field_name_wkgbtr_subtract = 'HSL' then a.rhcur
            else cast('' as {{ dbt.type_string() }})
        end as kwaer,
        case v.field_name_wkgbtr_add
            when 'KSL' then a.ksl
            when 'OSL' then a.osl
            when 'VSL' then a.vsl
            when 'BSL' then a.bsl
            when 'CSL' then a.csl
            when 'DSL' then a.dsl
            when 'ESL' then a.esl
            when 'FSL' then a.fsl
            when 'GSL' then a.gsl
            when 'HSL' then a.hsl
            else cast(0 as {{ dbt.type_numeric() }})
        end as wkgbtr_add,
        case v.field_name_wkgbtr_subtract
            when 'KSL' then a.ksl
            when 'OSL' then a.osl
            when 'VSL' then a.vsl
            when 'BSL' then a.bsl
            when 'CSL' then a.csl
            when 'DSL' then a.dsl
            when 'ESL' then a.esl
            when 'FSL' then a.fsl
            when 'GSL' then a.gsl
            when 'HSL' then a.hsl
            else cast(0 as {{ dbt.type_numeric() }})
        end as wkgbtr_subtract,
        case v.field_name_wkfbtr_add
            when 'KFSL' then a.kfsl
            when 'KFSL2' then a.kfsl2
            when 'KFSL3' then a.kfsl3
            else cast(0 as {{ dbt.type_numeric() }})
        end as wkfbtr_add,
        case v.field_name_wkfbtr_subtract
            when 'KFSL' then a.kfsl
            when 'KFSL2' then a.kfsl2
            when 'KFSL3' then a.kfsl3
            else cast(0 as {{ dbt.type_numeric() }})
        end as wkfbtr_subtract,
        case v.field_name_pagbtr_add
            when 'PSL' then a.psl
            when 'PSL2' then a.psl2
            when 'PSL3' then a.psl3
            else cast(0 as {{ dbt.type_numeric() }})
        end as pagbtr_add,
        case v.field_name_pagbtr_subtract
            when 'PSL' then a.psl
            when 'PSL2' then a.psl2
            when 'PSL3' then a.psl3
            else cast(0 as {{ dbt.type_numeric() }})
        end as pagbtr_subtract,
        case v.field_name_pafbtr_add
            when 'PFSL' then a.pfsl
            when 'PFSL2' then a.pfsl2
            when 'PFSL3' then a.pfsl3
            else cast(0 as {{ dbt.type_numeric() }})
        end as pafbtr_add,
        case v.field_name_pafbtr_subtract
            when 'PFSL' then a.pfsl
            when 'PFSL2' then a.pfsl2
            when 'PFSL3' then a.pfsl3
            else cast(0 as {{ dbt.type_numeric() }})
        end as pafbtr_subtract,
        case
            when (cast(v.versn as {{ dbt.type_string() }}) = '000' and not (cast(v.set_to_zero as {{ dbt.type_string() }}) = 'X')) then a.co_megbtr
            else cast(0 as {{ dbt.type_numeric() }})
        end as megbtr,
        case
            when (cast(v.versn as {{ dbt.type_string() }}) = '000' and not (cast(v.set_to_zero as {{ dbt.type_string() }}) = 'X')) then a.co_mefbtr
            else cast(0 as {{ dbt.type_numeric() }})
        end as mefbtr,
        case
            when (cast(v.versn as {{ dbt.type_string() }}) = '000' and not (cast(v.set_to_zero as {{ dbt.type_string() }}) = 'X')) then a.msl
            else cast(0 as {{ dbt.type_numeric() }})
        end as mbgbtr,
        case
            when (cast(v.versn as {{ dbt.type_string() }}) = '000' and not (cast(v.set_to_zero as {{ dbt.type_string() }}) = 'X')) then a.mfsl
            else cast(0 as {{ dbt.type_numeric() }})
        end as mbfbtr,
        cast('00' as {{ dbt.type_string() }}) as lednr,
        a.objnr,
        a.ryear as gjahr,
        case
            when (a.accasty is null or cast(a.accasty as {{ dbt.type_string() }}) = '') then cast('11' as {{ dbt.type_string() }})
            else cast('04' as {{ dbt.type_string() }})
        end as wrttp,
        a.racct as kstar,
        a.hrkft,
        a.vrgng,
        case
            when a.parobsrc = '1' then a.parob1
            else (
                case
                    when a.parobsrc = '2' then a.paccasty
                    else cast('' as {{ dbt.type_string() }})
                end
            )
        end as parob,
        a.parob1,
        a.uspob,
        a.rassc as vbund,
        a.sbusa as pargb,
        a.co_beknz as beknz,
        a.co_meinh as meinh,
        case
            when (a.runit is null or cast(a.runit as {{ dbt.type_string() }}) = '') then cast('' as {{ dbt.type_string() }})
            else a.runit
        end as meinb,
        a.muvflg,
        a.sgtxt,
        case
            when v.field_name_refbz = 'CO_REFBZ' then a.co_refbz
            when v.field_name_refbz = 'CO_REFBZ1' then a.co_refbz1
            when v.field_name_refbz = 'CO_REFBZ2' then a.co_refbz2
            when v.field_name_refbz = 'CO_REFBZ5' then a.co_refbz5
            when v.field_name_refbz = 'CO_REFBZ6' then a.co_refbz6
            when v.field_name_refbz = 'CO_REFBZ7' then a.co_refbz7
            else a.co_refbz
        end as refbz,
        a.co_zlenr as zlenr,
        a.co_buzei as bw_refbz,
        case
            when (a.vrgng in ('COI', 'COIE', 'KZRI', 'INV1', 'INV2', 'INV3', 'INV4', 'INV5', 'INV6', 'RKU3')) then a.gkont
            else cast('' as {{ dbt.type_string() }})
        end as gkont,
        case
            when (a.vrgng in ('COI', 'COIE', 'KZRI', 'INV1', 'INV2', 'INV3', 'INV4', 'INV5', 'INV6', 'RKU3')) then a.gkoar
            else cast('' as {{ dbt.type_string() }})
        end as gkoar,
        a.werks,
        a.matnr,
        a.rbest,
        a.ebeln,
        a.ebelp,
        a.zekkn,
        a.erlkz,
        a.pernr,
        case
            when a.xpaobjnr_co_rel = 'X' then a.paobjnr
            else cast('0000000000' as {{ dbt.type_string() }})
        end as paobjnr,
        a.beltp,
        a.rbukrs as bukrs,
        a.rbusa as gsber,
        a.rfarea as fkber,
        a.scope,
        a.logsyso,
        cast('' as {{ dbt.type_string() }}) as pkstar,
        a.pbukrs,
        a.sfarea as pfkber,
        a.pscope,
        a.logsysp,
        a.dabrz,
        a.bwstrat,
        a.objnr_hk,
        a.timestamp_at,
        a.qmnum,
        a.rfund as geber,
        a.sfund as pgeber,
        a.rgrant_nbr as grant_nbr,
        a.sgrant_nbr as pgrant_nbr,
        case
            when (a.vrgng in ('COI', 'COIE', 'KZRI', 'INV1', 'INV2', 'INV3', 'INV4', 'INV5', 'INV6')) then a.buzei
            else cast('000' as {{ dbt.type_string() }})
        end as refbz_fi,
        a.segment,
        a.psegment,
        cast('0000000000' as {{ dbt.type_string() }}) as posnr,
        a.prctr,
        a.pprctr as pprct,
        a.rbudget_pd as budget_pd,
        a.sbudget_pd as pbudget_pd,
        concat(rtrim(substring(a.prodper, 1, 4)), rtrim(substring(a.prodper, 5, 2))) as prodper,
        a.awtyp,
        replace(rtrim(replace(rtrim(concat(rtrim(rpad(a.awref, 10, '€')), rtrim(a.aworg))), rtrim('€'), rtrim('€'))), rtrim('€'), rtrim('')) as awkey,
        a.awsys,
        a.accas,
        a.accasty,
        a.rcntr as kostl,
        a.lstar,
        a.aufnr,
        a.autyp,
        a.ps_posid as pspnr,
        a.ps_pspid as pspid,
        a.kdauf as vbeln,
        a.kdpos as vbposnr,
        case
            when a.accasty = 'EO' then rtrim(substring(a.objnr, 7, 10))
            else (
                case
                    when (not (a.paobjnr = '0000000000') and a.xpaobjnr_co_rel = 'X') then a.paobjnr
                    else cast('0000000000' as {{ dbt.type_string() }})
                end
            )
        end as ce4key,
        a.erkrs as erkrs,
        a.paccas,
        a.paccasty,
        a.scntr as pkostl,
        a.plstar,
        a.paufnr,
        a.pautyp,
        a.pps_posid as ppspnr,
        a.pps_pspid as ppspid,
        a.pkdauf as pvbeln,
        a.pkdpos as pvbposnr,
        case
            when a.paccasty = 'EO' then rtrim(substring(a.parob1, 7, 10))
            else (
                case
                    when (not (a.paobjnr = '0000000000') and a.xpaobjnr_co_rel = 'X') then a.ppaobjnr
                    else cast('0000000000' as {{ dbt.type_string() }})
                end
            )
        end as pce4key,
        case
            when (cast(v.versn as {{ dbt.type_string() }}) = '000' and not (cast(v.set_to_zero as {{ dbt.type_string() }}) = 'X')) then a.quant1
            else cast(0 as {{ dbt.type_numeric() }})
        end as quant1,
        case
            when (cast(v.versn as {{ dbt.type_string() }}) = '000' and not (cast(v.set_to_zero as {{ dbt.type_string() }}) = 'X')) then a.quant2
            else cast(0 as {{ dbt.type_numeric() }})
        end as quant2,
        case
            when (cast(v.versn as {{ dbt.type_string() }}) = '000' and not (cast(v.set_to_zero as {{ dbt.type_string() }}) = 'X')) then a.quant3
            else cast(0 as {{ dbt.type_numeric() }})
        end as quant3,
        a.qunit1,
        a.qunit2,
        a.qunit3,
        a.co_accasty_n1,
        a.co_accasty_n2,
        a.co_accasty_n3

    from acdoca_base a
    inner join finsc_cmp_versnd_base v
        on cast(v.mandt as {{ dbt.type_string() }}) = cast(a.rclnt as {{ dbt.type_string() }})
        and cast(v.bukrs as {{ dbt.type_string() }}) = cast(a.rbukrs as {{ dbt.type_string() }})
        and cast(v.rldnr as {{ dbt.type_string() }}) = cast(a.rldnr as {{ dbt.type_string() }})
        and cast(a.rclnt as {{ dbt.type_string() }}) = cast(v.mandt as {{ dbt.type_string() }})
    inner join tka01_base t
        on cast(t.mandt as {{ dbt.type_string() }}) = cast(a.rclnt as {{ dbt.type_string() }})
        and cast(t.kokrs as {{ dbt.type_string() }}) = cast(a.kokrs as {{ dbt.type_string() }})
        and cast(a.rclnt as {{ dbt.type_string() }}) = cast(t.mandt as {{ dbt.type_string() }})
    where not (cast(a.co_buzei as {{ dbt.type_string() }}) = '000')
        and not (cast(a.accasty as {{ dbt.type_string() }}) = '')
        and not (cast(a.objnr as {{ dbt.type_string() }}) = '')

)

select * from v_coep_acdoca_r1