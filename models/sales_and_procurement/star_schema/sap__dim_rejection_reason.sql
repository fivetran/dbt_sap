select 
	t1."Reason_Rejection_Id", 
	t1.description  as Rejection_Reason_Description
from  {{ ref('vw_sales_documents_rejection_reason') }}  t1