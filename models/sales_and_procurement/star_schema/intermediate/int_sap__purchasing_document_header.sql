select
ekko.mandt as client_id
,ekko.ebeln as purchasing_document_id
,ekko.bukrs as company_code_id
,ekko.bstyp as purchasing_document_category
,ekko.bsart as purchasing_document_type_id
,ekko.bsakz as control_indicator
,ekko.loekz as deletion_indicator
,ekko.statu as status_purchasing_document
,case when ekko.aedat in ('00000000', ' ') then null else {{ char_yyyymmdd_to_date('ekko.aedat') }} end as created_date
,ekko.ernam as created_by
,ekko.pincr as item_number_interval
,ekko.lponr as last_item_number_id
,ekko.lifnr as vendor_id
,ekko.spras as language_key_id
,ekko.zterm as payment_terms
,ekko.zbd1t as payment_in
,ekko.zbd2t as zbd2t
,ekko.zbd3t as zbd3t
,ekko.zbd1p as cash_discount_percentage_1
,ekko.zbd2p as cash_discount_percentage_2
,ekko.ekorg as purchasing_organization_id
,ekko.ekgrp as purchasing_group_id
,ekko.waers as currency_id
,ekko.wkurs as exchange_rate
,ekko.kufix as exchange_rate_fixed
,case when ekko.bedat in ('00000000', ' ') then null else {{ char_yyyymmdd_to_date('ekko.bedat') }} end as purchasing_document_date
,case when ekko.kdatb in ('00000000', ' ') then null else {{ char_yyyymmdd_to_date('ekko.kdatb') }} end as start_validity_period_date
,case when ekko.kdate in ('00000000', ' ') then null else {{ char_yyyymmdd_to_date('ekko.kdate') }} end as end_validity_period_date
,case when ekko.bwbdt in ('00000000', ' ') then null else {{ char_yyyymmdd_to_date('ekko.bwbdt') }} end as closing_applications_date
,case when ekko.angdt in ('00000000', ' ') then null else {{ char_yyyymmdd_to_date('ekko.angdt') }} end as quotation_deadline_date
,case when ekko.bnddt in ('00000000', ' ') then null else {{ char_yyyymmdd_to_date('ekko.bnddt') }} end as binding_period_quotation_date
,case when ekko.gwldt in ('00000000', ' ') then null else {{ char_yyyymmdd_to_date('ekko.gwldt') }} end as warranty_date
,ekko.ausnr as bid_invitation_number_id
,ekko.angnr as quotation_number
,case when ekko.ihran in ('00000000', ' ') then null else {{ char_yyyymmdd_to_date('ekko.ihran') }} end as quotation_submission_date
,ekko.ihrez as your_reference
,ekko.verkf as salesperson
,ekko.telf1 as vendors_telephone_number
,ekko.llief as supplying_vendor_id
,ekko.kunnr as customer_id
,ekko.konnr as outline_agreement_id
,ekko.abgru as field_not_used
,ekko.autlf as complete_delivery
,ekko.weakt as indicator_goods_receipt_message
,ekko.reswk as supplying_plant_id
,ekko.lblif as field_not_used_id
,ekko.inco1 as incoterms_id
,ekko.inco2 as incoterms_part_2
,ekko.ktwrt as target_header_val
,ekko.submi as collective_number
,ekko.knumv as document_condition_no
,ekko.kalsm as procedure_id
,ekko.stafo as update_group_stats_id
,ekko.lifre as different_invoicing_party_id
,ekko.exnum as number_foreign_trade_id
,ekko.unsez as our_reference
,ekko.logsy as logical_system_id
,ekko.upinc as subitem_interval
,ekko.stako as time_dep_conditions
,ekko.frggr as release_group_id
,ekko.frgsx as release_strategy_id
,ekko.frgke as release_indicator_id
,ekko.frgzu as release_state
,ekko.frgrl as subject_to_release
,ekko.lands as country_tax_return_id
,ekko.lphis as rel_documentation
,ekko.adrnr as address_number_id
,ekko.stceg_l as country_sales_tax_id_number_id
,ekko.stceg as vat_registration_no
,ekko.absgr as reason_cancellation_id
,ekko.addnr as document_number_additional
,ekko.kornr as corr_misc_provis
,ekko.memory as purchase_order_not_yet_complete
,ekko.procstat as purch_doc_proc_state
,ekko.rlwrt as total_at_time_release_val
,ekko.revno as version_number_in_purchasing
,ekko.scmproc as scmproc
,ekko.reason_code as goods_receipt_reason_code
,ekko.memorytype as category_incompleteness
,ekko.rettp as retention_indicator
,ekko.retpc as retention_in_percent
,ekko.dptyp as down_payment_indicator
,ekko.dppct as down_payment_percentage
,ekko.dpamt as down_payment_amount_val
,case when ekko.dpdat in ('00000000', ' ') then null else {{ char_yyyymmdd_to_date('ekko.dpdat') }} end as due_down_payment_date
,ekko.msr_id as process_identification_number
,ekko.hierarchy_exists as part_contract_hierarchy
,ekko.threshold_exists as threshold_value_exchange_rates
,ekko.legal_contract as legal_contract_number
,ekko.description as contract_name
,case when ekko.release_date in ('00000000', ' ') then null else {{ char_yyyymmdd_to_date('ekko.release_date') }} end as release_contract_date
,ekko.vsart as shipping_type_id
,ekko.handoverloc as handover_location
,ekko.shipcond as shipping_conditions_id
,ekko.incov as incoterms_version_id
,ekko.inco2_l as incoterms_location_1
,ekko.inco3_l as incoterms_location_2
,ekko.force_id as internal_key_force_element
,ekko.force_cnt as internal_version_counter
,ekko.reloc_id as relocation_id
,ekko.reloc_seq_id as relocation_step_id
,ekko.source_logsys as source_logsys
,ekko.fsh_transaction as transaction_number
,ekko.fsh_item_group as item_group
,ekko.fsh_vas_last_item as last_vas_item_number
,ekko.fsh_os_stg_change as os_strategy_specific_fields_change
,ekko.vzskz as interest_calculation_indicator_id
,ekko.fsh_snst_status as snapshot_status
,ekko.pohf_type as document_category
,case when ekko.eq_eindt in ('00000000', ' ') then null else {{ char_yyyymmdd_to_date('ekko.eq_eindt') }} end as same_delivery_date
,ekko.eq_werks as same_plant_id
,ekko.fixpo as firm_deal_indicator
,ekko.ekgrp_allow as take_account_purch_group
,ekko.werks_allow as take_account_plants
,ekko.contract_allow as take_account_contracts
,ekko.pstyp_allow as take_account_item_categories
,ekko.fixpo_allow as take_account_fixed_date_purchases
,ekko.key_id_allow as consider_budget
,ekko.aurel_allow as take_account_alloc_table_relevance
,ekko.delper_allow as take_account_dlvy_period
,ekko.eindt_allow as take_account_delivery_date
,ekko.ltsnr_allow as include_vendor_subrange
,ekko.otb_level as otb_check_level
,ekko.otb_cond_type as otb_condition_type_id
,ekko.key_id as unique_number_budget
,ekko.otb_value as required_budget_val
,ekko.otb_curr as otb_currency_id
,ekko.otb_res_value as reserved_budget_val
,ekko.otb_spec_value as special_release_budget_val
,ekko.spr_rsn_profile as otb_reason_profile_special_release
,ekko.budg_type as budget_type
,ekko.otb_status as otb_check_status
,ekko.otb_reason as reason
,ekko.check_type as type_otb_check
,ekko.con_otb_req as otb_relevant_contract
,ekko.con_prebook_lev as indicator_level_contracts
,ekko.con_distr_lev as distrib_using_target_value_or_item
,ekko.hvr_is_deleted as hvr_is_deleted
,ekko.hvr_change_time as hvr_change_time
from {{ ref('stg_sap__ekko') }}
where ekko.mandt in ('800')
