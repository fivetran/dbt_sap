{{ config(enabled=var('sap_using_acdoca', True) and var('sap_using_finsc_ledger_rep', True) and var('sap_using_finsc_ld_cmp', True)) }}

with stg_sap__acdoca as (
  select *
  from {{ ref('stg_sap__acdoca') }}
),

stg_sap__finsc_ledger_rep as (
  select *
  from {{ ref('stg_sap__finsc_ledger_rep') }}
),

stg_sap__finsc_ld_cmp as (
  select *
  from {{ ref('stg_sap__finsc_ld_cmp') }}
)

select
  a.rclnt,
  a.ryear,
  a.belnr as docnr,
  lr.rldnr as rldnr,
  a.rbukrs,
  a.docln,
  (a.bttype) as activ,
  a.rmvct,
  a.rtcur,
  a.runit,
  a.awtyp,
  a.rrcty,
  '001' as rvers,
  a.awsys as logsys,
  a.racct,
  case
    when not (a.co_buzei = '000')
    then a.racct
    else ''
  end as cost_elem,
  a.rcntr,
  a.prctr,
  a.rfarea,
  a.rbusa,
  a.kokrs,
  a.segment,
  a.scntr,
  a.pprctr,
  a.sfarea,
  a.sbusa,
  a.rassc,
  a.psegment,
  a.tsl,
  a.hsl,
  case
    when lc.curposk = '2'
    then a.ksl
    when lc.curposo = '2'
    then a.osl
    when lc.curposv = '2'
    then a.vsl
    when lc.curposb = '2'
    then a.bsl
    when lc.curposc = '2'
    then a.csl
    when lc.curposd = '2'
    then a.dsl
    when lc.curpose = '2'
    then a.esl
    when lc.curposf = '2'
    then a.fsl
    when lc.curposg = '2'
    then a.gsl
    else cast(0 as {{ dbt.type_numeric() }})
  end as ksl,
  case
    when lc.curposo = '3'
    then a.osl
    when lc.curposk = '3'
    then a.ksl
    when lc.curposv = '3'
    then a.vsl
    when lc.curposb = '3'
    then a.bsl
    when lc.curposc = '3'
    then a.csl
    when lc.curposd = '3'
    then a.dsl
    when lc.curpose = '3'
    then a.esl
    when lc.curposf = '3'
    then a.fsl
    when lc.curposg = '3'
    then a.gsl
    else cast(0 as {{ dbt.type_numeric() }})
  end as osl,
  a.msl,
  a.wsl,
  a.fsl,
  a.vsl,
  a.drcrk,
  a.poper,
  a.rwcur,
  a.gjahr,
  a.budat,
  a.belnr,
  a.buzei,
  a.bschl,
  a.bstat,
  a.linetype,
  a.xsplitmod,
  a.usnam,
  a.timestamp_at,
  a._dataaging,
  a.fikrs,
  a.rfund,
  a.rgrant_nbr,
  a.rbudget_pd,
  a.sfund,
  a.sgrant_nbr,
  a.sbudget_pd,
  a.re_bukrs,
  a.re_account,
  a.vname,
  a.egrup,
  a.recid,
  a.mig_source,
  a.mig_docln,
  a.rhcur,
  a.rfcur,
  a.rvcur,
  a.fcsl,
  a.rfccur,
  case
    when lc.curposk = '2'
    then a.rkcur
    when lc.curposo = '2'
    then a.rocur
    when lc.curposv = '2'
    then a.rvcur
    else ''
  end as rkcur,
  case
    when lc.curposo = '3'
    then a.rocur
    when lc.curposk = '3'
    then a.rkcur
    when lc.curposv = '3'
    then a.rvcur
    else ''
  end as rocur
from stg_sap__acdoca as a
  inner join stg_sap__finsc_ledger_rep as lr 
    on (lr.mandt = a.rclnt and lr.rldnr_pers = a.rldnr)

  inner join stg_sap__finsc_ld_cmp as lc 
    on (lc.mandt = a.rclnt and lc.bukrs = a.rbukrs and lc.rldnr = lr.rldnr)

where (a.bstat = '' or a.bstat = 'l' or a.bstat = 'u' or a.bstat = 'j' or a.bstat = 't'
    or (a.bstat = 'c' and a.poper = '000'))