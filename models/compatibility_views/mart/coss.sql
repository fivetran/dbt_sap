{{ config(enabled=var('sap_using_acdoca', True) and var('sap_using_finsc_cmp_versnd', True) and var('sap_using_tj01', True) and var('sap_using_tka01', True) and var('sap_using_t000', True)) }}

with stg_sap__acdoca as (
  select *
  from {{ ref('stg_sap__acdoca') }}
),

stg_sap__finsc_cmp_versnd as (
  select *
  from {{ ref('stg_sap__finsc_cmp_versnd') }}
),

stg_sap__tj01 as (
  select *
  from {{ ref('stg_sap__tj01') }}
),

stg_sap__tka01 as (
  select *
  from {{ ref('stg_sap__tka01') }}
),

stg_sap__t000 as (
  select *
  from {{ ref('stg_sap__t000') }}
),

sq_coss_wdv_1 as (
  select
    a.rclnt as mandt,
    '00' as lednr,
    a.objnr as objnr,
    a.ryear as gjahr,
    case
      when a.accasty != '' then '04'
      else '11'
    end as wrttp,
    v.versn as versn,
    a.racct as kstar,
    a.hrkft as hrkft,
    a.vrgng as vrgng,
    case
      when a.parobsrc = '1' then a.parob1
      when a.parobsrc = '2' then a.paccasty
      else ''
    end as parob,
    a.uspob as uspob,
    a.co_beknz as beknz,
    a.rwcur as twaer,
    case
      when v.field_name_buzei = 'co_buzei' then a.co_buzei
      when v.field_name_buzei = 'co_buzei1' then a.co_buzei1
      when v.field_name_buzei = 'co_buzei2' then a.co_buzei2
      when v.field_name_buzei = 'co_buzei5' then a.co_buzei5
      when v.field_name_buzei = 'co_buzei6' then a.co_buzei6
      when v.field_name_buzei = 'co_buzei7' then a.co_buzei7
      else a.co_buzei
    end as buzei,
    a.rldnr as rldnr,
    a.poper as perio,
    a.co_meinh as meinh,
    case v.field_name_wtgbtr_add
      when 'wsl' then a.wsl
      when 'wsl2' then a.wsl2
      when 'wsl3' then a.wsl3
      else cast(0 as {{ dbt.type_numeric() }})
    end as wtgbtr_add,
    case v.field_name_wtgbtr_subtract
      when 'wsl' then a.wsl
      when 'wsl2' then a.wsl2
      when 'wsl3' then a.wsl3
      else cast(0 as {{ dbt.type_numeric() }})
    end as wtgbtr_subtract,
    case
      when v.set_to_zero = 'x' then cast(0 as {{ dbt.type_numeric() }})
      when v.field_name_wogbtr_add = 'co_osl' then a.co_osl
      when v.field_name_wogbtr_add = 'hsl' then a.hsl
      when v.field_name_wogbtr_add = 'osl' then a.osl
      when v.field_name_wogbtr_add = 'vsl' then a.vsl
      when v.field_name_wogbtr_add = 'bsl' then a.bsl
      when v.field_name_wogbtr_add = 'csl' then a.csl
      when v.field_name_wogbtr_add = 'dsl' then a.dsl
      when v.field_name_wogbtr_add = 'esl' then a.esl
      when v.field_name_wogbtr_add = 'fsl' then a.fsl
      when v.field_name_wogbtr_add = 'gsl' then a.gsl
      when v.field_name_wogbtr_add = 'ksl' then a.ksl
      else cast(0 as {{ dbt.type_numeric() }})
    end as wogbtr_add,
    case v.field_name_wogbtr_subtract
      when 'hsl' then a.hsl
      when 'osl' then a.osl
      when 'co_osl' then a.co_osl
      when 'vsl' then a.vsl
      when 'bsl' then a.bsl
      when 'csl' then a.csl
      when 'dsl' then a.dsl
      when 'esl' then a.esl
      when 'fsl' then a.fsl
      when 'gsl' then a.gsl
      when 'ksl' then a.ksl
      else cast(0 as {{ dbt.type_numeric() }})
    end as wogbtr_subtract,
    case v.field_name_wkgbtr_add
      when 'ksl' then a.ksl
      when 'osl' then a.osl
      when 'vsl' then a.vsl
      when 'bsl' then a.bsl
      when 'csl' then a.csl
      when 'dsl' then a.dsl
      when 'esl' then a.esl
      when 'fsl' then a.fsl
      when 'gsl' then a.gsl
      when 'hsl' then a.hsl
      else cast(0 as {{ dbt.type_numeric() }})
    end as wkgbtr_add,
    case v.field_name_wkgbtr_subtract
      when 'ksl' then a.ksl
      when 'osl' then a.osl
      when 'vsl' then a.vsl
      when 'bsl' then a.bsl
      when 'csl' then a.csl
      when 'dsl' then a.dsl
      when 'esl' then a.esl
      when 'fsl' then a.fsl
      when 'gsl' then a.gsl
      when 'hsl' then a.hsl
      else cast(0 as {{ dbt.type_numeric() }})
    end as wkgbtr_subtract,
    case v.field_name_wkfbtr_add
      when 'kfsl' then a.kfsl
      when 'kfsl2' then a.kfsl2
      when 'kfsl3' then a.kfsl3
      else cast(0 as {{ dbt.type_numeric() }})
    end as wkfbtr_add,
    case v.field_name_wkfbtr_subtract
      when 'kfsl' then a.kfsl
      when 'kfsl2' then a.kfsl2
      when 'kfsl3' then a.kfsl3
      else cast(0 as {{ dbt.type_numeric() }})
    end as wkfbtr_subtract,
    case v.field_name_pagbtr_add
      when 'psl' then a.psl
      when 'psl2' then a.psl2
      when 'psl3' then a.psl3
      else cast(0 as {{ dbt.type_numeric() }})
    end as pagbtr_add,
    case v.field_name_pagbtr_subtract
      when 'psl' then a.psl
      when 'psl2' then a.psl2
      when 'psl3' then a.psl3
      else cast(0 as {{ dbt.type_numeric() }})
    end as pagbtr_subtract,
    case v.field_name_pafbtr_add
      when 'pfsl' then a.pfsl
      when 'pfsl2' then a.pfsl2
      when 'pfsl3' then a.pfsl3
      else cast(0 as {{ dbt.type_numeric() }})
    end as pafbtr_add,
    case v.field_name_pafbtr_subtract
      when 'pfsl' then a.pfsl
      when 'pfsl2' then a.pfsl2
      when 'pfsl3' then a.pfsl3
      else cast(0 as {{ dbt.type_numeric() }})
    end as pafbtr_subtract,
    case
      when v.versn != '000' or v.set_to_zero = 'x' then 0
      else a.co_megbtr
    end as megbtr,
    case
      when v.versn != '000' or v.set_to_zero = 'x' then 0
      else a.co_mefbtr
    end as mefbtr,
    case
      when v.versn != '000' or v.set_to_zero = 'x' then 0
      else a.msl
    end as mbgbtr,
    case
      when v.versn != '000' or v.set_to_zero = 'x' then 0
      else a.mfsl
    end as mbfbtr,
    cast(a.muvflg as {{ dbt.type_int() }}) as muvflg,
    a.beltp as beltp,
    a.rbukrs as bukrs,
    a.rfarea as fkber,
    a.segment as segment,
    a.rfund as geber,
    a.rgrant_nbr as grant_nbr,
    a.rbudget_pd as budget_pd,
    a.mig_source as mig_source,
    a.bstat as bstat,
    a.timestamp
  from stg_sap__acdoca as a

  inner join stg_sap__finsc_cmp_versnd as v 
    on (v.mandt = a.rclnt and v.bukrs = a.rbukrs and v.rldnr = a.rldnr)

  inner join stg_sap__tj01 as t 
    on (t.vrgng = a.vrgng and t.xcosp = '' and t.xcoss = 'x')

  inner join stg_sap__tka01 as tk 
    on (tk.mandt = a.rclnt and tk.kokrs = a.kokrs)

  inner join stg_sap__t000 as s 
    on (s.mandt = a.rclnt
      and (s.logsys = a.logsyso or a.logsyso = '' 
        or ((a.accasty = 'ks' or a.accasty = 'kl')
        and (s.logsys = tk.logsystem or tk.logsystem = ''))
      )
    )
  where ((a.co_buzei != '000' and a.accasty != '')
    or (a.mig_source = 'c' and a.bstat = 'c')) 
    and a.objnr != ''
),

