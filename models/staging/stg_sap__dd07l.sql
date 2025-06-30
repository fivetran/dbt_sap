{{ config(enabled=var('sap_using_dd07l', True)) }}

select *
from {{ ref('stg_sap__dd07l_tmp') }}
