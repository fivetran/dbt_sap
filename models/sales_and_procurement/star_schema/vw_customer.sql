create or replace view EC_DB.SAP_STG."VW_Customer"(
	"Customer_Id",
	"Client_Id",
	"Payment_Office_Id",
	"Industry_Key_Id",
	"Attribute_9_Id",
	"Currency_Sales_Figure_Id",
	"Customer_Condition_Group_1_Id",
	"Name_3",
	"Industry_Code_4_Id",
	"District",
	"_Vso_R_Matpal",
	"_Vso_R_One_Sort",
	"Fiscal_Address_Id",
	"Group_Key",
	"Lab_Customer_Group_Id",
	"Free_Description",
	"Payment_Block",
	"Attribute_4_Id",
	"Telex_Number",
	"Crt_Number",
	"Instruction_Key_Id",
	"P_O_Box_Postal_Code",
	"Communication_Line_No",
	"Foreign_National_Registration",
	"Name_4",
	"Alt_Payer_In_Doc",
	"Customer_Classification_Id",
	"_Xlso_Customer",
	"Name_2",
	"Express_Train_Station",
	"House_Number",
	"Duns_4",
	"Customer_Condition_Group_2_Id",
	"Differ_Refer_Code_Id",
	"Industry_Code_5_Id",
	"Annual_Sales_Val",
	"Tax_Number_3",
	"State",
	"Icms_Law_Id",
	PSOO3,
	"Rne_Issuing_Date",
	"Authorization_Group_Id",
	"Attribute_5_Id",
	"Tax_Number_Type_Id",
	"Duns_Number",
	"Confirmation_Date",
	"Attribute_10_Id",
	"Indicator_Competitor",
	"After_Delivery",
	"Fiscal_Year_Variant_Id",
	"_Vso_R_Pal_Ul",
	"Customer_Condition_Group_3_Id",
	"Usage_Id",
	"Rg_Number",
	"Tax_Number_4",
	"Central_Deletion_Flag",
	"Ipi_Law_Id",
	"Vendor_Id",
	PSOO4,
	"_Xlso_Pref_Pay",
	"County_Code_Id",
	"Fax_Number",
	"Tax_Number_2",
	"By_Customer",
	"Indicator_Sales_Partner",
	"Tax_Number_1",
	"City",
	"Purchase_Order_Req",
	"Customer_Condition_Group_4_Id",
	"Business_Purpose_Completed_Flag",
	"Central_Billing_Block_Id",
	"Customer_Account_Group_Id",
	"Telebox_Number",
	"Legal_Nature_Id",
	"Street_And_House_Number",
	"Biochemical_Warfare",
	"Dme_Indicator",
	PSOO5,
	"Type_Industry_Id",
	"Natural_Person",
	"Issued_By",
	"Title",
	"_Xlso_Partner",
	"Indicator_Sales_Prospect",
	"Customer_Is_Ipi_Exempt",
	"Nielsen_Id",
	UMSA1,
	"Train_Station",
	"Check_Digit",
	"Customer_Condition_Group_5_Id",
	"_Vso_R_One_Mat",
	"Uniform_Resource_Locator",
	"Accts_Alt_Payer",
	"Indicator_Consumer",
	"Po_Box_City",
	"Tax_Number_5",
	"City_Code_Id",
	"Nuclear_Nonprolif",
	"Ric_Number",
	"Country_Key_Id",
	"Year_Which_Sales_Are_Given",
	"Fee_Schedule",
	"Indicator_Customer_Type_4",
	"_Xlso_Client",
	"Created_On_Date",
	"_Vso_R_Dpoint",
	"Teletex_Number",
	"National_Security",
	"Business_Location_Id",
	"_Xlso_Sysid",
	"Rg_Issuing_Date",
	ANRED,
	"Initial_Contact_Id",
	"Trading_Partner_Id",
	"Street",
	"Alternative_Payer_Id",
	"Id_Default_Sold_To_Party",
	"Processor_Group_Id",
	"Year_No_Given_For",
	"Tax_Declaration_Type_Id",
	"Int_Location_No_1",
	"Region_Id",
	"Agency_Location_Code_Id",
	"Central_Order_Block_Customer_Id",
	"Missile_Technology",
	"Central_Delivery_Block_Id",
	"Central_Sales_Block_Customer",
	"Plant_Id",
	"Attribute_6_Id",
	"Slaprepr_Proced",
	"_Vso_R_Load_Pref",
	"Address_Id",
	"Id_Mainly_Non_Military_Use",
	"Liable_Vat",
	"Tax_Type_Id",
	"Industry_Code_1_Id",
	"First_Name",
	"Company_Size_Id",
	"Name_Representative",
	"Search_Term_Matchcode_Search",
	"Attribute_1_Id",
	"Assignment_To_Hierarchy",
	"Customer_Is_Icms_Exempt",
	"Industry_Main_Type_Id",
	"One_Time_Account",
	"Transportation_Zone_Id",
	"Sort_Field",
	"Attribute_7_Id",
	"Legal_Status_Id",
	"Name",
	"Industry_Code_2_Id",
	"Vat_Registration_No",
	"Central_Posting_Block",
	"City_Coordinates",
	"Last_Change_Confirmation_Tim",
	"Cnae_Id",
	MCOD2,
	"Created_By",
	"Tax_Jurisdiction_Id",
	"Attribute_2_Id",
	"Confirmation_Status",
	"Telephone_1",
	"_Vso_R_Palhgt",
	"Type_Business_Id",
	"Language_Key_Id",
	"_Vso_R_Uld_Side",
	"Int_Location_No_2",
	"Subtrib_Group_Id",
	"Attribute_8_Id",
	"Yearly_Number_Employees",
	"Central_Del_Block",
	"_Vso_R_I_No_Lyr",
	"Declaration_Regimen_Pis_Cofins_Id",
	"Status_Transfer_To_Next_Release",
	PSON2,
	"Customers_Cfop_Category",
	"Po_Box",
	"Icms_Taxpayer_Id",
	"Industry_Code_3_Id",
	"Suframa_Code",
	"Unloading_Points",
	"Postal_Code",
	"Sales_Equalizatn_Tax",
	PSOO1,
	"Reference_Acct_Group_Id",
	"Second_Telephone_Number",
	"Working_Time_Calendar_Id",
	"Id_Mainly_Military_Use",
	"Attribute_3_Id",
	MCOD3,
	"Regional_Market",
	"_Vso_R_Pk_Mat",
	NAME3,
	NAME1,
	"_Fivetran_Deleted",
	"_Fivetran_Synced",
	"_Fivetran_Sap_Archived"
) as (
    

Select
KNA1."KUNNR" as "Customer_Id"
,KNA1."MANDT" as "Client_Id"
,KNA1."PMT_OFFICE" as "Payment_Office_Id"
,KNA1."BRSCH" as "Industry_Key_Id"
,KNA1."KATR9" as "Attribute_9_Id"
,KNA1."UWAER" as "Currency_Sales_Figure_Id"
,KNA1."KDKG1" as "Customer_Condition_Group_1_Id"
,KNA1."PSON3" as "Name_3"
,KNA1."BRAN4" as "Industry_Code_4_Id"
,KNA1."ORT02" as "District"
,KNA1."_VSO_R_MATPAL" as "_Vso_R_Matpal"
,KNA1."_VSO_R_ONE_SORT" as "_Vso_R_One_Sort"
,KNA1."FISKN" as "Fiscal_Address_Id"
,KNA1."KONZS" as "Group_Key"
,KNA1."ETIKG" as "Lab_Customer_Group_Id"
,KNA1."PSOO2" as "Free_Description"
,KNA1."SPERZ" as "Payment_Block"
,KNA1."KATR4" as "Attribute_4_Id"
,KNA1."TELX1" as "Telex_Number"
,KNA1."CRTN" as "Crt_Number"
,KNA1."DTAWS" as "Instruction_Key_Id"
,KNA1."PSTL2" as "P_O_Box_Postal_Code"
,KNA1."DATLT" as "Communication_Line_No"
,KNA1."RNE" as "Foreign_National_Registration"
,KNA1."NAME4" as "Name_4"
,KNA1."XZEMP" as "Alt_Payer_In_Doc"
,KNA1."KUKLA" as "Customer_Classification_Id"
,KNA1."_XLSO_CUSTOMER" as "_Xlso_Customer"
,KNA1."NAME2" as "Name_2"
,KNA1."BAHNE" as "Express_Train_Station"
,KNA1."PSOHS" as "House_Number"
,KNA1."DUNS4" as "Duns_4"
,KNA1."KDKG2" as "Customer_Condition_Group_2_Id"
,KNA1."OIDRC" as "Differ_Refer_Code_Id"
,KNA1."BRAN5" as "Industry_Code_5_Id"
,KNA1."UMSAT" as "Annual_Sales_Val"
,KNA1."STCD3" as "Tax_Number_3"
,KNA1."UF" as "State"
,KNA1."TXLW1" as "Icms_Law_Id"
,KNA1."PSOO3" as "PSOO3"
,KNA1."RNEDATE" as "Rne_Issuing_Date"
,KNA1."BEGRU" as "Authorization_Group_Id"
,KNA1."KATR5" as "Attribute_5_Id"
,KNA1."STCDT" as "Tax_Number_Type_Id"
,KNA1."DUNS" as "Duns_Number"
,KNA1."UPDAT" as "Confirmation_Date"
,KNA1."KATR10" as "Attribute_10_Id"
,KNA1."DEAR1" as "Indicator_Competitor"
,KNA1."INSPATDEBI" as "After_Delivery"
,KNA1."PERIV" as "Fiscal_Year_Variant_Id"
,KNA1."_VSO_R_PAL_UL" as "_Vso_R_Pal_Ul"
,KNA1."KDKG3" as "Customer_Condition_Group_3_Id"
,KNA1."ABRVW" as "Usage_Id"
,KNA1."RG" as "Rg_Number"
,KNA1."STCD4" as "Tax_Number_4"
,KNA1."LOEVM" as "Central_Deletion_Flag"
,KNA1."TXLW2" as "Ipi_Law_Id"
,KNA1."LIFNR" as "Vendor_Id"
,KNA1."PSOO4" as "PSOO4"
,KNA1."_XLSO_PREF_PAY" as "_Xlso_Pref_Pay"
,KNA1."COUNC" as "County_Code_Id"
,KNA1."TELFX" as "Fax_Number"
,KNA1."STCD2" as "Tax_Number_2"
,KNA1."INSPBYDEBI" as "By_Customer"
,KNA1."DEAR2" as "Indicator_Sales_Partner"
,KNA1."STCD1" as "Tax_Number_1"
,KNA1."ORT01" as "City"
,KNA1."OID_POREQD" as "Purchase_Order_Req"
,KNA1."KDKG4" as "Customer_Condition_Group_4_Id"
,KNA1."CVP_XBLCK" as "Business_Purpose_Completed_Flag"
,KNA1."FAKSD" as "Central_Billing_Block_Id"
,KNA1."KTOKD" as "Customer_Account_Group_Id"
,KNA1."TELBX" as "Telebox_Number"
,KNA1."LEGALNAT" as "Legal_Nature_Id"
,KNA1."STRAS" as "Street_And_House_Number"
,KNA1."CCC01" as "Biochemical_Warfare"
,KNA1."DTAMS" as "Dme_Indicator"
,KNA1."PSOO5" as "PSOO5"
,KNA1."J_1KFTIND" as "Type_Industry_Id"
,KNA1."STKZN" as "Natural_Person"
,KNA1."EXP" as "Issued_By"
,KNA1."PSOTL" as "Title"
,KNA1."_XLSO_PARTNER" as "_Xlso_Partner"
,KNA1."DEAR3" as "Indicator_Sales_Prospect"
,KNA1."XXIPI" as "Customer_Is_Ipi_Exempt"
,KNA1."NIELS" as "Nielsen_Id"
,KNA1."UMSA1" as "UMSA1"
,KNA1."BAHNS" as "Train_Station"
,KNA1."BUBKZ" as "Check_Digit"
,KNA1."KDKG5" as "Customer_Condition_Group_5_Id"
,KNA1."_VSO_R_ONE_MAT" as "_Vso_R_One_Mat"
,KNA1."KNURL" as "Uniform_Resource_Locator"
,KNA1."XKNZA" as "Accts_Alt_Payer"
,KNA1."DEAR6" as "Indicator_Consumer"
,KNA1."PFORT" as "Po_Box_City"
,KNA1."STCD5" as "Tax_Number_5"
,KNA1."CITYC" as "City_Code_Id"
,KNA1."CCC02" as "Nuclear_Nonprolif"
,KNA1."RIC" as "Ric_Number"
,KNA1."LAND1" as "Country_Key_Id"
,KNA1."UMJAH" as "Year_Which_Sales_Are_Given"
,KNA1."FEE_SCHEDULE" as "Fee_Schedule"
,KNA1."DEAR4" as "Indicator_Customer_Type_4"
,KNA1."_XLSO_CLIENT" as "_Xlso_Client"
,KNA1."ERDAT" as "Created_On_Date"
,KNA1."_VSO_R_DPOINT" as "_Vso_R_Dpoint"
,KNA1."TELTX" as "Teletex_Number"
,KNA1."CCC03" as "National_Security"
,KNA1."OIPBL" as "Business_Location_Id"
,KNA1."_XLSO_SYSID" as "_Xlso_Sysid"
,KNA1."RGDATE" as "Rg_Issuing_Date"
,KNA1."ANRED" as "ANRED"
,KNA1."EKONT" as "Initial_Contact_Id"
,KNA1."VBUND" as "Trading_Partner_Id"
,KNA1."PSOST" as "Street"
,KNA1."KNRZA" as "Alternative_Payer_Id"
,KNA1."DEAR5" as "Id_Default_Sold_To_Party"
,KNA1."PSOFG" as "Processor_Group_Id"
,KNA1."JMJAH" as "Year_No_Given_For"
,KNA1."TDT" as "Tax_Declaration_Type_Id"
,KNA1."BBBNR" as "Int_Location_No_1"
,KNA1."REGIO" as "Region_Id"
,KNA1."ALC" as "Agency_Location_Code_Id"
,KNA1."AUFSD" as "Central_Order_Block_Customer_Id"
,KNA1."CCC04" as "Missile_Technology"
,KNA1."LIFSD" as "Central_Delivery_Block_Id"
,KNA1."CASSD" as "Central_Sales_Block_Customer"
,KNA1."WERKS" as "Plant_Id"
,KNA1."KATR6" as "Attribute_6_Id"
,KNA1."PSOIS" as "Slaprepr_Proced"
,KNA1."_VSO_R_LOAD_PREF" as "_Vso_R_Load_Pref"
,KNA1."ADRNR" as "Address_Id"
,KNA1."CIVVE" as "Id_Mainly_Non_Military_Use"
,KNA1."STKZU" as "Liable_Vat"
,KNA1."FITYP" as "Tax_Type_Id"
,KNA1."BRAN1" as "Industry_Code_1_Id"
,KNA1."PSOVN" as "First_Name"
,KNA1."COMSIZE" as "Company_Size_Id"
,KNA1."J_1KFREPRE" as "Name_Representative"
,KNA1."MCOD1" as "Search_Term_Matchcode_Search"
,KNA1."KATR1" as "Attribute_1_Id"
,KNA1."HZUOR" as "Assignment_To_Hierarchy"
,KNA1."XICMS" as "Customer_Is_Icms_Exempt"
,KNA1."INDTYP" as "Industry_Main_Type_Id"
,KNA1."XCPDK" as "One_Time_Account"
,KNA1."LZONE" as "Transportation_Zone_Id"
,KNA1."SORTL" as "Sort_Field"
,KNA1."KATR7" as "Attribute_7_Id"
,KNA1."GFORM" as "Legal_Status_Id"
,KNA1."PSON1" as "Name"
,KNA1."BRAN2" as "Industry_Code_2_Id"
,KNA1."STCEG" as "Vat_Registration_No"
,KNA1."SPERR" as "Central_Posting_Block"
,KNA1."LOCCO" as "City_Coordinates"
,KNA1."UPTIM" as "Last_Change_Confirmation_Tim"
,KNA1."CNAE" as "Cnae_Id"
,KNA1."MCOD2" as "MCOD2"
,KNA1."ERNAM" as "Created_By"
,KNA1."TXJCD" as "Tax_Jurisdiction_Id"
,KNA1."KATR2" as "Attribute_2_Id"
,KNA1."CONFS" as "Confirmation_Status"
,KNA1."TELF1" as "Telephone_1"
,KNA1."_VSO_R_PALHGT" as "_Vso_R_Palhgt"
,KNA1."J_1KFTBUS" as "Type_Business_Id"
,KNA1."SPRAS" as "Language_Key_Id"
,KNA1."_VSO_R_ULD_SIDE" as "_Vso_R_Uld_Side"
,KNA1."BBSNR" as "Int_Location_No_2"
,KNA1."XSUBT" as "Subtrib_Group_Id"
,KNA1."KATR8" as "Attribute_8_Id"
,KNA1."JMZAH" as "Yearly_Number_Employees"
,KNA1."NODEL" as "Central_Del_Block"
,KNA1."_VSO_R_I_NO_LYR" as "_Vso_R_I_No_Lyr"
,KNA1."DECREGPC" as "Declaration_Regimen_Pis_Cofins_Id"
,KNA1."DUEFL" as "Status_Transfer_To_Next_Release"
,KNA1."PSON2" as "PSON2"
,KNA1."CFOPC" as "Customers_Cfop_Category"
,KNA1."PFACH" as "Po_Box"
,KNA1."ICMSTAXPAY" as "Icms_Taxpayer_Id"
,KNA1."BRAN3" as "Industry_Code_3_Id"
,KNA1."SUFRAMA" as "Suframa_Code"
,KNA1."EXABL" as "Unloading_Points"
,KNA1."PSTLZ" as "Postal_Code"
,KNA1."STKZA" as "Sales_Equalizatn_Tax"
,KNA1."PSOO1" as "PSOO1"
,KNA1."KTOCD" as "Reference_Acct_Group_Id"
,KNA1."TELF2" as "Second_Telephone_Number"
,KNA1."KNAZK" as "Working_Time_Calendar_Id"
,KNA1."MILVE" as "Id_Mainly_Military_Use"
,KNA1."KATR3" as "Attribute_3_Id"
,KNA1."MCOD3" as "MCOD3"
,KNA1."RPMKR" as "Regional_Market"
,KNA1."_VSO_R_PK_MAT" as "_Vso_R_Pk_Mat"
,KNA1."NAME3" as "NAME3"
,KNA1."NAME1" as "NAME1"
,KNA1."_FIVETRAN_DELETED" as "_Fivetran_Deleted"
,KNA1."_FIVETRAN_SYNCED" as "_Fivetran_Synced"
,KNA1."_FIVETRAN_SAP_ARCHIVED" as "_Fivetran_Sap_Archived"
from SAP_HANA_DB_SAPABAP1.KNA1
where
KNA1."MANDT" in ('800')
  );