sq_coss_wdv_2 as (
  select
    v_coss_wdv_1.mandt,
    v_coss_wdv_1.lednr,
    v_coss_wdv_1.objnr,
    v_coss_wdv_1.gjahr,
    v_coss_wdv_1.wrttp,
    v_coss_wdv_1.versn,
    v_coss_wdv_1.kstar,
    v_coss_wdv_1.hrkft,
    v_coss_wdv_1.vrgng,
    v_coss_wdv_1.parob,
    v_coss_wdv_1.uspob,
    v_coss_wdv_1.beknz,
    v_coss_wdv_1.twaer,
    v_coss_wdv_1.rldnr,
    v_coss_wdv_1.perio,
    v_coss_wdv_1.meinh,
    cast(v_coss_wdv_1.wtgbtr_add - v_coss_wdv_1.wtgbtr_subtract as {{ dbt.type_numeric() }}) as wtgbtr,
    cast(v_coss_wdv_1.wogbtr_add - v_coss_wdv_1.wogbtr_subtract as {{ dbt.type_numeric() }}) as wogbtr,
    cast(v_coss_wdv_1.wkgbtr_add - v_coss_wdv_1.wkgbtr_subtract as {{ dbt.type_numeric() }}) as wkgbtr,
    cast(v_coss_wdv_1.wkfbtr_add - v_coss_wdv_1.wkfbtr_subtract as {{ dbt.type_numeric() }}) as wkfbtr,
    cast(v_coss_wdv_1.pagbtr_add - v_coss_wdv_1.pagbtr_subtract as {{ dbt.type_numeric() }}) as pagbtr,
    cast(v_coss_wdv_1.pafbtr_add - v_coss_wdv_1.pafbtr_subtract as {{ dbt.type_numeric() }}) as pafbtr,
    v_coss_wdv_1.megbtr,
    v_coss_wdv_1.mefbtr,
    v_coss_wdv_1.muvflg,
    v_coss_wdv_1.beltp,
    v_coss_wdv_1.bukrs,
    v_coss_wdv_1.fkber,
    v_coss_wdv_1.segment,
    v_coss_wdv_1.geber,
    v_coss_wdv_1.grant_nbr,
    v_coss_wdv_1.budget_pd,
    v_coss_wdv_1.timestamp
  from
    sq_coss_wdv_1 as v_coss_wdv_1
),

