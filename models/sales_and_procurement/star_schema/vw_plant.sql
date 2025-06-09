create or replace view EC_DB.SAP_STG."VW_Plant"(
	"Client_Id",
	"Plant_Id",
	"Order_Allocation_Run",
	"Tax_Indicator_Plant_Id",
	"City_Code_Id",
	"Region_Id",
	"Factory_Calendar_Id",
	"Actual_Activities_Updated",
	"Mixed_Costing",
	"Vendor_Type",
	"Purchasing_Organization_Id",
	"Node_Type_Supply_Chain_Network_Id",
	"Store_Cat",
	"Distrib_Channel_Id",
	"Text_1St_Dunning",
	"Ipi_Credit_Allowed",
	"Customer_Number_Plant_Id",
	"Name",
	"Season_Active_In_Inventory_Management",
	"Address_Id",
	"Sales_District_Id",
	"Language_Key_Id",
	"Street_And_House_Number",
	"Supply_Region_Region_Supplied_Id",
	"Sales_Organization_Id",
	"Structure_Name_Formation_Id",
	"Superior_Department_Store_Id",
	"Activating_Requirements_Planning",
	"Vendor_Number_Plant_Id",
	"Po_Box",
	"Int_Co_Billing_Div_Id",
	"3Rd_Reminder_Exped",
	"Exchange_Valuation_Indicator",
	"Af_Srce_Det_Via_Atp",
	"Sop_Plant",
	"Source_List",
	"County_Code_Id",
	"Shipping_Point_Id",
	"Text_3Rd_Dunning",
	"2Nd_Reminder_Exped",
	"Batch_Type_Dms_Used",
	"Postal_Code",
	"Take_Regular_Vendor_Into_Account",
	"Actual_Costing",
	"Cost_Obj_Controlling",
	"Batch_Status_Mgmt",
	"Tax_Jurisdiction_Id",
	"Variance_Key_Id",
	CHAZV_OLD,
	"Control_Credit_Cost_Centers",
	"Valuation_Area_Id",
	"Plant_Category",
	"1St_Reminder_Exped",
	"Text_2Nd_Dunning",
	"Control_Bom",
	"Conds_At_Plant_Level",
	"Business_Place_Id",
	"Po_Tolerance",
	"Sales_Area_Detrm",
	"Name_2",
	"Country_Key_Id",
	"Archiving_Marker",
	"Distrib_Profile_Plant_Id",
	"City",
	"Maintenance_Planning_Plant_Id",
	"_Fivetran_Deleted",
	"_Fivetran_Synced",
	"_Fivetran_Sap_Archived"
) as (
    

Select
T001W."MANDT" as "Client_Id"
,T001W."WERKS" as "Plant_Id"
,T001W."FSH_MG_ARUN_REQ" as "Order_Allocation_Run"
,T001W."TAXIW" as "Tax_Indicator_Plant_Id"
,T001W."CITYC" as "City_Code_Id"
,T001W."REGIO" as "Region_Id"
,T001W."FABKL" as "Factory_Calendar_Id"
,T001W."MGVLAUPD" as "Actual_Activities_Updated"
,T001W."MISCH" as "Mixed_Costing"
,T001W."OIHVTYPE" as "Vendor_Type"
,T001W."EKORG" as "Purchasing_Organization_Id"
,T001W."NODETYPE" as "Node_Type_Supply_Chain_Network_Id"
,T001W."STORETYPE" as "Store_Cat"
,T001W."VTWEG" as "Distrib_Channel_Id"
,T001W."TXNAM_MA1" as "Text_1St_Dunning"
,T001W."OIHCREDIPI" as "Ipi_Credit_Allowed"
,T001W."KUNNR" as "Customer_Number_Plant_Id"
,T001W."NAME1" as "Name"
,T001W."FSH_SEAIM" as "Season_Active_In_Inventory_Management"
,T001W."ADRNR" as "Address_Id"
,T001W."BZIRK" as "Sales_District_Id"
,T001W."SPRAS" as "Language_Key_Id"
,T001W."STRAS" as "Street_And_House_Number"
,T001W."ZONE1" as "Supply_Region_Region_Supplied_Id"
,T001W."VKORG" as "Sales_Organization_Id"
,T001W."NSCHEMA" as "Structure_Name_Formation_Id"
,T001W."DEP_STORE" as "Superior_Department_Store_Id"
,T001W."BEDPL" as "Activating_Requirements_Planning"
,T001W."LIFNR" as "Vendor_Number_Plant_Id"
,T001W."PFACH" as "Po_Box"
,T001W."SPART" as "Int_Co_Billing_Div_Id"
,T001W."LET03" as "3Rd_Reminder_Exped"
,T001W."OILIVAL" as "Exchange_Valuation_Indicator"
,T001W."SOURCING" as "Af_Srce_Det_Via_Atp"
,T001W."WKSOP" as "Sop_Plant"
,T001W."KORDB" as "Source_List"
,T001W."COUNC" as "County_Code_Id"
,T001W."VSTEL" as "Shipping_Point_Id"
,T001W."TXNAM_MA3" as "Text_3Rd_Dunning"
,T001W."LET02" as "2Nd_Reminder_Exped"
,T001W."DVSART" as "Batch_Type_Dms_Used"
,T001W."PSTLZ" as "Postal_Code"
,T001W."BZQHL" as "Take_Regular_Vendor_Into_Account"
,T001W."MGVUPD" as "Actual_Costing"
,T001W."PKOSA" as "Cost_Obj_Controlling"
,T001W."CHAZV" as "Batch_Status_Mgmt"
,T001W."TXJCD" as "Tax_Jurisdiction_Id"
,T001W."AWSLS" as "Variance_Key_Id"
,T001W."CHAZV_OLD" as "CHAZV_OLD"
,T001W."MGVLAREVAL" as "Control_Credit_Cost_Centers"
,T001W."BWKEY" as "Valuation_Area_Id"
,T001W."VLFKZ" as "Plant_Category"
,T001W."LET01" as "1St_Reminder_Exped"
,T001W."TXNAM_MA2" as "Text_2Nd_Dunning"
,T001W."FSH_BOM_MAINTENANCE" as "Control_Bom"
,T001W."KKOWK" as "Conds_At_Plant_Level"
,T001W."J_1BBRANCH" as "Business_Place_Id"
,T001W."BETOL" as "Po_Tolerance"
,T001W."VTBFI" as "Sales_Area_Detrm"
,T001W."NAME2" as "Name_2"
,T001W."LAND1" as "Country_Key_Id"
,T001W."ACHVM" as "Archiving_Marker"
,T001W."FPRFW" as "Distrib_Profile_Plant_Id"
,T001W."ORT01" as "City"
,T001W."IWERK" as "Maintenance_Planning_Plant_Id"
,T001W."_FIVETRAN_DELETED" as "_Fivetran_Deleted"
,T001W."_FIVETRAN_SYNCED" as "_Fivetran_Synced"
,T001W."_FIVETRAN_SAP_ARCHIVED" as "_Fivetran_Sap_Archived"
from SAP_HANA_DB_SAPABAP1.T001W
where
T001W."MANDT" in ('800')
  );