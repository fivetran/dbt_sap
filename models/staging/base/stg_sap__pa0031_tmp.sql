{{ config(enabled=var('sap_using_pa0031', True)) }}

select * 
from {{ var('pa0031') }}