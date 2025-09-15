{{ config(enabled=var('sap_using_matdoc_extract', True) and var('sap_using_marc', True) and var('sap_using_t001w', True) and var('sap_using_sapsll_tunos', True) and var('sap_using_sapsll_maritc', True) and var('sap_using_sapsll_nosca', True) and var('sap_using_sapsll_clsnr', True)) }}

with stg_sap__matdoc_extract as (
  select *
  from {{ ref('stg_sap__matdoc_extract') }}
),

stg_sap__marc as (
  select *
  from {{ ref('stg_sap__marc') }}
),

stg_sap__t001w as (
  select *
  from {{ ref('stg_sap__t001w') }}
),

stg_sap__sapsll_tunos as (
  select *
  from {{ ref('stg_sap__sapsll_tunos') }}
),

stg_sap__sapsll_maritc as (
  select *
  from {{ ref('stg_sap__sapsll_maritc') }}
),

stg_sap__sapsll_nosca as (
  select *
  from {{ ref('stg_sap__sapsll_nosca') }}
),

stg_sap__sapsll_clsnr as (
  select *
  from {{ ref('stg_sap__sapsll_clsnr') }}
),

nsdm_v_marc_agg as (
  select
    matdoc_extract.mandt,
    matdoc_extract.matbf as matnr,
    matdoc_extract.werks,
    matdoc_extract.lbbsa_sid as lbbsa,
    sum(matdoc_extract.stock_qty_l2) as stock_qty,
    sum(matdoc_extract._cwm_stock_qty_l2) as _cwm_stock_qty,
    sum(matdoc_extract.stock_vkwrt_l2) as stock_vkwrt,
    max(matdoc_extract.gjper_curr_per) as gjper_max
  from stg_sap__matdoc_extract as matdoc_extract

  where (matdoc_extract.stock_ind_l2 = '' 
    and (matdoc_extract.sobkz = ''
      and (matdoc_extract.lbbsa_sid = '05' or matdoc_extract.lbbsa_sid = '06' or matdoc_extract.lbbsa_sid = '09' or matdoc_extract.lbbsa_sid = '10')
      )
    )

  group by 1,2,3,4
),

