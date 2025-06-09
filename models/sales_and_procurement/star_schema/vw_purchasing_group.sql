create or replace view EC_DB.SAP_STG."VW_Purchasing_Group"(
	"Purchasing_Group_Id",
	"Client_Id",
	"Telephone",
	"Fax_Number",
	"Spool_Output_Device_Id",
	"Tel_No_Purch_Group",
	"E_Mail_Address",
	"Telephone_No_Extension",
	"Description_Purchasing_Group",
	"_Fivetran_Deleted",
	"_Fivetran_Synced",
	"_Fivetran_Sap_Archived"
) as (
    

Select
T024."EKGRP" as "Purchasing_Group_Id"
,T024."MANDT" as "Client_Id"
,T024."TEL_NUMBER" as "Telephone"
,T024."TELFX" as "Fax_Number"
,T024."LDEST" as "Spool_Output_Device_Id"
,T024."EKTEL" as "Tel_No_Purch_Group"
,T024."SMTP_ADDR" as "E_Mail_Address"
,T024."TEL_EXTENS" as "Telephone_No_Extension"
,T024."EKNAM" as "Description_Purchasing_Group"
,T024."_FIVETRAN_DELETED" as "_Fivetran_Deleted"
,T024."_FIVETRAN_SYNCED" as "_Fivetran_Synced"
,T024."_FIVETRAN_SAP_ARCHIVED" as "_Fivetran_Sap_Archived"
from SAP_HANA_DB_SAPABAP1.T024
where
T024."MANDT" in ('800')
  );