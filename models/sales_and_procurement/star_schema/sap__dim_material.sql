{{ config(enabled=(var('sap_using_mara', True) and var('sap_using_makt', True) and var('sap_using_t134', True) and var('sap_using_t134t', True))) }}

with material as (
    select *
    from {{ ref('int_sap__material') }}

), material_type as (
    select *
    from {{ ref('int_sap__material_type') }}
)

select
    ltrim(material.material_id , '0') as material_number,
    material.material_description,
    material_type.material_type_id,
    material_type.description_material_type  as material_type_description,
    material.base_uom_id,
    material.gross_weight,
    material.weight_uom_id,
    material.material_id 
from material
left outer join material_type
    on material.material_type_id  = material_type.material_type_id
