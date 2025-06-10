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
FROM {{ ref('vw_purchasing_document_header') }} T1
LEFT OUTER JOIN {{ ref('vw_purchasing_document_category') }} T2 on
  T1."Purchasing_Document_Category" = T2.PURCHASING_DOCUMENT_CATEGORY_ID  
LEFT OUTER JOIN {{ ref('vw_purchasing_document_type') }} T3 on
 T1."Purchasing_Document_Type_Id" = t3."Purchasing_Document_Type_Id" 
  AND T3."Purch_Doc_Category_Id"  = T1."Purchasing_Document_Category" 
LEFT OUTER JOIN {{ ref('vw_purchasing_group') }} T4 on
 T4."Purchasing_Group_Id"  = T1."Purchasing_Group_Id" 
LEFT OUTER JOIN {{ ref('vw_purchasing_document_status') }} T5 on
 T5.PURCHASING_DOCUMENT_STATUS_ID  = T1."Status_Purchasing_Document"