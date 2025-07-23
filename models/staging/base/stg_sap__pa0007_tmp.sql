{{ config(enabled=var('sap_using_pa0007', True)) }}

select * 
from {{ var('pa0007') }}