{{ config(enabled=var('sap_using_t001', true)) }}

select
    bukrs as company_code_id,
    mandt as client_id,
    dkweg as import_gr,
    xgjrv as indicator_propose_fiscal_year,
    xeink as purchase_acct_proc,
    fdbuk as cash_management_company_code_id,
    pp_pdate as posting_date_parking,
    xprod as company_code_is_productive,
    xskfn as discount_base_is_net_value,
    xcovr as indicator_hedge_request_active,
    ebukr as original_key_the_company_code,
    bukrs_glob as name_global_company_code_id,
    xmwsn as tax_base_is_net_value,
    butxt as company_code_txt,
    bapovar as ba_variant_id,
    xbbko as contract,
    dttdsp as remittance_challan_document_type_id,
    dtaxr as deferred_tax_rule_id,
    impda as import_in_po,
    kkber as credit_control_area_id,
    xfmca as update_fm,
    xfmcb as csh_bdgt_mgt_active,
    surccm as surcharge_calculation_method,
    fstvare as field_status_variant_id,
    periv as fiscal_year_variant_id,
    txjcd as jurisdiction_code_id,
    fmhrdate as fds_ctr_active_in_hr_date,
    xbbba as purchase_requisition,
    ort01 as city,
    rcomp as company_id,
    xsplt as enable_amount_split,
    kopim as copying_control_gr,
    infmt as inflation_method_id,
    fm_derive_acc as activate_aa_derivation,
    ktopl as chart_of_accounts_id,
    umkrs as sales_purchases_tax_group_id,
    xkkbi as control_area_can_be_input,
    pst_per_var as manage_posting_period_cocode_ledger,
    xvatdate as tax_reporting_date_active,
    txkrs as cur_transl_tax,
    waers as currency_id,
    xkdft as post_translation,
    xcos as cost_sales_accounting_status,
    xbbbf as inventory_management,
    xbbsc as shopping_cart,
    xfmco as project_cash_mgmt_active,
    dttaxc as document_type_jv_tax_code_id,
    mregl as sample_acct_rules_var_id,
    mwskv as input_tax_code_id,
    xstdt as tax_determ_with_doc_date,
    xnegp as negative_postings_permitted,
    spras as language_key_id,
    xvvwa as financial_assets_mgmt_active,
    dtprov as document_type_provisions_taxes_id,
    waabw as max_exchange_rate_deviation,
    wt_newwt as extended_withholding_tax_active,
    xcession as accts_recble_pled_active,
    xslta as no_forex_rate_diff_when_clearing_in_lc,
    adrnr as address_id,
    xjvaa as indicator_jva_active,
    opvar as posting_period_variant_id,
    mwska as output_tax_code_id,
    kokfi as allocation_indicator,
    ktop2 as country_chart_accts_id,
    xextb as external_co_code,
    buvar as company_code_variant_screen,
    offsacct as method_offsttng_acct,
    dtamtc as document_type_jv_amount_correction_id,
    wfvar as workflow_variant_id,
    land1 as country_key_id,
    fstva as fstva,
    xfdis as cash_management_activated,
    xbbbe as po_scheduling_agmt,
    xvalv as define_default_value_date,
    fikrs as financial_management_area_id,
    xfdsd as update_sd_in_cmf,
    xfdmm as update_mm_in_cmf,
    xgsbe as business_area_fin_statements,
    stceg as vat_registration_no,
    _fivetran_deleted as _fivetran_deleted,
    _fivetran_synced as _fivetran_synced,
    _fivetran_sap_archived as _fivetran_sap_archived

from {{ ref('stg_sap__t001') }}
where mandt in ('{{ var(sales_and_procurement_mandt_var, [800]) | join(',') }}')