sq_coss_wdv_4 as (
  select
    v_coss_wdv_2.mandt,
    v_coss_wdv_2.lednr,
    v_coss_wdv_2.objnr,
    v_coss_wdv_2.gjahr,
    v_coss_wdv_2.wrttp,
    v_coss_wdv_2.versn,
    v_coss_wdv_2.kstar,
    v_coss_wdv_2.hrkft,
    v_coss_wdv_2.vrgng,
    v_coss_wdv_2.parob,
    v_coss_wdv_2.uspob,
    v_coss_wdv_2.beknz,
    v_coss_wdv_2.twaer,
    v_coss_wdv_2.perio,
    v_coss_wdv_2.meinh,
    v_coss_wdv_2.wtgbtr,
    v_coss_wdv_2.wogbtr,
    v_coss_wdv_2.wkgbtr,
    v_coss_wdv_2.wkfbtr,
    v_coss_wdv_2.pagbtr,
    v_coss_wdv_2.pafbtr,
    v_coss_wdv_2.megbtr,
    v_coss_wdv_2.mefbtr,
    v_coss_wdv_2.muvflg,
    v_coss_wdv_2.beltp,
    v_coss_wdv_2.bukrs,
    v_coss_wdv_2.fkber,
    v_coss_wdv_2.segment,
    v_coss_wdv_2.geber,
    v_coss_wdv_2.grant_nbr,
    v_coss_wdv_2.budget_pd,
    case
      when v_coss_wdv_2.timestamp > 0 then rtrim(substring(cast(v_coss_wdv_2.timestamp as {{ dbt.type_string() }}), 1, 4))
      else '0000'
    end as tsgjahr,
    case
      when v_coss_wdv_2.timestamp > 0 then rtrim(substring(cast(v_coss_wdv_2.timestamp as {{ dbt.type_string() }}), 5, 2))
      else '00'
    end as tsmonth,
    case
      when v_coss_wdv_2.timestamp > 0 then rtrim(substring(cast(v_coss_wdv_2.timestamp as {{ dbt.type_string() }}), 7, 2))
      else '00'
    end as tsday,
    case
      when v_coss_wdv_2.timestamp > 0 then rtrim(substring(cast(v_coss_wdv_2.timestamp as {{ dbt.type_string() }}), 9, 2))
      else '00'
    end as tshour,
    case
      when v_coss_wdv_2.timestamp > 0 then rtrim(substring(cast(v_coss_wdv_2.timestamp as {{ dbt.type_string() }}), 11, 2))
      else '00'
    end as tsminute,
    case
      when v_coss_wdv_2.timestamp > 0 then rtrim(substring(cast(v_coss_wdv_2.timestamp as {{ dbt.type_string() }}), 13, 2))
      else '00'
    end as tssecond
  from
    sq_coss_wdv_2 as v_coss_wdv_2
),
sq_coss_wdv_5 as (
  select
    v_coss_wdv_4.mandt,
    v_coss_wdv_4.lednr,
    v_coss_wdv_4.objnr,
    v_coss_wdv_4.gjahr,
    v_coss_wdv_4.wrttp,
    v_coss_wdv_4.versn,
    v_coss_wdv_4.kstar,
    v_coss_wdv_4.hrkft,
    v_coss_wdv_4.vrgng,
    v_coss_wdv_4.parob,
    v_coss_wdv_4.uspob,
    v_coss_wdv_4.beknz,
    v_coss_wdv_4.twaer,
    v_coss_wdv_4.perio,
    v_coss_wdv_4.meinh,
    v_coss_wdv_4.wtgbtr,
    v_coss_wdv_4.wogbtr,
    v_coss_wdv_4.wkgbtr,
    v_coss_wdv_4.wkfbtr,
    v_coss_wdv_4.pagbtr,
    v_coss_wdv_4.pafbtr,
    v_coss_wdv_4.megbtr,
    v_coss_wdv_4.mefbtr,
    v_coss_wdv_4.muvflg,
    v_coss_wdv_4.beltp,
    v_coss_wdv_4.bukrs,
    v_coss_wdv_4.fkber,
    v_coss_wdv_4.segment,
    v_coss_wdv_4.geber,
    v_coss_wdv_4.grant_nbr,
    v_coss_wdv_4.budget_pd,
    cast(v_coss_wdv_4.tsgjahr as {{ dbt.type_int() }}) as tsgjahr0,
    cast(v_coss_wdv_4.tsmonth as {{ dbt.type_int() }}) as tsmonth0,
    cast(v_coss_wdv_4.tsday as {{ dbt.type_int() }}) as tsday0,
    cast(v_coss_wdv_4.tshour as {{ dbt.type_int() }}) as tshour0,
    cast(v_coss_wdv_4.tsminute as {{ dbt.type_int() }}) as tsminute0,
    cast(v_coss_wdv_4.tssecond as {{ dbt.type_int() }}) as tssecond0
  from
    sq_coss_wdv_4 as v_coss_wdv_4
),
sq_coss_wdv_6 as (
  select
    v_coss_wdv_5.mandt,
    v_coss_wdv_5.lednr,
    v_coss_wdv_5.objnr,
    v_coss_wdv_5.gjahr,
    v_coss_wdv_5.wrttp,
    v_coss_wdv_5.versn,
    v_coss_wdv_5.kstar,
    v_coss_wdv_5.hrkft,
    v_coss_wdv_5.vrgng,
    v_coss_wdv_5.parob,
    v_coss_wdv_5.uspob,
    v_coss_wdv_5.beknz,
    v_coss_wdv_5.twaer,
    v_coss_wdv_5.perio,
    v_coss_wdv_5.meinh,
    v_coss_wdv_5.wtgbtr,
    v_coss_wdv_5.wogbtr,
    v_coss_wdv_5.wkgbtr,
    v_coss_wdv_5.wkfbtr,
    v_coss_wdv_5.pagbtr,
    v_coss_wdv_5.pafbtr,
    v_coss_wdv_5.megbtr,
    v_coss_wdv_5.mefbtr,
    v_coss_wdv_5.muvflg,
    v_coss_wdv_5.beltp,
    v_coss_wdv_5.bukrs,
    v_coss_wdv_5.fkber,
    v_coss_wdv_5.segment,
    v_coss_wdv_5.geber,
    v_coss_wdv_5.grant_nbr,
    v_coss_wdv_5.budget_pd,
    case
      when v_coss_wdv_5.tsgjahr0 > 2040
      or (
        v_coss_wdv_5.tsgjahr0 = 2040
        and v_coss_wdv_5.tsmonth0 > 2
      ) then cast(13 * 60 * 60 * 24 as {{ dbt.type_int() }})
      when v_coss_wdv_5.tsgjahr0 > 2036
      or (
        v_coss_wdv_5.tsgjahr0 = 2036
        and v_coss_wdv_5.tsmonth0 > 2
      ) then cast(12 * 60 * 60 * 24 as {{ dbt.type_int() }})
      when v_coss_wdv_5.tsgjahr0 > 2032
      or (
        v_coss_wdv_5.tsgjahr0 = 2032
        and v_coss_wdv_5.tsmonth0 > 2
      ) then cast(11 * 60 * 60 * 24 as {{ dbt.type_int() }})
      when v_coss_wdv_5.tsgjahr0 > 2028
      or (
        v_coss_wdv_5.tsgjahr0 = 2028
        and v_coss_wdv_5.tsmonth0 > 2
      ) then cast(10 * 60 * 60 * 24 as {{ dbt.type_int() }})
      when v_coss_wdv_5.tsgjahr0 > 2024
      or (
        v_coss_wdv_5.tsgjahr0 = 2024
        and v_coss_wdv_5.tsmonth0 > 2
      ) then cast(9 * 60 * 60 * 24 as {{ dbt.type_int() }})
      when v_coss_wdv_5.tsgjahr0 > 2020
      or (
        v_coss_wdv_5.tsgjahr0 = 2020
        and v_coss_wdv_5.tsmonth0 > 2
      ) then cast(8 * 60 * 60 * 24 as {{ dbt.type_int() }})
      when v_coss_wdv_5.tsgjahr0 > 2016
      or (
        v_coss_wdv_5.tsgjahr0 = 2016
        and v_coss_wdv_5.tsmonth0 > 2
      ) then cast(7 * 60 * 60 * 24 as {{ dbt.type_int() }})
      when v_coss_wdv_5.tsgjahr0 > 2012
      or (
        v_coss_wdv_5.tsgjahr0 = 2012
        and v_coss_wdv_5.tsmonth0 > 2
      ) then cast(6 * 60 * 60 * 24 as {{ dbt.type_int() }})
      when v_coss_wdv_5.tsgjahr0 > 2008
      or (
        v_coss_wdv_5.tsgjahr0 = 2008
        and v_coss_wdv_5.tsmonth0 > 2
      ) then cast(5 * 60 * 60 * 24 as {{ dbt.type_int() }})
      when v_coss_wdv_5.tsgjahr0 > 2004
      or (
        v_coss_wdv_5.tsgjahr0 = 2004
        and v_coss_wdv_5.tsmonth0 > 2
      ) then cast(4 * 60 * 60 * 24 as {{ dbt.type_int() }})
      when v_coss_wdv_5.tsgjahr0 > 2000
      or (
        v_coss_wdv_5.tsgjahr0 = 2000
        and v_coss_wdv_5.tsmonth0 > 2
      ) then cast(3 * 60 * 60 * 24 as {{ dbt.type_int() }})
      when v_coss_wdv_5.tsgjahr0 > 1996
      or (
        v_coss_wdv_5.tsgjahr0 = 1996
        and v_coss_wdv_5.tsmonth0 > 2
      ) then cast(2 * 60 * 60 * 24 as {{ dbt.type_int() }})
      when v_coss_wdv_5.tsgjahr0 > 1992
      or (
        v_coss_wdv_5.tsgjahr0 = 1992
        and v_coss_wdv_5.tsmonth0 > 2
      ) then cast(1 * 60 * 60 * 24 as {{ dbt.type_int() }})
      else 0
    end as tsgjahradd,
    case
      when v_coss_wdv_5.tsgjahr0 = 0 then 0
      else cast(
        (v_coss_wdv_5.tsgjahr0 - 1990) * 365 * 24 * 60 * 60 as decimal(16, 0)
      )
    end as tsgjahr1,
    case
      when v_coss_wdv_5.tsmonth0 = 1 then 0
      when v_coss_wdv_5.tsmonth0 = 2 then cast(31 * 24 * 60 * 60 as {{ dbt.type_int() }})
      when v_coss_wdv_5.tsmonth0 = 3 then cast(59 * 24 * 60 * 60 as {{ dbt.type_int() }})
      when v_coss_wdv_5.tsmonth0 = 4 then cast(90 * 24 * 60 * 60 as {{ dbt.type_int() }})
      when v_coss_wdv_5.tsmonth0 = 5 then cast(120 * 24 * 60 * 60 as {{ dbt.type_int() }})
      when v_coss_wdv_5.tsmonth0 = 6 then cast(151 * 24 * 60 * 60 as {{ dbt.type_int() }})
      when v_coss_wdv_5.tsmonth0 = 7 then cast(181 * 24 * 60 * 60 as {{ dbt.type_int() }})
      when v_coss_wdv_5.tsmonth0 = 8 then cast(212 * 24 * 60 * 60 as {{ dbt.type_int() }})
      when v_coss_wdv_5.tsmonth0 = 9 then cast(243 * 24 * 60 * 60 as {{ dbt.type_int() }})
      when v_coss_wdv_5.tsmonth0 = 10 then cast(273 * 24 * 60 * 60 as {{ dbt.type_int() }})
      when v_coss_wdv_5.tsmonth0 = 11 then cast(304 * 24 * 60 * 60 as {{ dbt.type_int() }})
      when v_coss_wdv_5.tsmonth0 = 12 then cast(334 * 24 * 60 * 60 as {{ dbt.type_int() }})
      else 0
    end as tsmonth1,
    case
      when v_coss_wdv_5.tsday0 = 0 then 0
      else cast((v_coss_wdv_5.tsday0 - 1) * 24 * 60 * 60 as {{ dbt.type_int() }})
    end as tsday1,
    cast(v_coss_wdv_5.tshour0 * 60 * 60 as {{ dbt.type_int() }}) as tshour1,
    cast(v_coss_wdv_5.tsminute0 * 60 as {{ dbt.type_int() }}) as tsminute1,
    v_coss_wdv_5.tssecond0 as tssecond1
  from sq_coss_wdv_5 as v_coss_wdv_5
),
sq_coss_wdv_7 as (
  select
    v_coss_wdv_6.mandt,
    v_coss_wdv_6.lednr,
    v_coss_wdv_6.objnr,
    v_coss_wdv_6.gjahr,
    v_coss_wdv_6.wrttp,
    v_coss_wdv_6.versn,
    v_coss_wdv_6.kstar,
    v_coss_wdv_6.hrkft,
    v_coss_wdv_6.vrgng,
    v_coss_wdv_6.parob,
    v_coss_wdv_6.uspob,
    v_coss_wdv_6.beknz,
    v_coss_wdv_6.twaer,
    v_coss_wdv_6.perio,
    v_coss_wdv_6.meinh,
    v_coss_wdv_6.wtgbtr,
    v_coss_wdv_6.wogbtr,
    v_coss_wdv_6.wkgbtr,
    v_coss_wdv_6.wkfbtr,
    v_coss_wdv_6.pagbtr,
    v_coss_wdv_6.pafbtr,
    v_coss_wdv_6.megbtr,
    v_coss_wdv_6.mefbtr,
    v_coss_wdv_6.muvflg,
    v_coss_wdv_6.beltp,
    v_coss_wdv_6.bukrs,
    v_coss_wdv_6.fkber,
    v_coss_wdv_6.segment,
    v_coss_wdv_6.geber,
    v_coss_wdv_6.grant_nbr,
    v_coss_wdv_6.budget_pd,
    cast(v_coss_wdv_6.tsgjahradd + cast(v_coss_wdv_6.tsgjahr1 * 60 as {{ dbt.type_numeric() }}) + v_coss_wdv_6.tsmonth1 + v_coss_wdv_6.tsday1 + v_coss_wdv_6.tshour1 + v_coss_wdv_6.tsminute1 + v_coss_wdv_6.tssecond1 as {{ dbt.type_numeric() }}) as tstotalsec
  from sq_coss_wdv_6 as v_coss_wdv_6
),

sq_coss_wdv_8 as (
  select
    v_coss_wdv_7.mandt,
    v_coss_wdv_7.lednr,
    v_coss_wdv_7.objnr,
    v_coss_wdv_7.gjahr,
    v_coss_wdv_7.wrttp,
    v_coss_wdv_7.versn,
    v_coss_wdv_7.kstar,
    v_coss_wdv_7.hrkft,
    v_coss_wdv_7.vrgng,
    v_coss_wdv_7.parob,
    v_coss_wdv_7.uspob,
    v_coss_wdv_7.beknz,
    v_coss_wdv_7.twaer,
    v_coss_wdv_7.perio,
    v_coss_wdv_7.meinh,
    v_coss_wdv_7.wtgbtr,
    v_coss_wdv_7.wogbtr,
    v_coss_wdv_7.wkgbtr,
    v_coss_wdv_7.wkfbtr,
    v_coss_wdv_7.pagbtr,
    v_coss_wdv_7.pafbtr,
    v_coss_wdv_7.megbtr,
    v_coss_wdv_7.mefbtr,
    v_coss_wdv_7.muvflg,
    v_coss_wdv_7.beltp,
    v_coss_wdv_7.bukrs,
    v_coss_wdv_7.fkber,
    v_coss_wdv_7.segment,
    v_coss_wdv_7.geber,
    v_coss_wdv_7.grant_nbr,
    v_coss_wdv_7.budget_pd,
    cast(cast(v_coss_wdv_7.tstotalsec as {{ dbt.type_numeric() }}) * 10000 as {{ dbt.type_numeric() }}) as timestmp
  from sq_coss_wdv_7 as v_coss_wdv_7
),

