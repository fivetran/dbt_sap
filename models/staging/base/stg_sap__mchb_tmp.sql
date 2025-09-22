{{ config(enabled=var('sap_using_mchb', True)) }}

select * 
from {{ var('mchb') }}