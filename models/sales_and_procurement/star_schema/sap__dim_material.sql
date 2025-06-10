SELECT	
LTRIM(MAT."Material_Id" , '0') as Material_Number
,	MAT.MATERIAL_DESCRIPTION 
, 	MT."Material_Type_Id" 
,   MT.DESCRIPTION_MATERIAL_TYPE  AS Material_Type_Description
,	MAT."Base_Uom_Id" 
, 	MAT."Gross_Weight" 
, 	MAT."Weight_Uom_Id"
,   MAT."Material_Id" 
FROM {{ ref('vw_material') }} MAT
LEFT OUTER JOIN {{ ref('vw_material_type') }}  MT
ON MAT."Material_Type_Id"  = MT."Material_Type_Id"