sq_coss_wdv_10 as (
  select
    v_coss_wdv_9.mandt,
    v_coss_wdv_9.lednr,
    v_coss_wdv_9.objnr,
    v_coss_wdv_9.gjahr,
    v_coss_wdv_9.wrttp,
    v_coss_wdv_9.versn,
    v_coss_wdv_9.kstar,
    v_coss_wdv_9.hrkft,
    v_coss_wdv_9.vrgng,
    v_coss_wdv_9.parob,
    v_coss_wdv_9.uspob,
    v_coss_wdv_9.beknz,
    v_coss_wdv_9.twaer,
    '016' as perbl,
    v_coss_wdv_9.meinh,
    case
      when v_coss_wdv_9.perio = '001' then v_coss_wdv_9.wtgbtr
      else cast(0 as {{ dbt.type_numeric() }})
    end as wtg001,
    case
      when v_coss_wdv_9.perio = '002' then v_coss_wdv_9.wtgbtr
      else cast(0 as {{ dbt.type_numeric() }})
    end as wtg002,
    case
      when v_coss_wdv_9.perio = '003' then v_coss_wdv_9.wtgbtr
      else cast(0 as {{ dbt.type_numeric() }})
    end as wtg003,
    case
      when v_coss_wdv_9.perio = '004' then v_coss_wdv_9.wtgbtr
      else cast(0 as {{ dbt.type_numeric() }})
    end as wtg004,
    case
      when v_coss_wdv_9.perio = '005' then v_coss_wdv_9.wtgbtr
      else cast(0 as {{ dbt.type_numeric() }})
    end as wtg005,
    case
      when v_coss_wdv_9.perio = '006' then v_coss_wdv_9.wtgbtr
      else cast(0 as {{ dbt.type_numeric() }})
    end as wtg006,
    case
      when v_coss_wdv_9.perio = '007' then v_coss_wdv_9.wtgbtr
      else cast(0 as {{ dbt.type_numeric() }})
    end as wtg007,
    case
      when v_coss_wdv_9.perio = '008' then v_coss_wdv_9.wtgbtr
      else cast(0 as {{ dbt.type_numeric() }})
    end as wtg008,
    case
      when v_coss_wdv_9.perio = '009' then v_coss_wdv_9.wtgbtr
      else cast(0 as {{ dbt.type_numeric() }})
    end as wtg009,
    case
      when v_coss_wdv_9.perio = '010' then v_coss_wdv_9.wtgbtr
      else cast(0 as {{ dbt.type_numeric() }})
    end as wtg010,
    case
      when v_coss_wdv_9.perio = '011' then v_coss_wdv_9.wtgbtr
      else cast(0 as {{ dbt.type_numeric() }})
    end as wtg011,
    case
      when v_coss_wdv_9.perio = '012' then v_coss_wdv_9.wtgbtr
      else cast(0 as {{ dbt.type_numeric() }})
    end as wtg012,
    case
      when v_coss_wdv_9.perio = '013' then v_coss_wdv_9.wtgbtr
      else cast(0 as {{ dbt.type_numeric() }})
    end as wtg013,
    case
      when v_coss_wdv_9.perio = '014' then v_coss_wdv_9.wtgbtr
      else cast(0 as {{ dbt.type_numeric() }})
    end as wtg014,
    case
      when v_coss_wdv_9.perio = '015' then v_coss_wdv_9.wtgbtr
      else cast(0 as {{ dbt.type_numeric() }})
    end as wtg015,
    case
      when v_coss_wdv_9.perio = '016' then v_coss_wdv_9.wtgbtr
      else cast(0 as {{ dbt.type_numeric() }})
    end as wtg016,
    case
      when v_coss_wdv_9.perio = '001' then v_coss_wdv_9.wogbtr
      else cast(0 as {{ dbt.type_numeric() }})
    end as wog001,
    case
      when v_coss_wdv_9.perio = '002' then v_coss_wdv_9.wogbtr
      else cast(0 as {{ dbt.type_numeric() }})
    end as wog002,
    case
      when v_coss_wdv_9.perio = '003' then v_coss_wdv_9.wogbtr
      else cast(0 as {{ dbt.type_numeric() }})
    end as wog003,
    case
      when v_coss_wdv_9.perio = '004' then v_coss_wdv_9.wogbtr
      else cast(0 as {{ dbt.type_numeric() }})
    end as wog004,
    case
      when v_coss_wdv_9.perio = '005' then v_coss_wdv_9.wogbtr
      else cast(0 as {{ dbt.type_numeric() }})
    end as wog005,
    case
      when v_coss_wdv_9.perio = '006' then v_coss_wdv_9.wogbtr
      else cast(0 as {{ dbt.type_numeric() }})
    end as wog006,
    case
      when v_coss_wdv_9.perio = '007' then v_coss_wdv_9.wogbtr
      else cast(0 as {{ dbt.type_numeric() }})
    end as wog007,
    case
      when v_coss_wdv_9.perio = '008' then v_coss_wdv_9.wogbtr
      else cast(0 as {{ dbt.type_numeric() }})
    end as wog008,
    case
      when v_coss_wdv_9.perio = '009' then v_coss_wdv_9.wogbtr
      else cast(0 as {{ dbt.type_numeric() }})
    end as wog009,
    case
      when v_coss_wdv_9.perio = '010' then v_coss_wdv_9.wogbtr
      else cast(0 as {{ dbt.type_numeric() }})
    end as wog010,
    case
      when v_coss_wdv_9.perio = '011' then v_coss_wdv_9.wogbtr
      else cast(0 as {{ dbt.type_numeric() }})
    end as wog011,
    case
      when v_coss_wdv_9.perio = '012' then v_coss_wdv_9.wogbtr
      else cast(0 as {{ dbt.type_numeric() }})
    end as wog012,
    case
      when v_coss_wdv_9.perio = '013' then v_coss_wdv_9.wogbtr
      else cast(0 as {{ dbt.type_numeric() }})
    end as wog013,
    case
      when v_coss_wdv_9.perio = '014' then v_coss_wdv_9.wogbtr
      else cast(0 as {{ dbt.type_numeric() }})
    end as wog014,
    case
      when v_coss_wdv_9.perio = '015' then v_coss_wdv_9.wogbtr
      else cast(0 as {{ dbt.type_numeric() }})
    end as wog015,
    case
      when v_coss_wdv_9.perio = '016' then v_coss_wdv_9.wogbtr
      else cast(0 as {{ dbt.type_numeric() }})
    end as wog016,
    case
      when v_coss_wdv_9.perio = '001' then v_coss_wdv_9.wkgbtr
      else cast(0 as {{ dbt.type_numeric() }})
    end as wkg001,
    case
      when v_coss_wdv_9.perio = '002' then v_coss_wdv_9.wkgbtr
      else cast(0 as {{ dbt.type_numeric() }})
    end as wkg002,
    case
      when v_coss_wdv_9.perio = '003' then v_coss_wdv_9.wkgbtr
      else cast(0 as {{ dbt.type_numeric() }})
    end as wkg003,
    case
      when v_coss_wdv_9.perio = '004' then v_coss_wdv_9.wkgbtr
      else cast(0 as {{ dbt.type_numeric() }})
    end as wkg004,
    case
      when v_coss_wdv_9.perio = '005' then v_coss_wdv_9.wkgbtr
      else cast(0 as {{ dbt.type_numeric() }})
    end as wkg005,
    case
      when v_coss_wdv_9.perio = '006' then v_coss_wdv_9.wkgbtr
      else cast(0 as {{ dbt.type_numeric() }})
    end as wkg006,
    case
      when v_coss_wdv_9.perio = '007' then v_coss_wdv_9.wkgbtr
      else cast(0 as {{ dbt.type_numeric() }})
    end as wkg007,
    case
      when v_coss_wdv_9.perio = '008' then v_coss_wdv_9.wkgbtr
      else cast(0 as {{ dbt.type_numeric() }})
    end as wkg008,
    case
      when v_coss_wdv_9.perio = '009' then v_coss_wdv_9.wkgbtr
      else cast(0 as {{ dbt.type_numeric() }})
    end as wkg009,
    case
      when v_coss_wdv_9.perio = '010' then v_coss_wdv_9.wkgbtr
      else cast(0 as {{ dbt.type_numeric() }})
    end as wkg010,
    case
      when v_coss_wdv_9.perio = '011' then v_coss_wdv_9.wkgbtr
      else cast(0 as {{ dbt.type_numeric() }})
    end as wkg011,
    case
      when v_coss_wdv_9.perio = '012' then v_coss_wdv_9.wkgbtr
      else cast(0 as {{ dbt.type_numeric() }})
    end as wkg012,
    case
      when v_coss_wdv_9.perio = '013' then v_coss_wdv_9.wkgbtr
      else cast(0 as {{ dbt.type_numeric() }})
    end as wkg013,
    case
      when v_coss_wdv_9.perio = '014' then v_coss_wdv_9.wkgbtr
      else cast(0 as {{ dbt.type_numeric() }})
    end as wkg014,
    case
      when v_coss_wdv_9.perio = '015' then v_coss_wdv_9.wkgbtr
      else cast(0 as {{ dbt.type_numeric() }})
    end as wkg015,
    case
      when v_coss_wdv_9.perio = '016' then v_coss_wdv_9.wkgbtr
      else cast(0 as {{ dbt.type_numeric() }})
    end as wkg016,
    case
      when v_coss_wdv_9.perio = '001' then v_coss_wdv_9.wkfbtr
      else cast(0 as {{ dbt.type_numeric() }})
    end as wkf001,
    case
      when v_coss_wdv_9.perio = '002' then v_coss_wdv_9.wkfbtr
      else cast(0 as {{ dbt.type_numeric() }})
    end as wkf002,
    case
      when v_coss_wdv_9.perio = '003' then v_coss_wdv_9.wkfbtr
      else cast(0 as {{ dbt.type_numeric() }})
    end as wkf003,
    case
      when v_coss_wdv_9.perio = '004' then v_coss_wdv_9.wkfbtr
      else cast(0 as {{ dbt.type_numeric() }})
    end as wkf004,
    case
      when v_coss_wdv_9.perio = '005' then v_coss_wdv_9.wkfbtr
      else cast(0 as {{ dbt.type_numeric() }})
    end as wkf005,
    case
      when v_coss_wdv_9.perio = '006' then v_coss_wdv_9.wkfbtr
      else cast(0 as {{ dbt.type_numeric() }})
    end as wkf006,
    case
      when v_coss_wdv_9.perio = '007' then v_coss_wdv_9.wkfbtr
      else cast(0 as {{ dbt.type_numeric() }})
    end as wkf007,
    case
      when v_coss_wdv_9.perio = '008' then v_coss_wdv_9.wkfbtr
      else cast(0 as {{ dbt.type_numeric() }})
    end as wkf008,
    case
      when v_coss_wdv_9.perio = '009' then v_coss_wdv_9.wkfbtr
      else cast(0 as {{ dbt.type_numeric() }})
    end as wkf009,
    case
      when v_coss_wdv_9.perio = '010' then v_coss_wdv_9.wkfbtr
      else cast(0 as {{ dbt.type_numeric() }})
    end as wkf010,
    case
      when v_coss_wdv_9.perio = '011' then v_coss_wdv_9.wkfbtr
      else cast(0 as {{ dbt.type_numeric() }})
    end as wkf011,
    case
      when v_coss_wdv_9.perio = '012' then v_coss_wdv_9.wkfbtr
      else cast(0 as {{ dbt.type_numeric() }})
    end as wkf012,
    case
      when v_coss_wdv_9.perio = '013' then v_coss_wdv_9.wkfbtr
      else cast(0 as {{ dbt.type_numeric() }})
    end as wkf013,
    case
      when v_coss_wdv_9.perio = '014' then v_coss_wdv_9.wkfbtr
      else cast(0 as {{ dbt.type_numeric() }})
    end as wkf014,
    case
      when v_coss_wdv_9.perio = '015' then v_coss_wdv_9.wkfbtr
      else cast(0 as {{ dbt.type_numeric() }})
    end as wkf015,
    case
      when v_coss_wdv_9.perio = '016' then v_coss_wdv_9.wkfbtr
      else cast(0 as {{ dbt.type_numeric() }})
    end as wkf016,
    case
      when v_coss_wdv_9.perio = '001' then v_coss_wdv_9.pagbtr
      else cast(0 as {{ dbt.type_numeric() }})
    end as pag001,
    case
      when v_coss_wdv_9.perio = '002' then v_coss_wdv_9.pagbtr
      else cast(0 as {{ dbt.type_numeric() }})
    end as pag002,
    case
      when v_coss_wdv_9.perio = '003' then v_coss_wdv_9.pagbtr
      else cast(0 as {{ dbt.type_numeric() }})
    end as pag003,
    case
      when v_coss_wdv_9.perio = '004' then v_coss_wdv_9.pagbtr
      else cast(0 as {{ dbt.type_numeric() }})
    end as pag004,
    case
      when v_coss_wdv_9.perio = '005' then v_coss_wdv_9.pagbtr
      else cast(0 as {{ dbt.type_numeric() }})
    end as pag005,
    case
      when v_coss_wdv_9.perio = '006' then v_coss_wdv_9.pagbtr
      else cast(0 as {{ dbt.type_numeric() }})
    end as pag006,
    case
      when v_coss_wdv_9.perio = '007' then v_coss_wdv_9.pagbtr
      else cast(0 as {{ dbt.type_numeric() }})
    end as pag007,
    case
      when v_coss_wdv_9.perio = '008' then v_coss_wdv_9.pagbtr
      else cast(0 as {{ dbt.type_numeric() }})
    end as pag008,
    case
      when v_coss_wdv_9.perio = '009' then v_coss_wdv_9.pagbtr
      else cast(0 as {{ dbt.type_numeric() }})
    end as pag009,
    case
      when v_coss_wdv_9.perio = '010' then v_coss_wdv_9.pagbtr
      else cast(0 as {{ dbt.type_numeric() }})
    end as pag010,
    case
      when v_coss_wdv_9.perio = '011' then v_coss_wdv_9.pagbtr
      else cast(0 as {{ dbt.type_numeric() }})
    end as pag011,
    case
      when v_coss_wdv_9.perio = '012' then v_coss_wdv_9.pagbtr
      else cast(0 as {{ dbt.type_numeric() }})
    end as pag012,
    case
      when v_coss_wdv_9.perio = '013' then v_coss_wdv_9.pagbtr
      else cast(0 as {{ dbt.type_numeric() }})
    end as pag013,
    case
      when v_coss_wdv_9.perio = '014' then v_coss_wdv_9.pagbtr
      else cast(0 as {{ dbt.type_numeric() }})
    end as pag014,
    case
      when v_coss_wdv_9.perio = '015' then v_coss_wdv_9.pagbtr
      else cast(0 as {{ dbt.type_numeric() }})
    end as pag015,
    case
      when v_coss_wdv_9.perio = '016' then v_coss_wdv_9.pagbtr
      else cast(0 as {{ dbt.type_numeric() }})
    end as pag016,
    case
      when v_coss_wdv_9.perio = '001' then v_coss_wdv_9.pafbtr
      else cast(0 as {{ dbt.type_numeric() }})
    end as paf001,
    case
      when v_coss_wdv_9.perio = '002' then v_coss_wdv_9.pafbtr
      else cast(0 as {{ dbt.type_numeric() }})
    end as paf002,
    case
      when v_coss_wdv_9.perio = '003' then v_coss_wdv_9.pafbtr
      else cast(0 as {{ dbt.type_numeric() }})
    end as paf003,
    case
      when v_coss_wdv_9.perio = '004' then v_coss_wdv_9.pafbtr
      else cast(0 as {{ dbt.type_numeric() }})
    end as paf004,
    case
      when v_coss_wdv_9.perio = '005' then v_coss_wdv_9.pafbtr
      else cast(0 as {{ dbt.type_numeric() }})
    end as paf005,
    case
      when v_coss_wdv_9.perio = '006' then v_coss_wdv_9.pafbtr
      else cast(0 as {{ dbt.type_numeric() }})
    end as paf006,
    case
      when v_coss_wdv_9.perio = '007' then v_coss_wdv_9.pafbtr
      else cast(0 as {{ dbt.type_numeric() }})
    end as paf007,
    case
      when v_coss_wdv_9.perio = '008' then v_coss_wdv_9.pafbtr
      else cast(0 as {{ dbt.type_numeric() }})
    end as paf008,
    case
      when v_coss_wdv_9.perio = '009' then v_coss_wdv_9.pafbtr
      else cast(0 as {{ dbt.type_numeric() }})
    end as paf009,
    case
      when v_coss_wdv_9.perio = '010' then v_coss_wdv_9.pafbtr
      else cast(0 as {{ dbt.type_numeric() }})
    end as paf010,
    case
      when v_coss_wdv_9.perio = '011' then v_coss_wdv_9.pafbtr
      else cast(0 as {{ dbt.type_numeric() }})
    end as paf011,
    case
      when v_coss_wdv_9.perio = '012' then v_coss_wdv_9.pafbtr
      else cast(0 as {{ dbt.type_numeric() }})
    end as paf012,
    case
      when v_coss_wdv_9.perio = '013' then v_coss_wdv_9.pafbtr
      else cast(0 as {{ dbt.type_numeric() }})
    end as paf013,
    case
      when v_coss_wdv_9.perio = '014' then v_coss_wdv_9.pafbtr
      else cast(0 as {{ dbt.type_numeric() }})
    end as paf014,
    case
      when v_coss_wdv_9.perio = '015' then v_coss_wdv_9.pafbtr
      else cast(0 as {{ dbt.type_numeric() }})
    end as paf015,
    case
      when v_coss_wdv_9.perio = '016' then v_coss_wdv_9.pafbtr
      else cast(0 as {{ dbt.type_numeric() }})
    end as paf016,
    case
      when v_coss_wdv_9.perio = '001' then v_coss_wdv_9.megbtr
      else cast(0 as {{ dbt.type_numeric() }})
    end as meg001,
    case
      when v_coss_wdv_9.perio = '002' then v_coss_wdv_9.megbtr
      else cast(0 as {{ dbt.type_numeric() }})
    end as meg002,
    case
      when v_coss_wdv_9.perio = '003' then v_coss_wdv_9.megbtr
      else cast(0 as {{ dbt.type_numeric() }})
    end as meg003,
    case
      when v_coss_wdv_9.perio = '004' then v_coss_wdv_9.megbtr
      else cast(0 as {{ dbt.type_numeric() }})
    end as meg004,
    case
      when v_coss_wdv_9.perio = '005' then v_coss_wdv_9.megbtr
      else cast(0 as {{ dbt.type_numeric() }})
    end as meg005,
    case
      when v_coss_wdv_9.perio = '006' then v_coss_wdv_9.megbtr
      else cast(0 as {{ dbt.type_numeric() }})
    end as meg006,
    case
      when v_coss_wdv_9.perio = '007' then v_coss_wdv_9.megbtr
      else cast(0 as {{ dbt.type_numeric() }})
    end as meg007,
    case
      when v_coss_wdv_9.perio = '008' then v_coss_wdv_9.megbtr
      else cast(0 as {{ dbt.type_numeric() }})
    end as meg008,
    case
      when v_coss_wdv_9.perio = '009' then v_coss_wdv_9.megbtr
      else cast(0 as {{ dbt.type_numeric() }})
    end as meg009,
    case
      when v_coss_wdv_9.perio = '010' then v_coss_wdv_9.megbtr
      else cast(0 as {{ dbt.type_numeric() }})
    end as meg010,
    case
      when v_coss_wdv_9.perio = '011' then v_coss_wdv_9.megbtr
      else cast(0 as {{ dbt.type_numeric() }})
    end as meg011,
    case
      when v_coss_wdv_9.perio = '012' then v_coss_wdv_9.megbtr
      else cast(0 as {{ dbt.type_numeric() }})
    end as meg012,
    case
      when v_coss_wdv_9.perio = '013' then v_coss_wdv_9.megbtr
      else cast(0 as {{ dbt.type_numeric() }})
    end as meg013,
    case
      when v_coss_wdv_9.perio = '014' then v_coss_wdv_9.megbtr
      else cast(0 as {{ dbt.type_numeric() }})
    end as meg014,
    case
      when v_coss_wdv_9.perio = '015' then v_coss_wdv_9.megbtr
      else cast(0 as {{ dbt.type_numeric() }})
    end as meg015,
    case
      when v_coss_wdv_9.perio = '016' then v_coss_wdv_9.megbtr
      else cast(0 as {{ dbt.type_numeric() }})
    end as meg016,
    case
      when v_coss_wdv_9.perio = '001' then v_coss_wdv_9.mefbtr
      else cast(0 as {{ dbt.type_numeric() }})
    end as mef001,
    case
      when v_coss_wdv_9.perio = '002' then v_coss_wdv_9.mefbtr
      else cast(0 as {{ dbt.type_numeric() }})
    end as mef002,
    case
      when v_coss_wdv_9.perio = '003' then v_coss_wdv_9.mefbtr
      else cast(0 as {{ dbt.type_numeric() }})
    end as mef003,
    case
      when v_coss_wdv_9.perio = '004' then v_coss_wdv_9.mefbtr
      else cast(0 as {{ dbt.type_numeric() }})
    end as mef004,
    case
      when v_coss_wdv_9.perio = '005' then v_coss_wdv_9.mefbtr
      else cast(0 as {{ dbt.type_numeric() }})
    end as mef005,
    case
      when v_coss_wdv_9.perio = '006' then v_coss_wdv_9.mefbtr
      else cast(0 as {{ dbt.type_numeric() }})
    end as mef006,
    case
      when v_coss_wdv_9.perio = '007' then v_coss_wdv_9.mefbtr
      else cast(0 as {{ dbt.type_numeric() }})
    end as mef007,
    case
      when v_coss_wdv_9.perio = '008' then v_coss_wdv_9.mefbtr
      else cast(0 as {{ dbt.type_numeric() }})
    end as mef008,
    case
      when v_coss_wdv_9.perio = '009' then v_coss_wdv_9.mefbtr
      else cast(0 as {{ dbt.type_numeric() }})
    end as mef009,
    case
      when v_coss_wdv_9.perio = '010' then v_coss_wdv_9.mefbtr
      else cast(0 as {{ dbt.type_numeric() }})
    end as mef010,
    case
      when v_coss_wdv_9.perio = '011' then v_coss_wdv_9.mefbtr
      else cast(0 as {{ dbt.type_numeric() }})
    end as mef011,
    case
      when v_coss_wdv_9.perio = '012' then v_coss_wdv_9.mefbtr
      else cast(0 as {{ dbt.type_numeric() }})
    end as mef012,
    case
      when v_coss_wdv_9.perio = '013' then v_coss_wdv_9.mefbtr
      else cast(0 as {{ dbt.type_numeric() }})
    end as mef013,
    case
      when v_coss_wdv_9.perio = '014' then v_coss_wdv_9.mefbtr
      else cast(0 as {{ dbt.type_numeric() }})
    end as mef014,
    case
      when v_coss_wdv_9.perio = '015' then v_coss_wdv_9.mefbtr
      else cast(0 as {{ dbt.type_numeric() }})
    end as mef015,
    case
      when v_coss_wdv_9.perio = '016' then v_coss_wdv_9.mefbtr
      else cast(0 as {{ dbt.type_numeric() }})
    end as mef016,
    case
      when v_coss_wdv_9.perio = '001' then v_coss_wdv_9.muvflg
      else 0
    end as i001,
    case
      when v_coss_wdv_9.perio = '002' then v_coss_wdv_9.muvflg
      else 0
    end as i002,
    case
      when v_coss_wdv_9.perio = '003' then v_coss_wdv_9.muvflg
      else 0
    end as i003,
    case
      when v_coss_wdv_9.perio = '004' then v_coss_wdv_9.muvflg
      else 0
    end as i004,
    case
      when v_coss_wdv_9.perio = '005' then v_coss_wdv_9.muvflg
      else 0
    end as i005,
    case
      when v_coss_wdv_9.perio = '006' then v_coss_wdv_9.muvflg
      else 0
    end as i006,
    case
      when v_coss_wdv_9.perio = '007' then v_coss_wdv_9.muvflg
      else 0
    end as i007,
    case
      when v_coss_wdv_9.perio = '008' then v_coss_wdv_9.muvflg
      else 0
    end as i008,
    case
      when v_coss_wdv_9.perio = '009' then v_coss_wdv_9.muvflg
      else 0
    end as i009,
    case
      when v_coss_wdv_9.perio = '010' then v_coss_wdv_9.muvflg
      else 0
    end as i010,
    case
      when v_coss_wdv_9.perio = '011' then v_coss_wdv_9.muvflg
      else 0
    end as i011,
    case
      when v_coss_wdv_9.perio = '012' then v_coss_wdv_9.muvflg
      else 0
    end as i012,
    case
      when v_coss_wdv_9.perio = '013' then v_coss_wdv_9.muvflg
      else 0
    end as i013,
    case
      when v_coss_wdv_9.perio = '014' then v_coss_wdv_9.muvflg
      else 0
    end as i014,
    case
      when v_coss_wdv_9.perio = '015' then v_coss_wdv_9.muvflg
      else 0
    end as i015,
    case
      when v_coss_wdv_9.perio = '016' then v_coss_wdv_9.muvflg
      else 0
    end as i016,
    v_coss_wdv_9.beltp,
    v_coss_wdv_9.timestmp,
    v_coss_wdv_9.bukrs,
    v_coss_wdv_9.fkber,
    v_coss_wdv_9.segment,
    v_coss_wdv_9.geber,
    v_coss_wdv_9.grant_nbr,
    v_coss_wdv_9.budget_pd
  from
    sq_coss_wdv_8 as v_coss_wdv_9
),
sq_coss_wdv_11 as (
  select
    v_coss_wdv_10.mandt,
    v_coss_wdv_10.lednr,
    v_coss_wdv_10.objnr,
    v_coss_wdv_10.gjahr,
    v_coss_wdv_10.wrttp,
    v_coss_wdv_10.versn,
    v_coss_wdv_10.kstar,
    v_coss_wdv_10.hrkft,
    v_coss_wdv_10.vrgng,
    v_coss_wdv_10.parob,
    v_coss_wdv_10.uspob,
    v_coss_wdv_10.beknz,
    v_coss_wdv_10.twaer,
    v_coss_wdv_10.perbl,
    v_coss_wdv_10.meinh,
    v_coss_wdv_10.bukrs,
    v_coss_wdv_10.fkber,
    v_coss_wdv_10.segment,
    v_coss_wdv_10.geber,
    v_coss_wdv_10.grant_nbr,
    v_coss_wdv_10.budget_pd,
    v_coss_wdv_10.beltp,
    sum(v_coss_wdv_10.wtg001) as wtg001,
    sum(v_coss_wdv_10.wtg002) as wtg002,
    sum(v_coss_wdv_10.wtg003) as wtg003,
    sum(v_coss_wdv_10.wtg004) as wtg004,
    sum(v_coss_wdv_10.wtg005) as wtg005,
    sum(v_coss_wdv_10.wtg006) as wtg006,
    sum(v_coss_wdv_10.wtg007) as wtg007,
    sum(v_coss_wdv_10.wtg008) as wtg008,
    sum(v_coss_wdv_10.wtg009) as wtg009,
    sum(v_coss_wdv_10.wtg010) as wtg010,
    sum(v_coss_wdv_10.wtg011) as wtg011,
    sum(v_coss_wdv_10.wtg012) as wtg012,
    sum(v_coss_wdv_10.wtg013) as wtg013,
    sum(v_coss_wdv_10.wtg014) as wtg014,
    sum(v_coss_wdv_10.wtg015) as wtg015,
    sum(v_coss_wdv_10.wtg016) as wtg016,
    sum(v_coss_wdv_10.wog001) as wog001,
    sum(v_coss_wdv_10.wog002) as wog002,
    sum(v_coss_wdv_10.wog003) as wog003,
    sum(v_coss_wdv_10.wog004) as wog004,
    sum(v_coss_wdv_10.wog005) as wog005,
    sum(v_coss_wdv_10.wog006) as wog006,
    sum(v_coss_wdv_10.wog007) as wog007,
    sum(v_coss_wdv_10.wog008) as wog008,
    sum(v_coss_wdv_10.wog009) as wog009,
    sum(v_coss_wdv_10.wog010) as wog010,
    sum(v_coss_wdv_10.wog011) as wog011,
    sum(v_coss_wdv_10.wog012) as wog012,
    sum(v_coss_wdv_10.wog013) as wog013,
    sum(v_coss_wdv_10.wog014) as wog014,
    sum(v_coss_wdv_10.wog015) as wog015,
    sum(v_coss_wdv_10.wog016) as wog016,
    sum(v_coss_wdv_10.wkg001) as wkg001,
    sum(v_coss_wdv_10.wkg002) as wkg002,
    sum(v_coss_wdv_10.wkg003) as wkg003,
    sum(v_coss_wdv_10.wkg004) as wkg004,
    sum(v_coss_wdv_10.wkg005) as wkg005,
    sum(v_coss_wdv_10.wkg006) as wkg006,
    sum(v_coss_wdv_10.wkg007) as wkg007,
    sum(v_coss_wdv_10.wkg008) as wkg008,
    sum(v_coss_wdv_10.wkg009) as wkg009,
    sum(v_coss_wdv_10.wkg010) as wkg010,
    sum(v_coss_wdv_10.wkg011) as wkg011,
    sum(v_coss_wdv_10.wkg012) as wkg012,
    sum(v_coss_wdv_10.wkg013) as wkg013,
    sum(v_coss_wdv_10.wkg014) as wkg014,
    sum(v_coss_wdv_10.wkg015) as wkg015,
    sum(v_coss_wdv_10.wkg016) as wkg016,
    sum(v_coss_wdv_10.wkf001) as wkf001,
    sum(v_coss_wdv_10.wkf002) as wkf002,
    sum(v_coss_wdv_10.wkf003) as wkf003,
    sum(v_coss_wdv_10.wkf004) as wkf004,
    sum(v_coss_wdv_10.wkf005) as wkf005,
    sum(v_coss_wdv_10.wkf006) as wkf006,
    sum(v_coss_wdv_10.wkf007) as wkf007,
    sum(v_coss_wdv_10.wkf008) as wkf008,
    sum(v_coss_wdv_10.wkf009) as wkf009,
    sum(v_coss_wdv_10.wkf010) as wkf010,
    sum(v_coss_wdv_10.wkf011) as wkf011,
    sum(v_coss_wdv_10.wkf012) as wkf012,
    sum(v_coss_wdv_10.wkf013) as wkf013,
    sum(v_coss_wdv_10.wkf014) as wkf014,
    sum(v_coss_wdv_10.wkf015) as wkf015,
    sum(v_coss_wdv_10.wkf016) as wkf016,
    sum(v_coss_wdv_10.pag001) as pag001,
    sum(v_coss_wdv_10.pag002) as pag002,
    sum(v_coss_wdv_10.pag003) as pag003,
    sum(v_coss_wdv_10.pag004) as pag004,
    sum(v_coss_wdv_10.pag005) as pag005,
    sum(v_coss_wdv_10.pag006) as pag006,
    sum(v_coss_wdv_10.pag007) as pag007,
    sum(v_coss_wdv_10.pag008) as pag008,
    sum(v_coss_wdv_10.pag009) as pag009,
    sum(v_coss_wdv_10.pag010) as pag010,
    sum(v_coss_wdv_10.pag011) as pag011,
    sum(v_coss_wdv_10.pag012) as pag012,
    sum(v_coss_wdv_10.pag013) as pag013,
    sum(v_coss_wdv_10.pag014) as pag014,
    sum(v_coss_wdv_10.pag015) as pag015,
    sum(v_coss_wdv_10.pag016) as pag016,
    sum(v_coss_wdv_10.paf001) as paf001,
    sum(v_coss_wdv_10.paf002) as paf002,
    sum(v_coss_wdv_10.paf003) as paf003,
    sum(v_coss_wdv_10.paf004) as paf004,
    sum(v_coss_wdv_10.paf005) as paf005,
    sum(v_coss_wdv_10.paf006) as paf006,
    sum(v_coss_wdv_10.paf007) as paf007,
    sum(v_coss_wdv_10.paf008) as paf008,
    sum(v_coss_wdv_10.paf009) as paf009,
    sum(v_coss_wdv_10.paf010) as paf010,
    sum(v_coss_wdv_10.paf011) as paf011,
    sum(v_coss_wdv_10.paf012) as paf012,
    sum(v_coss_wdv_10.paf013) as paf013,
    sum(v_coss_wdv_10.paf014) as paf014,
    sum(v_coss_wdv_10.paf015) as paf015,
    sum(v_coss_wdv_10.paf016) as paf016,
    sum(v_coss_wdv_10.meg001) as meg001,
    sum(v_coss_wdv_10.meg002) as meg002,
    sum(v_coss_wdv_10.meg003) as meg003,
    sum(v_coss_wdv_10.meg004) as meg004,
    sum(v_coss_wdv_10.meg005) as meg005,
    sum(v_coss_wdv_10.meg006) as meg006,
    sum(v_coss_wdv_10.meg007) as meg007,
    sum(v_coss_wdv_10.meg008) as meg008,
    sum(v_coss_wdv_10.meg009) as meg009,
    sum(v_coss_wdv_10.meg010) as meg010,
    sum(v_coss_wdv_10.meg011) as meg011,
    sum(v_coss_wdv_10.meg012) as meg012,
    sum(v_coss_wdv_10.meg013) as meg013,
    sum(v_coss_wdv_10.meg014) as meg014,
    sum(v_coss_wdv_10.meg015) as meg015,
    sum(v_coss_wdv_10.meg016) as meg016,
    sum(v_coss_wdv_10.mef001) as mef001,
    sum(v_coss_wdv_10.mef002) as mef002,
    sum(v_coss_wdv_10.mef003) as mef003,
    sum(v_coss_wdv_10.mef004) as mef004,
    sum(v_coss_wdv_10.mef005) as mef005,
    sum(v_coss_wdv_10.mef006) as mef006,
    sum(v_coss_wdv_10.mef007) as mef007,
    sum(v_coss_wdv_10.mef008) as mef008,
    sum(v_coss_wdv_10.mef009) as mef009,
    sum(v_coss_wdv_10.mef010) as mef010,
    sum(v_coss_wdv_10.mef011) as mef011,
    sum(v_coss_wdv_10.mef012) as mef012,
    sum(v_coss_wdv_10.mef013) as mef013,
    sum(v_coss_wdv_10.mef014) as mef014,
    sum(v_coss_wdv_10.mef015) as mef015,
    sum(v_coss_wdv_10.mef016) as mef016,
    max(v_coss_wdv_10.i001) as i001,
    max(v_coss_wdv_10.i002) as i002,
    max(v_coss_wdv_10.i003) as i003,
    max(v_coss_wdv_10.i004) as i004,
    max(v_coss_wdv_10.i005) as i005,
    max(v_coss_wdv_10.i006) as i006,
    max(v_coss_wdv_10.i007) as i007,
    max(v_coss_wdv_10.i008) as i008,
    max(v_coss_wdv_10.i009) as i009,
    max(v_coss_wdv_10.i010) as i010,
    max(v_coss_wdv_10.i011) as i011,
    max(v_coss_wdv_10.i012) as i012,
    max(v_coss_wdv_10.i013) as i013,
    max(v_coss_wdv_10.i014) as i014,
    max(v_coss_wdv_10.i015) as i015,
    max(v_coss_wdv_10.i016) as i016,
    max(v_coss_wdv_10.timestmp) as timestmp
  from sq_coss_wdv_10 as v_coss_wdv_10
  {{ dbt_utils.group_by(22) }}
)

