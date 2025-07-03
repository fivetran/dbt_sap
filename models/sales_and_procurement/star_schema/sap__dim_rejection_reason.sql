{{ config(enabled=(var('sap_using_tvag', True) and var('sap_using_tvagt', True))) }}

select
	reason_rejection_id, 
	description  as rejection_reason_description
from {{ ref('int_sap__sales_document_rejection_reason') }}
