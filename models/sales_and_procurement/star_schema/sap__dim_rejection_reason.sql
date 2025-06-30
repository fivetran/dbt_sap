select 
	reason_rejection_id, 
	description  as rejection_reason_description
from {{ ref('vw_sales_documents_rejection_reason') }}
