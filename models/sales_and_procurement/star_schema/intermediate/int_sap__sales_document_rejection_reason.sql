{{ config(enabled=(var('sap_using_tvag', True) and var('sap_using_tvagt', True))) }}

with tvag as (
    select *
    from {{ ref('stg_sap__tvag') }}

), tvagt as (
    select *
    from {{ ref('stg_sap__tvagt') }}

), final as (
    select
        tvag.mandt as client_id,
        tvag.abgru as reason_rejection_id,
        tvag.dragr as not_relevant_printing,
        tvag.ep_off as resource_item_open_again,
        tvag.fk_erl as not_relevant_billing,
        tvag.kowrr as statistical_values,
        tvag.fsh_pqr_spec as relevant_partial_quantity_rejection,
        tvag.hvr_is_deleted as hvr_is_deleted,
        tvag.hvr_change_time as hvr_change_time,
        tvagt.bezei as description
    from tvag
    left join tvagt
        on tvag.mandt = tvagt.mandt
        and tvag.abgru = tvagt.abgru
        and tvagt.spras = 'e'
    where tvag.mandt in ('{{ var("sales_and_procurement_mandt_var", "800") }}')
)

select *
from final