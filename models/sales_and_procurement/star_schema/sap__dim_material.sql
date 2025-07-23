{% set using_material = var('sap_using_mara', True) %}
{% set using_material_type = var('sap_using_t134', True) %}

{{ config(enabled=using_material) }}

with

material as (
    select *
    from {{ ref('int_sap__material') }}
)

{% if using_material_type %}
, material_type as (
    select *
    from {{ ref('int_sap__material_type') }}
)
{% endif %}

select
    ltrim(material.material_id , '0') as material_number,
    material.material_description,
    material.base_uom_id,
    material.gross_weight,
    material.weight_uom_id,
    material.material_id

    {% if using_material_type %}
    , material_type.material_type_id
    , material_type.description_material_type as material_type_description
    {% endif %}

from material

{% if using_material_type %}
left outer join material_type
    on material.material_type_id = material_type.material_type_id
{% endif %}
