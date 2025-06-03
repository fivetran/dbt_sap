{{ config(enabled=var('sap_using_pa0001', True)) }}

select * 
from {{ var('pa0001') }}