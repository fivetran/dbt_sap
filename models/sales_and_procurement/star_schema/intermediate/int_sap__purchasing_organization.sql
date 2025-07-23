{{ config(enabled=var('sap_using_t024e', true)) }}

select
    ekorg as purchasing_organization_id,
    mandt as client_id,
    ekotx as description,
    txfus as text_name_footer_lines,
    txgru as text_name_complimentary_close,
    bpeff as effective_price,
    txkop as text_name_letter_heading,
    kalse as purorg_schema_group_id,
    txadr as text_name_sender_line,
    mkals as market_price_schema_id,
    bukrs as company_code_id,
    bukrs_ntr as cocdsubsstlmt_id,
    _fivetran_deleted as _fivetran_deleted,
    _fivetran_synced as _fivetran_synced,
    _fivetran_sap_archived as _fivetran_sap_archived
from {{ ref('stg_sap__t024e') }}
where mandt in ('{{ var("sales_and_procurement_mandt_var", "800") }}')