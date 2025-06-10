select	
	LTRIM(T1."Customer_Id" , '0' ) as Customer_Number
,	T1."Country_Key_Id" 
,	T1."Name" AS "Customer_Name"
,	T1."City" 
,   T1."Customer_Id" 	
FROM {{ ref('vw_customer') }} T1