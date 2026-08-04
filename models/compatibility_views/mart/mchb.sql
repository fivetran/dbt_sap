{{ config(enabled=var('sap_using_matdoc_extract', True) and var('sap_using_mchb', True)) }}

with stg_sap__matdoc_extract as (
  select *
  from {{ ref('stg_sap__matdoc_extract') }}
),

stg_sap__mchb as (
  select *
  from {{ ref('stg_sap__mchb') }}
),

nsdm_v_mchb_agg as (
  select
    matdoc_extract.mandt,
    matdoc_extract.matbf as matnr,
    matdoc_extract.werks,
    matdoc_extract.lgort_sid as lgort,
    matdoc_extract.charg_sid as charg,
    matdoc_extract.lbbsa_sid as lbbsa,
    sum(matdoc_extract.stock_qty_l1) as stock_qty,
    sum(matdoc_extract._cwm_stock_qty_l1) as _cwm_stock_qty,
    max(matdoc_extract.gjper_curr_per) as gjper_max
  from stg_sap__matdoc_extract as matdoc_extract
  where (not (matdoc_extract.charg_sid = '')
      and (matdoc_extract.sobkz = ''and (
          matdoc_extract.lbbsa_sid = '01'
          or matdoc_extract.lbbsa_sid = '02'
          or matdoc_extract.lbbsa_sid = '03'
          or matdoc_extract.lbbsa_sid = '04'
          or matdoc_extract.lbbsa_sid = '07'
          or matdoc_extract.lbbsa_sid = '08'
        )
      )
    )
  group by 1,2,3,4,5,6
),

nsdm_v_mchb_diff as (
  select
    nsdm_v_mchb_agg.mandt,
    nsdm_v_mchb_agg.matnr,
    nsdm_v_mchb_agg.werks,
    nsdm_v_mchb_agg.lgort,
    nsdm_v_mchb_agg.charg,
    max(nsdm_v_mchb_agg.gjper_max) as gjper,
    sum(
      case nsdm_v_mchb_agg.lbbsa
        when '01' then nsdm_v_mchb_agg.stock_qty
        else cast(0 as {{ dbt.type_numeric() }})
      end
    ) as clabs,
    sum(
      case nsdm_v_mchb_agg.lbbsa
        when '04' then nsdm_v_mchb_agg.stock_qty
        else cast(0 as {{ dbt.type_numeric() }})
      end
    ) as cumlm,
    sum(
      case nsdm_v_mchb_agg.lbbsa
        when '02' then nsdm_v_mchb_agg.stock_qty
        else cast(0 as {{ dbt.type_numeric() }})
      end
    ) as cinsm,
    sum(
      case nsdm_v_mchb_agg.lbbsa
        when '08' then nsdm_v_mchb_agg.stock_qty
        else cast(0 as {{ dbt.type_numeric() }})
      end
    ) as ceinm,
    sum(
      case nsdm_v_mchb_agg.lbbsa
        when '07' then nsdm_v_mchb_agg.stock_qty
        else cast(0 as {{ dbt.type_numeric() }})
      end
    ) as cspem,
    sum(
      case nsdm_v_mchb_agg.lbbsa
        when '03' then nsdm_v_mchb_agg.stock_qty
        else cast(0 as {{ dbt.type_numeric() }})
      end
    ) as cretm,
    cast(0 as {{ dbt.type_numeric() }}) as cvmla,
    cast(0 as {{ dbt.type_numeric() }}) as cvmum,
    cast(0 as {{ dbt.type_numeric() }}) as cvmin,
    cast(0 as {{ dbt.type_numeric() }}) as cvmei,
    cast(0 as {{ dbt.type_numeric() }}) as cvmsp,
    cast(0 as {{ dbt.type_numeric() }}) as cvmre,
    sum(
      case nsdm_v_mchb_agg.lbbsa
        when '01' then nsdm_v_mchb_agg._cwm_stock_qty
        else cast(0 as {{ dbt.type_numeric() }})
      end
    ) as _cwm_clabs,
    sum(
      case nsdm_v_mchb_agg.lbbsa
        when '04' then nsdm_v_mchb_agg._cwm_stock_qty
        else cast(0 as {{ dbt.type_numeric() }})
      end
    ) as _cwm_cumlm,
    sum(
      case nsdm_v_mchb_agg.lbbsa
        when '02' then nsdm_v_mchb_agg._cwm_stock_qty
        else cast(0 as {{ dbt.type_numeric() }})
      end
    ) as _cwm_cinsm,
    sum(
      case nsdm_v_mchb_agg.lbbsa
        when '08' then nsdm_v_mchb_agg._cwm_stock_qty
        else cast(0 as {{ dbt.type_numeric() }})
      end
    ) as _cwm_ceinm,
    sum(
      case nsdm_v_mchb_agg.lbbsa
        when '07' then nsdm_v_mchb_agg._cwm_stock_qty
        else cast(0 as {{ dbt.type_numeric() }})
      end
    ) as _cwm_cspem,
    sum(
      case nsdm_v_mchb_agg.lbbsa
        when '03' then nsdm_v_mchb_agg._cwm_stock_qty
        else cast(0 as {{ dbt.type_numeric() }})
      end
    ) as _cwm_cretm,
    cast(0 as {{ dbt.type_numeric() }}) as _cwm_cvmla,
    cast(0 as {{ dbt.type_numeric() }}) as _cwm_cvmum,
    cast(0 as {{ dbt.type_numeric() }}) as _cwm_cvmin,
    cast(0 as {{ dbt.type_numeric() }}) as _cwm_cvmei,
    cast(0 as {{ dbt.type_numeric() }}) as _cwm_cvmsp,
    cast(0 as {{ dbt.type_numeric() }}) as _cwm_cvmre,
    'x' as chrue
  from nsdm_v_mchb_agg
  group by 1,2,3,4,5
)

