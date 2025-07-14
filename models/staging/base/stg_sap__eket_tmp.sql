{{ config(enabled=var('sap_using_eket', True)) }}

select * 
from {{ var('eket') }}