nsdm_v_marc_diff as (
  select
    nsdm_v_marc_agg.mandt,
    nsdm_v_marc_agg.matnr,
    nsdm_v_marc_agg.werks,
    sum(
      case
        nsdm_v_marc_agg.lbbsa
        when '05'
        then nsdm_v_marc_agg.stock_qty
        else cast(0 as {{ dbt.type_numeric() }})
      end
    ) as umlmc,
    sum(
      case
        nsdm_v_marc_agg.lbbsa
        when '06'
        then nsdm_v_marc_agg.stock_qty
        else cast(0 as {{ dbt.type_numeric() }})
      end
    ) as trame,
    sum(
      case
        nsdm_v_marc_agg.lbbsa
        when '05'
        then nsdm_v_marc_agg.stock_vkwrt
        else cast(0 as {{ dbt.type_numeric() }})
      end
    ) as vkumc,
    sum(
      case
        nsdm_v_marc_agg.lbbsa
        when '06'
        then nsdm_v_marc_agg.stock_vkwrt
        else cast(0 as {{ dbt.type_numeric() }})
      end
    ) as vktrw,
    sum(
      case
        nsdm_v_marc_agg.lbbsa
        when '09'
        then nsdm_v_marc_agg.stock_qty
        else cast(0 as {{ dbt.type_numeric() }})
      end
    ) as glgmg,
    sum(
      case
        nsdm_v_marc_agg.lbbsa
        when '09'
        then nsdm_v_marc_agg.stock_vkwrt
        else cast(0 as {{ dbt.type_numeric() }})
      end
    ) as vkglg,
    sum(
      case
        nsdm_v_marc_agg.lbbsa
        when '10'
        then nsdm_v_marc_agg.stock_qty
        else cast(0 as {{ dbt.type_numeric() }})
      end
    ) as bwesb,
    cast(max(nsdm_v_marc_agg.gjper_max) as {{ dbt.type_string() }}) as gjper,
    'x' as mcrue,
    sum(
      case
        nsdm_v_marc_agg.lbbsa
        when '05'
        then nsdm_v_marc_agg._cwm_stock_qty
        else cast(0 as {{ dbt.type_numeric() }})
      end
    ) as _cwm_umlmc,
    sum(
      case
        nsdm_v_marc_agg.lbbsa
        when '06'
        then nsdm_v_marc_agg._cwm_stock_qty
        else cast(0 as {{ dbt.type_numeric() }})
      end
    ) as _cwm_trame,
    sum(
      case
        nsdm_v_marc_agg.lbbsa
        when '10'
        then nsdm_v_marc_agg._cwm_stock_qty
        else cast(0 as {{ dbt.type_numeric() }})
      end
    ) as _cwm_bwesb
  from nsdm_v_marc_agg nsdm_v_marc_agg
  group by 1,2,3
)
select
  t.mandt,
  t.matnr,
  t.werks,
  t.pstat,
  t.lvorm,
  t.bwtty,
  t.xchar,
  t.mmsta,
  t.mmstd,
  t.maabc,
  t.kzkri,
  t.ekgrp,
  t.ausme,
  t.dispr,
  t.dismm,
  t.dispo,
  t.kzdie,
  t.plifz,
  t.webaz,
  t.perkz,
  t.ausss,
  t.disls,
  t.beskz,
  t.sobsl,
  t.minbe,
  t.eisbe,
  t.bstmi,
  t.bstma,
  t.bstfe,
  t.bstrf,
  t.mabst,
  t.losfx,
  t.sbdkz,
  t.lagpr,
  t.altsl,
  t.kzaus,
  t.ausdt,
  t.nfmat,
  t.kzbed,
  t.miskz,
  t.fhori,
  t.pfrei,
  t.ffrei,
  t.rgekz,
  t.fevor,
  t.bearz,
  t.ruezt,
  t.tranz,
  t.basmg,
  t.dzeit,
  t.maxlz,
  t.lzeih,
  t.kzpro,
  t.gpmkz,
  t.ueeto,
  t.ueetk,
  t.uneto,
  t.wzeit,
  t.atpkz,
  t.vzusl,
  t.herbl,
  t.insmk,
  t.sproz,
  t.quazt,
  t.ssqss,
  t.mpdau,
  t.kzppv,
  t.kzdkz,
  t.wstgh,
  t.prfrq,
  t.nkmpr,
  case
    when m.umlmc is null
    then 0
    else m.umlmc
  end as umlmc,
  t.ladgr,
  t.xchpf,
  t.usequ,
  t.lgrad,
  t.auftl,
  t.plvar,
  t.otype,
  t.objid,
  t.mtvfp,
  t.periv,
  t.kzkfk,
  t.vrvez,
  t.vbamg,
  t.vbeaz,
  t.lizyk,
  t.bwscl,
  t.kautb,
  t.kordb,
  case
    when materialtradeclassification.ccngn is null
    then ''
    else (
      rtrim(
        substring(
          materialtradeclassification.ccngn,
          1,
          17
        )
      )
    )
  end as stawn,
  t.herkl,
  t.herkr,
  materialtradeunit.bemeh as expme,
  t.mtver,
  t.prctr,
  case
    when m.trame is null
    then 0
    else m.trame
  end as trame,
  t.mrppp,
  t.sauft,
  t.fxhor,
  t.vrmod,
  t.vint1,
  t.vint2,
  t.verkz,
  t.stlal,
  t.stlan,
  t.plnnr,
  t.aplal,
  t.losgr,
  t.sobsk,
  t.frtme,
  t.lgpro,
  t.disgr,
  t.kausf,
  t.qzgtp,
  t.qmatv,
  t.takzt,
  t.rwpro,
  t.copam,
  t.abcin,
  t.awsls,
  t.sernp,
  t.cuobj,
  t.stdpd,
  t.sfepr,
  t.xmcng,
  t.qssys,
  t.lfrhy,
  t.rdprf,
  t.vrbmt,
  t.vrbwk,
  t.vrbdt,
  t.vrbfk,
  t.autru,
  t.prefe,
  t.prenc,
  t.preno,
  t.prend,
  t.prene,
  t.preng,
  t.itark,
  t.servg,
  t.kzkup,
  t.strgr,
  t.cuobv,
  t.lgfsb,
  t.schgt,
  t.ccfix,
  t.eprio,
  t.qmata,
  t.resvp,
  t.plnty,
  t.uomgr,
  t.umrsl,
  t.abfac,
  t.sfcpf,
  t.shflg,
  t.shzet,
  t.mdach,
  t.kzech,
  t.megru,
  t.mfrgr,
  t.profil,
  case
    when m.vkumc is null
    then 0
    else m.vkumc
  end as vkumc,
  case
    when m.vktrw is null
    then 0
    else m.vktrw
  end as vktrw,
  t.kzagl,
  t.fvidk,
  t.fxpru,
  t.loggr,
  t.fprfm,
  case
    when m.glgmg is null
    then 0
    else m.glgmg
  end as glgmg,
  case
    when m.vkglg is null
    then 0
    else m.vkglg
  end as vkglg,
  t.indus,
  t.mownr,
  t.mogru,
  t.casnr,
  t.gpnum,
  t.steuc,
  t.fabkz,
  t.matgr,
  t.vspvb,
  t.dplfs,
  t.dplpu,
  t.dplho,
  t.minls,
  t.maxls,
  t.fixls,
  t.ltinc,
  t.compl,
  t.convt,
  t.shpro,
  t.ahdis,
  t.diber,
  t.kzpsp,
  t.ocmpf,
  t.apokz,
  'x' as mcrue,
  case
    when (
      m.gjper = '0000000'
      or m.gjper is null
    )
    then t.lfmon
    else (
      rtrim(
        substring(m.gjper, 6, 2)
      )
    )
  end as lfmon,
  case
    when (
      m.gjper = '0000000'
      or m.gjper is null
    )
    then t.lfgja
    else (
      rtrim(
        substring(m.gjper, 1, 4)
      )
    )
  end as lfgja,
  t.eislo,
  t.ncost,
  t.rotation_date,
  t.uchkz,
  t.ucmat,
  case
    when m.bwesb is null
    then 0
    else m.bwesb
  end as bwesb,
  t.sgt_covs,
  t.sgt_statc,
  t.sgt_scope,
  '' as sgt_mrpsi,
  '' as sgt_prcm,
  '' as sgt_chint,
  '' as sgt_stk_prt,
  t.sgt_defsc,
  '' as sgt_mrp_atp_status,
  t.sgt_mmstd,
  t.fsh_mg_arun_req,
  '' as fsh_seaim,
  t.fsh_var_group,
  '' as fsh_kzech,
  t.fsh_calendar_group,
  t.arun_fix_batch,
  t.ppskz,
  t.cons_procg,
  t.gi_pr_time,
  t.multiple_ekgrp,
  t.ref_schema,
  t.min_troc,
  t.max_troc,
  t.target_stock,
  t.nf_flag,
  case
    when m._cwm_umlmc is null
    then 0
    else m._cwm_umlmc
  end as _cwm_umlmc,
  case
    when m._cwm_trame is null
    then 0
    else m._cwm_trame
  end as _cwm_trame,
  case
    when m._cwm_bwesb is null
    then 0
    else m._cwm_bwesb
  end as _cwm_bwesb,
  t.scm_matlocid_guid16,
  t.scm_matlocid_guid22,
  t.scm_grprt,
  t.scm_giprt,
  t.scm_scost,
  t.scm_reldt,
  t.scm_rrp_type,
  t.scm_heur_id,
  t.scm_package_id,
  t.scm_sspen,
  t.scm_get_alerts,
  t.scm_res_net_name,
  t.scm_conhap,
  t.scm_hunit,
  t.scm_conhap_out,
  t.scm_hunit_out,
  t.scm_shelf_life_loc,
  t.scm_shelf_life_dur,
  t.scm_maturity_dur,
  t.scm_shlf_lfe_req_min,
  t.scm_shlf_lfe_req_max,
  t.scm_lsuom,
  t.scm_reord_dur,
  t.scm_target_dur,
  t.scm_tstrid,
  t.scm_stra1,
  t.scm_peg_past_alert,
  t.scm_peg_future_alert,
  t.scm_peg_strategy,
  t.scm_peg_wo_alert_fst,
  t.scm_fixpeg_prod_set,
  t.scm_whatbom,
  t.dummy_plnt_incl_eew_ps,
  t.scm_rrp_sel_group,
  t.scm_intsrc_prof,
  t.scm_prio,
  t.scm_min_pass_amount,
  t.scm_profid,
  t.scm_ges_mng_use,
  t.scm_ges_bst_use,
  t.esppflg,
  t.scm_thruput_time,
  t.scm_tpop,
  t.scm_safty_v,
  t.scm_ppsaftystk,
  t.scm_ppsaftystk_v,
  t.scm_repsafty,
  t.scm_repsafty_v,
  t.scm_reord_v,
  t.scm_maxstock_v,
  t.scm_scost_prcnt,
  t.scm_proc_cost,
  t.scm_ndcostwa,
  t.scm_ndcostwe,
  t.excise_tax_rlvnce,
  t.scm_coninp,
  t.conf_gmsync,
  t.scm_iunit,
  t.scm_sft_lock,
  t.sfty_stk_meth,
  t.temp_ctrl_min,
  t.temp_ctrl_max,
  t.temp_uom,
  t.jitprodnconfprofile,
  t._sapmp_tolprpl,
  t._sapmp_tolprmi,
  t._sttpec_servalid,
  t._vso_r_pkgrp,
  t._vso_r_lane_num,
  t._vso_r_pal_vend,
  t._vso_r_fork_dir,
  t.iuid_relevant,
  t.iuid_type,
  t.uid_iea,
  t.dpcbt
