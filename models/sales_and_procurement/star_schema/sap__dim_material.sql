with vw_material as (
    select *
    from {{ ref('int_sap__material') }}

), vw_material_type as (
    select *
    from {{ ref('int_sap__material_type') }}
)

select	
    ltrim(vw_material.material_id , '0') as material_number,
    vw_material.material_description,
    vw_material_type.material_type_id,
    vw_material_type.description_material_type  as material_type_description,
    vw_material.base_uom_id,
    vw_material.gross_weight,
    vw_material.weight_uom_id,
    vw_material.material_id 
from vw_material
left outer join vw_material_type
on vw_material.material_type_id  = vw_material_type.material_type_id
