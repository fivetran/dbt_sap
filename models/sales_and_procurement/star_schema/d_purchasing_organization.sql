create or replace view EC_DB.SAP_BI.D_PURCHASING_ORDER(
	"Purchasing_Document_Id",
	"Purchasing_Document_Category",
	PURCHASING_DOCUMENT_CATEGORY_TXT,
	"Purchasing_Document_Type_Id",
	"Purchasing_Document_Type_Text",
	"Purchasing_Group_Id",
	"Description_Purchasing_Group",
	"Purchasing_Document_Status",
	PURCHASING_DOCUMENT_STATUS_TXT,
	"Payment_Terms",
	"Reason_Cancellation_Id",
	"Company_Code_Id"
) as
SELECT
  T1."Purchasing_Document_Id" ,
  T1."Purchasing_Document_Category" ,
  T2.PURCHASING_DOCUMENT_CATEGORY_TXT, 
  T1."Purchasing_Document_Type_Id", 
  T3.DOC_TYPE_DESCRIPT "Purchasing_Document_Type_Text",
  T1."Purchasing_Group_Id" ,
  T4."Description_Purchasing_Group" ,
  T1."Status_Purchasing_Document" AS "Purchasing_Document_Status",
  T5.PURCHASING_DOCUMENT_STATUS_TXT, 
  T1."Payment_Terms" ,
  T1."Reason_Cancellation_Id" ,
  T1."Company_Code_Id" 
FROM SAP_STG."VW_Purchasing_Document_Header" T1
LEFT OUTER JOIN SAP_STG."VW_Purchasing_Document_Category" T2 on
  T1."Purchasing_Document_Category" = T2.PURCHASING_DOCUMENT_CATEGORY_ID  
LEFT OUTER JOIN SAP_STG."VW_Purchasing_Document_Type" T3 on
 T1."Purchasing_Document_Type_Id" = t3."Purchasing_Document_Type_Id" 
  AND T3."Purch_Doc_Category_Id"  = T1."Purchasing_Document_Category" 
LEFT OUTER JOIN SAP_STG."VW_Purchasing_Group" T4 on
 T4."Purchasing_Group_Id"  = T1."Purchasing_Group_Id" 
LEFT OUTER JOIN SAP_STG."VW_Purchasing_Document_Status" T5 on
 T5.PURCHASING_DOCUMENT_STATUS_ID  = T1."Status_Purchasing_Document";