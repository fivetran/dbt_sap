{{ config(enabled=var('sap_using_lfa1', True)) }}

select * 
from {{ var('lfa1') }}