select
  v_coss_wdv_11.mandt,
  v_coss_wdv_11.lednr,
  v_coss_wdv_11.objnr,
  v_coss_wdv_11.gjahr,
  v_coss_wdv_11.wrttp,
  v_coss_wdv_11.versn,
  v_coss_wdv_11.kstar,
  v_coss_wdv_11.hrkft,
  v_coss_wdv_11.vrgng,
  v_coss_wdv_11.parob,
  v_coss_wdv_11.uspob,
  v_coss_wdv_11.beknz,
  v_coss_wdv_11.twaer,
  v_coss_wdv_11.perbl,
  v_coss_wdv_11.meinh,
  v_coss_wdv_11.wtg001,
  v_coss_wdv_11.wtg002,
  v_coss_wdv_11.wtg003,
  v_coss_wdv_11.wtg004,
  v_coss_wdv_11.wtg005,
  v_coss_wdv_11.wtg006,
  v_coss_wdv_11.wtg007,
  v_coss_wdv_11.wtg008,
  v_coss_wdv_11.wtg009,
  v_coss_wdv_11.wtg010,
  v_coss_wdv_11.wtg011,
  v_coss_wdv_11.wtg012,
  v_coss_wdv_11.wtg013,
  v_coss_wdv_11.wtg014,
  v_coss_wdv_11.wtg015,
  v_coss_wdv_11.wtg016,
  v_coss_wdv_11.wog001,
  v_coss_wdv_11.wog002,
  v_coss_wdv_11.wog003,
  v_coss_wdv_11.wog004,
  v_coss_wdv_11.wog005,
  v_coss_wdv_11.wog006,
  v_coss_wdv_11.wog007,
  v_coss_wdv_11.wog008,
  v_coss_wdv_11.wog009,
  v_coss_wdv_11.wog010,
  v_coss_wdv_11.wog011,
  v_coss_wdv_11.wog012,
  v_coss_wdv_11.wog013,
  v_coss_wdv_11.wog014,
  v_coss_wdv_11.wog015,
  v_coss_wdv_11.wog016,
  v_coss_wdv_11.wkg001,
  v_coss_wdv_11.wkg002,
  v_coss_wdv_11.wkg003,
  v_coss_wdv_11.wkg004,
  v_coss_wdv_11.wkg005,
  v_coss_wdv_11.wkg006,
  v_coss_wdv_11.wkg007,
  v_coss_wdv_11.wkg008,
  v_coss_wdv_11.wkg009,
  v_coss_wdv_11.wkg010,
  v_coss_wdv_11.wkg011,
  v_coss_wdv_11.wkg012,
  v_coss_wdv_11.wkg013,
  v_coss_wdv_11.wkg014,
  v_coss_wdv_11.wkg015,
  v_coss_wdv_11.wkg016,
  v_coss_wdv_11.wkf001,
  v_coss_wdv_11.wkf002,
  v_coss_wdv_11.wkf003,
  v_coss_wdv_11.wkf004,
  v_coss_wdv_11.wkf005,
  v_coss_wdv_11.wkf006,
  v_coss_wdv_11.wkf007,
  v_coss_wdv_11.wkf008,
  v_coss_wdv_11.wkf009,
  v_coss_wdv_11.wkf010,
  v_coss_wdv_11.wkf011,
  v_coss_wdv_11.wkf012,
  v_coss_wdv_11.wkf013,
  v_coss_wdv_11.wkf014,
  v_coss_wdv_11.wkf015,
  v_coss_wdv_11.wkf016,
  v_coss_wdv_11.pag001,
  v_coss_wdv_11.pag002,
  v_coss_wdv_11.pag003,
  v_coss_wdv_11.pag004,
  v_coss_wdv_11.pag005,
  v_coss_wdv_11.pag006,
  v_coss_wdv_11.pag007,
  v_coss_wdv_11.pag008,
  v_coss_wdv_11.pag009,
  v_coss_wdv_11.pag010,
  v_coss_wdv_11.pag011,
  v_coss_wdv_11.pag012,
  v_coss_wdv_11.pag013,
  v_coss_wdv_11.pag014,
  v_coss_wdv_11.pag015,
  v_coss_wdv_11.pag016,
  v_coss_wdv_11.paf001,
  v_coss_wdv_11.paf002,
  v_coss_wdv_11.paf003,
  v_coss_wdv_11.paf004,
  v_coss_wdv_11.paf005,
  v_coss_wdv_11.paf006,
  v_coss_wdv_11.paf007,
  v_coss_wdv_11.paf008,
  v_coss_wdv_11.paf009,
  v_coss_wdv_11.paf010,
  v_coss_wdv_11.paf011,
  v_coss_wdv_11.paf012,
  v_coss_wdv_11.paf013,
  v_coss_wdv_11.paf014,
  v_coss_wdv_11.paf015,
  v_coss_wdv_11.paf016,
  v_coss_wdv_11.meg001,
  v_coss_wdv_11.meg002,
  v_coss_wdv_11.meg003,
  v_coss_wdv_11.meg004,
  v_coss_wdv_11.meg005,
  v_coss_wdv_11.meg006,
  v_coss_wdv_11.meg007,
  v_coss_wdv_11.meg008,
  v_coss_wdv_11.meg009,
  v_coss_wdv_11.meg010,
  v_coss_wdv_11.meg011,
  v_coss_wdv_11.meg012,
  v_coss_wdv_11.meg013,
  v_coss_wdv_11.meg014,
  v_coss_wdv_11.meg015,
  v_coss_wdv_11.meg016,
  v_coss_wdv_11.mef001,
  v_coss_wdv_11.mef002,
  v_coss_wdv_11.mef003,
  v_coss_wdv_11.mef004,
  v_coss_wdv_11.mef005,
  v_coss_wdv_11.mef006,
  v_coss_wdv_11.mef007,
  v_coss_wdv_11.mef008,
  v_coss_wdv_11.mef009,
  v_coss_wdv_11.mef010,
  v_coss_wdv_11.mef011,
  v_coss_wdv_11.mef012,
  v_coss_wdv_11.mef013,
  v_coss_wdv_11.mef014,
  v_coss_wdv_11.mef015,
  v_coss_wdv_11.mef016,
  case
    when v_coss_wdv_11.i001 = 0 then ''
    else 'x'
  end as muv001,
  case
    when v_coss_wdv_11.i002 = 0 then ''
    else 'x'
  end as muv002,
  case
    when v_coss_wdv_11.i003 = 0 then ''
    else 'x'
  end as muv003,
  case
    when v_coss_wdv_11.i004 = 0 then ''
    else 'x'
  end as muv004,
  case
    when v_coss_wdv_11.i005 = 0 then ''
    else 'x'
  end as muv005,
  case
    when v_coss_wdv_11.i006 = 0 then ''
    else 'x'
  end as muv006,
  case
    when v_coss_wdv_11.i007 = 0 then ''
    else 'x'
  end as muv007,
  case
    when v_coss_wdv_11.i008 = 0 then ''
    else 'x'
  end as muv008,
  case
    when v_coss_wdv_11.i009 = 0 then ''
    else 'x'
  end as muv009,
  case
    when v_coss_wdv_11.i010 = 0 then ''
    else 'x'
  end as muv010,
  case
    when v_coss_wdv_11.i011 = 0 then ''
    else 'x'
  end as muv011,
  case
    when v_coss_wdv_11.i012 = 0 then ''
    else 'x'
  end as muv012,
  case
    when v_coss_wdv_11.i013 = 0 then ''
    else 'x'
  end as muv013,
  case
    when v_coss_wdv_11.i014 = 0 then ''
    else 'x'
  end as muv014,
  case
    when v_coss_wdv_11.i015 = 0 then ''
    else 'x'
  end as muv015,
  case
    when v_coss_wdv_11.i016 = 0 then ''
    else 'x'
  end as muv016,
  v_coss_wdv_11.beltp,
  v_coss_wdv_11.timestmp,
  v_coss_wdv_11.bukrs,
  v_coss_wdv_11.fkber,
  v_coss_wdv_11.segment,
  v_coss_wdv_11.geber,
  v_coss_wdv_11.grant_nbr,
  v_coss_wdv_11.budget_pd
from sq_coss_wdv_11 as v_coss_wdv_11
where v_coss_wdv_11.wrttp = '04' or v_coss_wdv_11.wrttp = '11'