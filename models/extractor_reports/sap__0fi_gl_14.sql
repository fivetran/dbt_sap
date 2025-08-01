{{ config(enabled=var('sap_using_faglflexa', True) and var('sap_using_bkpf', True) and var('sap_using_bseg', True)) }}

with faglflexa as ( 

	select * 
	from {{ ref('stg_sap__faglflexa') }}
),

bkpf as (

    select *
    from {{ ref('stg_sap__bkpf') }}
),

bseg as (

    select *
    from {{ ref('stg_sap__bseg') }}
),

final as (
    
    select
        faglflexa.ryear,
        faglflexa.docnr,
        faglflexa.rldnr,
        faglflexa.rbukrs,
        faglflexa.docln,
        faglflexa.activ,
        faglflexa.rmvct,
        faglflexa.rtcur,
        faglflexa.runit,
        faglflexa.awtyp,
        faglflexa.rrcty,
        faglflexa.rvers,
        faglflexa.logsys,
        faglflexa.racct,
        faglflexa.cost_elem,
        faglflexa.rcntr,
        faglflexa.prctr,
        faglflexa.rfarea,
        faglflexa.rbusa,
        faglflexa.kokrs,
        faglflexa.segment,
        faglflexa.scntr,
        faglflexa.pprctr,
        faglflexa.sfarea,
        faglflexa.sbusa,
        faglflexa.rassc,
        faglflexa.psegment,
        faglflexa.tsl,
        faglflexa.hsl,
        faglflexa.ksl,
        faglflexa.osl,
        faglflexa.msl,
        faglflexa.wsl,
        faglflexa.drcrk,
        faglflexa.poper,
        faglflexa.rwcur,
        faglflexa.gjahr,
        faglflexa.budat,
        faglflexa.belnr,
        faglflexa.buzei,
        faglflexa.bschl,
        faglflexa.bstat,
        faglflexa.faglflexa_timestamp,
        bkpf.bukrs,
        bkpf.blart,
        bkpf.bldat,
        bkpf.monat,
        bkpf.cpudt,
        bkpf.xblnr,
        bkpf.waers,
        bkpf.glvor,
        bkpf.awkey,
        bkpf.fikrs,
        bkpf.hwaer,
        bkpf.hwae2,
        bkpf.hwae3,
        bkpf.awsys,
        bkpf.ldgrp,
        bkpf.kursf,
        bseg.anln1,
        bseg.anln2,
        bseg.aufnr,
        bseg.augbl,
        bseg.augdt,
        bseg.ebeln,
        bseg.ebelp,
        bseg.eten2, 
        bseg.filkd,
        bseg.gsber, 
        bseg.koart, 
        bseg.kostl,
        bseg.maber,
        bseg.madat,
        bseg.mansp,
        bseg.manst,
        bseg.mschl,
        bseg.mwskz,
        bseg.posn2,
        bseg.qbshb,
        bseg.qsfbt,
        bseg.qsshb,
        bseg.rebzg,
        bseg.samnr,
        bseg.sgtxt,
        bseg.shkzg,
        bseg.skfbt,
        bseg.wskto,
        bseg.sknto, 
        bseg.umsks,
        bseg.umskz,
        bseg.uzawe,
        bseg.valut,
        bseg.vbel2,
        bseg.vbeln,
        bseg.vbewa,
        bseg.vbund,
        bseg.vertn,
        bseg.vertt, 
        bseg.werks, 
        bseg.wverw, 
        bseg.xzahl, 
        bseg.zbd1p,
        bseg.zbd1t,
        bseg.zbd2p,
        bseg.zbd2t,
        bseg.zbd3t,
        bseg.zfbdt, 
        bseg.zlsch,
        bseg.zlspr,
        bseg.zterm,
        bseg.zuonr,
        bseg.xref1,
        bseg.xref2, 
        bseg.rstgr,  
        bseg.rebzt,
        bseg.pswsl,
        bseg.pswbt,
        bseg.hkont,
        bseg.xnegp,
        bseg.zbfix,
        bseg.rfzei,
        bseg.ccbtc,
        bseg.kkber,
        bseg.xref3,
        bseg.dtws1,
        bseg.dtws2,
        bseg.dtws3,
        bseg.dtws4,
        bseg.absbt, 
        bseg.projk,
        bseg.xpypr,
        bseg.kidno, 
        bseg.bupla,
        bseg.secco, 
        bseg.pycur,
        bseg.pyamt, 
        bseg.xragl,
        bseg.cession_kz,
        bseg.buzid,
        bseg.auggj,
        bseg.agzei, 
        bseg.bdiff,
        bseg.bdif2,
        bseg.bdif3,
        bseg.bewar,
        bseg.dabrz,
        bseg.dmbtr,
        bseg.fkber,
        bseg.fkber_long,
        bseg.imkey,
        bseg.kstar,
        bseg.kunnr,
        bseg.lifnr,
        bseg.meins,
        bseg.menge,
        bseg.pargb, 
        bseg.pfkber, 
        bseg.pprct, 
        bseg.saknr,
        bseg.wrbtr,
        bseg.xopvw,
        bseg.xlgclr,
        bkpf.xreorg,
        bseg.zzspreg,
        bseg.zzbuspartn,
        bseg.zzproduct,
        bseg.zzloca,
        bseg.zzchan,
        bseg.zzlob, 
        bseg.zzuserfld1,
        bseg.zzuserfld2,
        bseg.zzuserfld3,
        bseg.zzregion,
        bseg.zzstate
    from faglflexa
    inner join bkpf
        on bkpf.bukrs = faglflexa.rbukrs
        and bkpf.belnr = faglflexa.belnr
        and bkpf.gjahr = faglflexa.gjahr
        and bkpf.mandt = faglflexa.rclnt
    left join bseg
        on bkpf.mandt = bseg.mandt
        and bkpf.bukrs = bseg.bukrs
        and bkpf.belnr = bseg.belnr
        and bkpf.gjahr = bseg.gjahr
        and faglflexa.buzei = bseg.buzei
    where 1=1
    {% if var('bkpf_mandt_var',[]) %}  
    and bkpf.mandt = '{{ var('bkpf_mandt_var') }}'
    {% endif %}
    {% if var('faglflexa_rldnr_var',[]) %}
    and faglflexa.rldnr = '{{ var('faglflexa_rldnr_var') }}'
    {% endif %}
)

select *
from final
