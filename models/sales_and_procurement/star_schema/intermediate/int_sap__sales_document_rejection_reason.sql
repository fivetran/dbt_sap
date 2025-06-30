select
tvag.mandt as client_id
,tvag.abgru as reason_rejection_id
,tvag.dragr as not_relevant_printing
,tvag.ep_off as resource_item_open_again
,tvag.fk_erl as not_relevant_billing
,tvag.kowrr as statistical_values
,tvag.fsh_pqr_spec as relevant_partial_quantity_rejection
,tvag.hvr_is_deleted as hvr_is_deleted
,tvag.hvr_change_time as hvr_change_time
, tvagt.bezei as description
from {{ ref('stg_sap__tvag') }}
left join {{ ref('stg_sap__tvagt') }} on 
    tvag.mandt = tvagt.mandt
    and tvag.abgru = tvagt.abgru
and tvagt.spras= 'e'
where
tvag.mandt in ('800')
