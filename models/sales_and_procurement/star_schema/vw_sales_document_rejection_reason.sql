create or replace view EC_DB.SAP_STG."VW_Sales_Documents_Rejection_Reason"(
	"Client_Id",
	"Reason_Rejection_Id",
	"Not_Relevant_Printing",
	"Resource_Item_Open_Again",
	"Not_Relevant_Billing",
	"Statistical_Values",
	"Relevant_Partial_Quantity_Rejection",
	"Hvr_Is_Deleted",
	"Hvr_Change_Time",
	DESCRIPTION
) as (
    

Select
TVAG."MANDT" as "Client_Id"
,TVAG."ABGRU" as "Reason_Rejection_Id"
,TVAG."DRAGR" as "Not_Relevant_Printing"
,TVAG."EP_OFF" as "Resource_Item_Open_Again"
,TVAG."FK_ERL" as "Not_Relevant_Billing"
,TVAG."KOWRR" as "Statistical_Values"
,TVAG."FSH_PQR_SPEC" as "Relevant_Partial_Quantity_Rejection"
,TVAG."HVR_IS_DELETED" as "Hvr_Is_Deleted"
,TVAG."HVR_CHANGE_TIME" as "Hvr_Change_Time"
, TVAGT."BEZEI" as Description
from SAP_RAW.TVAG
Left Join SAP_RAW.TVAGT on 
    TVAG.MANDT = TVAGT.MANDT
    AND TVAG.ABGRU = TVAGT.ABGRU
and TVAGT."SPRAS"= 'E'
where
TVAG."MANDT" in ('800')
  );