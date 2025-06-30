select	
ltrim(mat.material_id , '0') as material_number
,	mat.material_description 
, 	mt.material_type_id 
,   mt.description_material_type  as material_type_description
,	mat.base_uom_id 
, 	mat.gross_weight 
, 	mat.weight_uom_id
,   mat.material_id 
from {{ ref('vw_material') }} mat
left outer join {{ ref('vw_material_type') }}  mt
on mat.material_type_id  = mt.material_type_id
