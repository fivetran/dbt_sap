{{ config(enabled=(var('sap_using_t161', True) and var('sap_using_t161t', True))) }}

with t161 as (
    select *
    from {{ ref('stg_sap__t161') }}

), t161t as (
    select *
    from {{ ref('stg_sap__t161t') }}

), final as (
    select
        t161.mandt as client_id,
        t161.bstyp as purch_doc_category_id,
        t161.bsart as purchasing_document_type_id,
        t161.bsakz as control_indicator,
        t161.pincr as item_number_interval,
        t161.numki as no_range_int_assgt,
        t161.numke as no_range_ext_assg,
        t161.brefn as field_selection_key_id,
        t161.refba as reference_document_type_id,
        t161.abvor as stdrd_rel_order_qty,
        t161.stafo as update_group_stats_id,
        t161.upinc as subitem_interval,
        t161.stako as time_dep_conditions,
        t161.pargr as partner_determination_procedure_id,
        t161.numka as number_range_ale,
        t161.hityp as vendor_hierarchy_cat_id,
        t161.lphis as rel_documentation,
        t161.gsfrg as overall_release_requisitions,
        t161.variante as layout,
        t161.shenq as shared_lock_only,
        t161.kzale as distributed_contract_ale,
        t161.abgebot as global_perc_bid,
        t161.kornr as corr_misc_provis,
        t161.umlif as vendor,
        t161.koett as contract_with_delivery_schedule,
        t161.ar_object as document_type_id,
        t161.koako as koako,
        t161.oicsegi as qty_sched_permitted,
        t161.oirfqreq as precedence_f_rfq_req,
        t161.wvvkz as further_processing_summar_docs,
        t161.xlokz as cross_system_transit,
        t161.cp_aktive as commitment_plan_is_active,
        t161.cptype as category_commitment_plan,
        t161.fls_rsto as enh_store_return,
        t161.msr_active as adv_returns_active,
        t161.rdp_profile as risk_distribution_plan_profile_id,
        t161.numkc as srm_contract_number_range,
        t161._sapmp_ceact as sapmp_fastentry_chars_is_active,
        t161._sapmp_pdact as sapmp_activate_inheritance,
        t161._sapmp_pprot as sapmp_inheritance_log,
        t161._sapmp_puser as sapmp_inheritance_overwrite_user_values,
        t161._sapmp_pausw as sapmp_inheritance_char_selection_list,
        t161._sapmp_atnam as sapmp_characteristic_name,
        t161._sapmp_gauf as sapmp_global_local_group_may_be_undone,
        t161.tolsl as tolerance_key_id,
        t161.fsh_vas_act as vas_active_flag,
        t161.fsh_vas_kalsm as determination_procedure,
        t161.fsh_vas_del as vas_deletion_criteria,
        t161.fsh_vas_detdt as date_vas_determination,
        t161.fsh_excl_return as exclude_return_items,
        t161.fsh_var_kalsm as determination_procedure_id,
        t161.fsh_dpr_detpro as fsh_dpr_detpro,
        t161.fsh_po_idoc as generic_article_in_po_using_idoc,
        t161.mill_omkz as use_ref_characteristics,
        t161.wrf_enable_dateline as enable_dateline,
        t161.hvr_is_deleted as hvr_is_deleted,
        t161.hvr_change_time as hvr_change_time,
        t161t.batxt as doc_type_descript
    from t161
    left join t161t
        on t161.mandt = t161t.mandt
        and t161.bsart = t161t.bsart
        and t161.bstyp = t161t.bstyp
        and t161t.spras = 'e'
    where t161.mandt in ('800')
)

select *
from final