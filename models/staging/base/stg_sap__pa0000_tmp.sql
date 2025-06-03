{{ config(enabled=var('sap_using_pa0000', True)) }}

select * 
from {{ var('pa0000') }}