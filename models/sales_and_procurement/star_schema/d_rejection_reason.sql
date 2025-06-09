create or replace view EC_DB.SAP_BI.D_REJECTION_REASON(
	REJECTION_REASON_ID,
	REJECTION_REASON_DESCRIPTION
) as
select 
	t1."Reason_Rejection_Id", 
	t1.description  as Rejection_Reason_Description
from  sap_stg."VW_Sales_Documents_Rejection_Reason"  t1;