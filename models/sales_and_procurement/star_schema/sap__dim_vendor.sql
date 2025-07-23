{{ config(enabled=var('sap_using_lfa1', true)) }}

select 
    vendor_id,
    country_key_id,
    name,
    name_2,
    city,
    sort_field,
    authorization_group_id,
    industry_key_id,
    group_key,
    vendor_account_group_id
from {{ ref('int_sap__vendor') }}
