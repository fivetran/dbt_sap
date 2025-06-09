create or replace view EC_DB.SAP_BI.D_MATERIAL(
	MATERIAL_NUMBER,
	MATERIAL_DESCRIPTION,
	"Material_Type_Id",
	MATERIAL_TYPE_DESCRIPTION,
	"Base_Uom_Id",
	"Gross_Weight",
	"Weight_Uom_Id",
	"Material_Id"
) as 
SELECT	
LTRIM(MAT."Material_Id" , '0') as Material_Number
,	MAT.MATERIAL_DESCRIPTION 
, 	MT."Material_Type_Id" 
,   MT.DESCRIPTION_MATERIAL_TYPE  AS Material_Type_Description
,	MAT."Base_Uom_Id" 
, 	MAT."Gross_Weight" 
, 	MAT."Weight_Uom_Id"
,   MAT."Material_Id" 
FROM 			
SAP_STG."VW_Material"  MAT
LEFT OUTER JOIN SAP_STG."VW_Material_Type"  MT
ON MAT."Material_Type_Id"  = MT."Material_Type_Id";