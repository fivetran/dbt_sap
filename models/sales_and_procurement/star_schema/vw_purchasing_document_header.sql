create or replace view EC_DB.SAP_STG."VW_Purchasing_Document_Header"(
	"Client_Id",
	"Purchasing_Document_Id",
	"Company_Code_Id",
	"Purchasing_Document_Category",
	"Purchasing_Document_Type_Id",
	"Control_Indicator",
	"Deletion_Indicator",
	"Status_Purchasing_Document",
	"Created_Date",
	"Created_By",
	"Item_Number_Interval",
	"Last_Item_Number_Id",
	"Vendor_Id",
	"Language_Key_Id",
	"Payment_Terms",
	"Payment_In",
	ZBD2T,
	ZBD3T,
	"Cash_Discount_Percentage_1",
	"Cash_Discount_Percentage_2",
	"Purchasing_Organization_Id",
	"Purchasing_Group_Id",
	"Currency_Id",
	"Exchange_Rate",
	"Exchange_Rate_Fixed",
	"Purchasing_Document_Date",
	"Start_Validity_Period_Date",
	"End_Validity_Period_Date",
	"Closing_Applications_Date",
	"Quotation_Deadline_Date",
	"Binding_Period_Quotation_Date",
	"Warranty_Date",
	"Bid_Invitation_Number_Id",
	"Quotation_Number",
	"Quotation_Submission_Date",
	"Your_Reference",
	"Salesperson",
	"Vendors_Telephone_Number",
	"Supplying_Vendor_Id",
	"Customer_Id",
	"Outline_Agreement_Id",
	"Field_Not_Used",
	"Complete_Delivery",
	"Indicator_Goods_Receipt_Message",
	"Supplying_Plant_Id",
	"Field_Not_Used_Id",
	"Incoterms_Id",
	"Incoterms_Part_2",
	"Target_Header_Val",
	"Collective_Number",
	"Document_Condition_No",
	"Procedure_Id",
	"Update_Group_Stats_Id",
	"Different_Invoicing_Party_Id",
	"Number_Foreign_Trade_Id",
	"Our_Reference",
	"Logical_System_Id",
	"Subitem_Interval",
	"Time_Dep_Conditions",
	"Release_Group_Id",
	"Release_Strategy_Id",
	"Release_Indicator_Id",
	"Release_State",
	"Subject_To_Release",
	"Country_Tax_Return_Id",
	"Rel_Documentation",
	"Address_Number_Id",
	"Country_Sales_Tax_Id_Number_Id",
	"Vat_Registration_No",
	"Reason_Cancellation_Id",
	"Document_Number_Additional",
	"Corr_Misc_Provis",
	"Purchase_Order_Not_Yet_Complete",
	"Purch_Doc_Proc_State",
	"Total_At_Time_Release_Val",
	"Version_Number_In_Purchasing",
	"Scmproc",
	"Goods_Receipt_Reason_Code",
	"Category_Incompleteness",
	"Retention_Indicator",
	"Retention_In_Percent",
	"Down_Payment_Indicator",
	"Down_Payment_Percentage",
	"Down_Payment_Amount_Val",
	"Due_Down_Payment_Date",
	"Process_Identification_Number",
	"Part_Contract_Hierarchy",
	"Threshold_Value_Exchange_Rates",
	"Legal_Contract_Number",
	"Contract_Name",
	"Release_Contract_Date",
	"Shipping_Type_Id",
	"Handover_Location",
	"Shipping_Conditions_Id",
	"Incoterms_Version_Id",
	"Incoterms_Location_1",
	"Incoterms_Location_2",
	"Internal_Key_Force_Element",
	"Internal_Version_Counter",
	"Relocation_Id",
	"Relocation_Step_Id",
	SOURCE_LOGSYS,
	"Transaction_Number",
	"Item_Group",
	"Last_Vas_Item_Number",
	"Os_Strategy_Specific_Fields_Change",
	"Interest_Calculation_Indicator_Id",
	"Snapshot_Status",
	"Document_Category",
	"Same_Delivery_Date",
	"Same_Plant_Id",
	"Firm_Deal_Indicator",
	"Take_Account_Purch_Group",
	"Take_Account_Plants",
	"Take_Account_Contracts",
	"Take_Account_Item_Categories",
	"Take_Account_Fixed_Date_Purchases",
	"Consider_Budget",
	"Take_Account_Alloc_Table_Relevance",
	"Take_Account_Dlvy_Period",
	"Take_Account_Delivery_Date",
	"Include_Vendor_Subrange",
	"Otb_Check_Level",
	"Otb_Condition_Type_Id",
	"Unique_Number_Budget",
	"Required_Budget_Val",
	"Otb_Currency_Id",
	"Reserved_Budget_Val",
	"Special_Release_Budget_Val",
	"Otb_Reason_Profile_Special_Release",
	"Budget_Type",
	"Otb_Check_Status",
	"Reason",
	"Type_Otb_Check",
	"Otb_Relevant_Contract",
	"Indicator_Level_Contracts",
	"Distrib_Using_Target_Value_Or_Item",
	"Hvr_Is_Deleted",
	"Hvr_Change_Time"
) as (
    

Select
EKKO."MANDT" as "Client_Id"
,EKKO."EBELN" as "Purchasing_Document_Id"
,EKKO."BUKRS" as "Company_Code_Id"
,EKKO."BSTYP" as "Purchasing_Document_Category"
,EKKO."BSART" as "Purchasing_Document_Type_Id"
,EKKO."BSAKZ" as "Control_Indicator"
,EKKO."LOEKZ" as "Deletion_Indicator"
,EKKO."STATU" as "Status_Purchasing_Document"
,CASE when EKKO."AEDAT" in ('00000000', ' ') THEN NULL ELSE TO_DATE(EKKO."AEDAT", 'YYYYMMDD' ) END as "Created_Date"
,EKKO."ERNAM" as "Created_By"
,EKKO."PINCR" as "Item_Number_Interval"
,EKKO."LPONR" as "Last_Item_Number_Id"
,EKKO."LIFNR" as "Vendor_Id"
,EKKO."SPRAS" as "Language_Key_Id"
,EKKO."ZTERM" as "Payment_Terms"
,EKKO."ZBD1T" as "Payment_In"
,EKKO."ZBD2T" as "ZBD2T"
,EKKO."ZBD3T" as "ZBD3T"
,EKKO."ZBD1P" as "Cash_Discount_Percentage_1"
,EKKO."ZBD2P" as "Cash_Discount_Percentage_2"
,EKKO."EKORG" as "Purchasing_Organization_Id"
,EKKO."EKGRP" as "Purchasing_Group_Id"
,EKKO."WAERS" as "Currency_Id"
,EKKO."WKURS" as "Exchange_Rate"
,EKKO."KUFIX" as "Exchange_Rate_Fixed"
,CASE when EKKO."BEDAT" in ('00000000', ' ') THEN NULL ELSE TO_DATE(EKKO."BEDAT", 'YYYYMMDD' ) END as "Purchasing_Document_Date"
,CASE when EKKO."KDATB" in ('00000000', ' ') THEN NULL ELSE TO_DATE(EKKO."KDATB", 'YYYYMMDD' ) END as "Start_Validity_Period_Date"
,CASE when EKKO."KDATE" in ('00000000', ' ') THEN NULL ELSE TO_DATE(EKKO."KDATE", 'YYYYMMDD' ) END as "End_Validity_Period_Date"
,CASE when EKKO."BWBDT" in ('00000000', ' ') THEN NULL ELSE TO_DATE(EKKO."BWBDT", 'YYYYMMDD' ) END as "Closing_Applications_Date"
,CASE when EKKO."ANGDT" in ('00000000', ' ') THEN NULL ELSE TO_DATE(EKKO."ANGDT", 'YYYYMMDD' ) END as "Quotation_Deadline_Date"
,CASE when EKKO."BNDDT" in ('00000000', ' ') THEN NULL ELSE TO_DATE(EKKO."BNDDT", 'YYYYMMDD' ) END as "Binding_Period_Quotation_Date"
,CASE when EKKO."GWLDT" in ('00000000', ' ') THEN NULL ELSE TO_DATE(EKKO."GWLDT", 'YYYYMMDD' ) END as "Warranty_Date"
,EKKO."AUSNR" as "Bid_Invitation_Number_Id"
,EKKO."ANGNR" as "Quotation_Number"
,CASE when EKKO."IHRAN" in ('00000000', ' ') THEN NULL ELSE TO_DATE(EKKO."IHRAN", 'YYYYMMDD' ) END as "Quotation_Submission_Date"
,EKKO."IHREZ" as "Your_Reference"
,EKKO."VERKF" as "Salesperson"
,EKKO."TELF1" as "Vendors_Telephone_Number"
,EKKO."LLIEF" as "Supplying_Vendor_Id"
,EKKO."KUNNR" as "Customer_Id"
,EKKO."KONNR" as "Outline_Agreement_Id"
,EKKO."ABGRU" as "Field_Not_Used"
,EKKO."AUTLF" as "Complete_Delivery"
,EKKO."WEAKT" as "Indicator_Goods_Receipt_Message"
,EKKO."RESWK" as "Supplying_Plant_Id"
,EKKO."LBLIF" as "Field_Not_Used_Id"
,EKKO."INCO1" as "Incoterms_Id"
,EKKO."INCO2" as "Incoterms_Part_2"
,EKKO."KTWRT" as "Target_Header_Val"
,EKKO."SUBMI" as "Collective_Number"
,EKKO."KNUMV" as "Document_Condition_No"
,EKKO."KALSM" as "Procedure_Id"
,EKKO."STAFO" as "Update_Group_Stats_Id"
,EKKO."LIFRE" as "Different_Invoicing_Party_Id"
,EKKO."EXNUM" as "Number_Foreign_Trade_Id"
,EKKO."UNSEZ" as "Our_Reference"
,EKKO."LOGSY" as "Logical_System_Id"
,EKKO."UPINC" as "Subitem_Interval"
,EKKO."STAKO" as "Time_Dep_Conditions"
,EKKO."FRGGR" as "Release_Group_Id"
,EKKO."FRGSX" as "Release_Strategy_Id"
,EKKO."FRGKE" as "Release_Indicator_Id"
,EKKO."FRGZU" as "Release_State"
,EKKO."FRGRL" as "Subject_To_Release"
,EKKO."LANDS" as "Country_Tax_Return_Id"
,EKKO."LPHIS" as "Rel_Documentation"
,EKKO."ADRNR" as "Address_Number_Id"
,EKKO."STCEG_L" as "Country_Sales_Tax_Id_Number_Id"
,EKKO."STCEG" as "Vat_Registration_No"
,EKKO."ABSGR" as "Reason_Cancellation_Id"
,EKKO."ADDNR" as "Document_Number_Additional"
,EKKO."KORNR" as "Corr_Misc_Provis"
,EKKO."MEMORY" as "Purchase_Order_Not_Yet_Complete"
,EKKO."PROCSTAT" as "Purch_Doc_Proc_State"
,EKKO."RLWRT" as "Total_At_Time_Release_Val"
,EKKO."REVNO" as "Version_Number_In_Purchasing"
,EKKO."SCMPROC" as "Scmproc"
,EKKO."REASON_CODE" as "Goods_Receipt_Reason_Code"
,EKKO."MEMORYTYPE" as "Category_Incompleteness"
,EKKO."RETTP" as "Retention_Indicator"
,EKKO."RETPC" as "Retention_In_Percent"
,EKKO."DPTYP" as "Down_Payment_Indicator"
,EKKO."DPPCT" as "Down_Payment_Percentage"
,EKKO."DPAMT" as "Down_Payment_Amount_Val"
,CASE when EKKO."DPDAT" in ('00000000', ' ') THEN NULL ELSE TO_DATE(EKKO."DPDAT", 'YYYYMMDD' ) END as "Due_Down_Payment_Date"
,EKKO."MSR_ID" as "Process_Identification_Number"
,EKKO."HIERARCHY_EXISTS" as "Part_Contract_Hierarchy"
,EKKO."THRESHOLD_EXISTS" as "Threshold_Value_Exchange_Rates"
,EKKO."LEGAL_CONTRACT" as "Legal_Contract_Number"
,EKKO."DESCRIPTION" as "Contract_Name"
,CASE when EKKO."RELEASE_DATE" in ('00000000', ' ') THEN NULL ELSE TO_DATE(EKKO."RELEASE_DATE", 'YYYYMMDD' ) END as "Release_Contract_Date"
,EKKO."VSART" as "Shipping_Type_Id"
,EKKO."HANDOVERLOC" as "Handover_Location"
,EKKO."SHIPCOND" as "Shipping_Conditions_Id"
,EKKO."INCOV" as "Incoterms_Version_Id"
,EKKO."INCO2_L" as "Incoterms_Location_1"
,EKKO."INCO3_L" as "Incoterms_Location_2"
,EKKO."FORCE_ID" as "Internal_Key_Force_Element"
,EKKO."FORCE_CNT" as "Internal_Version_Counter"
,EKKO."RELOC_ID" as "Relocation_Id"
,EKKO."RELOC_SEQ_ID" as "Relocation_Step_Id"
,EKKO."SOURCE_LOGSYS" as "SOURCE_LOGSYS"
,EKKO."FSH_TRANSACTION" as "Transaction_Number"
,EKKO."FSH_ITEM_GROUP" as "Item_Group"
,EKKO."FSH_VAS_LAST_ITEM" as "Last_Vas_Item_Number"
,EKKO."FSH_OS_STG_CHANGE" as "Os_Strategy_Specific_Fields_Change"
,EKKO."VZSKZ" as "Interest_Calculation_Indicator_Id"
,EKKO."FSH_SNST_STATUS" as "Snapshot_Status"
,EKKO."POHF_TYPE" as "Document_Category"
,CASE when EKKO."EQ_EINDT" in ('00000000', ' ') THEN NULL ELSE TO_DATE(EKKO."EQ_EINDT", 'YYYYMMDD' ) END as "Same_Delivery_Date"
,EKKO."EQ_WERKS" as "Same_Plant_Id"
,EKKO."FIXPO" as "Firm_Deal_Indicator"
,EKKO."EKGRP_ALLOW" as "Take_Account_Purch_Group"
,EKKO."WERKS_ALLOW" as "Take_Account_Plants"
,EKKO."CONTRACT_ALLOW" as "Take_Account_Contracts"
,EKKO."PSTYP_ALLOW" as "Take_Account_Item_Categories"
,EKKO."FIXPO_ALLOW" as "Take_Account_Fixed_Date_Purchases"
,EKKO."KEY_ID_ALLOW" as "Consider_Budget"
,EKKO."AUREL_ALLOW" as "Take_Account_Alloc_Table_Relevance"
,EKKO."DELPER_ALLOW" as "Take_Account_Dlvy_Period"
,EKKO."EINDT_ALLOW" as "Take_Account_Delivery_Date"
,EKKO."LTSNR_ALLOW" as "Include_Vendor_Subrange"
,EKKO."OTB_LEVEL" as "Otb_Check_Level"
,EKKO."OTB_COND_TYPE" as "Otb_Condition_Type_Id"
,EKKO."KEY_ID" as "Unique_Number_Budget"
,EKKO."OTB_VALUE" as "Required_Budget_Val"
,EKKO."OTB_CURR" as "Otb_Currency_Id"
,EKKO."OTB_RES_VALUE" as "Reserved_Budget_Val"
,EKKO."OTB_SPEC_VALUE" as "Special_Release_Budget_Val"
,EKKO."SPR_RSN_PROFILE" as "Otb_Reason_Profile_Special_Release"
,EKKO."BUDG_TYPE" as "Budget_Type"
,EKKO."OTB_STATUS" as "Otb_Check_Status"
,EKKO."OTB_REASON" as "Reason"
,EKKO."CHECK_TYPE" as "Type_Otb_Check"
,EKKO."CON_OTB_REQ" as "Otb_Relevant_Contract"
,EKKO."CON_PREBOOK_LEV" as "Indicator_Level_Contracts"
,EKKO."CON_DISTR_LEV" as "Distrib_Using_Target_Value_Or_Item"
,EKKO."HVR_IS_DELETED" as "Hvr_Is_Deleted"
,EKKO."HVR_CHANGE_TIME" as "Hvr_Change_Time"
from SAP_RAW.EKKO
where
EKKO."MANDT" in ('800')
  );