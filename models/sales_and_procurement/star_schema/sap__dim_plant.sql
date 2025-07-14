{{ config(enabled=var('sap_using_t001w', True)) }}

select
    plant_id,
    name as plant_name,
    country_key_id
from {{ ref('int_sap__plant') }}
