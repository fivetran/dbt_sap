create or replace view EC_DB.SAP_BI.D_CUSTOMER(
	CUSTOMER_NUMBER,
	"Country_Key_Id",
	"Customer_Name",
	"City",
	"Customer_Id"
) as 
SELECT	
LTRIM(T1."Customer_Id" , '0' ) as Customer_Number
,	T1."Country_Key_Id" 
,	T1."Name" AS "Customer_Name"
,	T1."City" 
,   T1."Customer_Id" 	
FROM 			
SAP_STG."VW_Customer" T1;