{{ config(enabled=var('sap_using_mchp', True)) }}

select * 
from {{ var('mchp') }}