select
  t.mandt,
  t.matnr,
  t.werks,
  t.lgort,
  t.charg,
  t.lvorm,
  t.ersda,
  t.ernam,
  t.laeda,
  t.aenam,
  case
    when (m.gjper = '0000000' or m.gjper is null) then t.lfgja
    else (rtrim(substring(m.gjper, 1, 4)))
  end as lfgja,
  case
    when (m.gjper = '0000000' or m.gjper is null) then t.lfmon
    else (rtrim(substring(m.gjper, 6, 2)))
  end as lfmon,
  t.sperc,
  case
    when m.clabs is null then 0
    else m.clabs
  end as clabs,
  case
    when m.cumlm is null then 0
    else m.cumlm
  end as cumlm,
  case
    when m.cinsm is null then 0
    else m.cinsm
  end as cinsm,
  case
    when m.ceinm is null then 0
    else m.ceinm
  end as ceinm,
  case
    when m.cspem is null then 0
    else m.cspem
  end as cspem,
  case
    when m.cretm is null then 0
    else m.cretm
  end as cretm,
  case
    when m.cvmla is null then 0
    else m.cvmla
  end as cvmla,
  case
    when m.cvmum is null then 0
    else m.cvmum
  end as cvmum,
  case
    when m.cvmin is null then 0
    else m.cvmin
  end as cvmin,
  case
    when m.cvmei is null then 0
    else m.cvmei
  end as cvmei,
  case
    when m.cvmsp is null then 0
    else m.cvmsp
  end as cvmsp,
  case
    when m.cvmre is null then 0
    else m.cvmre
  end as cvmre,
  t.kzicl,
  t.kzicq,
  t.kzice,
  t.kzics,
  t.kzvcl,
  t.kzvcq,
  t.kzvce,
  t.kzvcs,
  t.herkl,
  t.chdll,
  t.chjin,
  'x' as chrue,
  t.sgt_scat,
  '' as fsh_season_year,
  '' as fsh_season,
  '' as fsh_collection,
  '' as fsh_theme,
  t.fsh_salloc_qty,
  case
    when m._cwm_clabs is null then 0
    else m._cwm_clabs
  end as _cwm_clabs,
  case
    when m._cwm_cinsm is null then 0
    else m._cwm_cinsm
  end as _cwm_cinsm,
  case
    when m._cwm_ceinm is null then 0
    else m._cwm_ceinm
  end as _cwm_ceinm,
  case
    when m._cwm_cspem is null then 0
    else m._cwm_cspem
  end as _cwm_cspem,
  case
    when m._cwm_cretm is null then 0
    else m._cwm_cretm
  end as _cwm_cretm,
  case
    when m._cwm_cumlm is null then 0
    else m._cwm_cumlm
  end as _cwm_cumlm,
  case
    when m._cwm_cvmla is null then 0
    else m._cwm_cvmla
  end as _cwm_cvmla,
  case
    when m._cwm_cvmin is null then 0
    else m._cwm_cvmin
  end as _cwm_cvmin,
  case
    when m._cwm_cvmei is null then 0
    else m._cwm_cvmei
  end as _cwm_cvmei,
  case
    when m._cwm_cvmsp is null then 0
    else m._cwm_cvmsp
  end as _cwm_cvmsp,
  case
    when m._cwm_cvmre is null then 0
    else m._cwm_cvmre
  end as _cwm_cvmre,
  case
    when m._cwm_cvmum is null then 0
    else m._cwm_cvmum
  end as _cwm_cvmum
from stg_sap__mchb as t
left outer join nsdm_v_mchb_diff as m 
  on (t.mandt = m.mandt and t.matnr = m.matnr and t.werks = m.werks and t.lgort = m.lgort and t.charg = m.charg)