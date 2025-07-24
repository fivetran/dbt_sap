{{ config(enabled=var('sap_using_pa0008', True)) }}

select * 
from {{ var('pa0008') }}