from stg_sap__marc as t
left outer join stg_sap__t001w as plant on (
  plant.mandt = t.mandt
  and plant.werks = t.werks
  and t.mandt = plant.mandt
)
left outer join stg_sap__sapsll_tunos as numberscemeusage on (
  plant.mandt = numberscemeusage.mandt
  and plant.land1 = numberscemeusage.land1
  and numberscemeusage.ctsty = '01'
  and t.mandt = numberscemeusage.mandt
)
left outer join stg_sap__sapsll_maritc as materialtradeclassification on (
  materialtradeclassification.mandt = t.mandt
  and materialtradeclassification.matnr = t.matnr
  and materialtradeclassification.stcts = numberscemeusage.stcts
  and materialtradeclassification.datab <= {{ sap.date_to_yyyymmdd("current_date") }}
  and materialtradeclassification.datbi >= {{ sap.date_to_yyyymmdd("current_date") }}
  and t.mandt = materialtradeclassification.mandt
)
left outer join stg_sap__sapsll_nosca as numberschemecontent on (
  numberschemecontent.stcts = numberscemeusage.stcts
  and numberschemecontent.datab <= {{ sap.date_to_yyyymmdd("current_date") }}
  and numberschemecontent.datbi >= {{ sap.date_to_yyyymmdd("current_date") }}
  and t.mandt = numberschemecontent.mandt
)
left outer join stg_sap__sapsll_clsnr as materialtradeunit on (
  materialtradeunit.nosct = numberschemecontent.nosct
  and materialtradeunit.ccngn = materialtradeclassification.ccngn
  and materialtradeunit.datab <= {{ sap.date_to_yyyymmdd("current_date") }}
  and materialtradeunit.datbi >= {{ sap.date_to_yyyymmdd("current_date") }}
  and t.mandt = materialtradeunit.mandt
)
left outer join nsdm_v_marc_diff as m on (
  t.mandt = m.mandt
  and t.matnr = m.matnr
  and t.werks = m.werks
  and t.mandt = m.mandt
)