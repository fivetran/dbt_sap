{{ config(enabled=var('sap_using_t024e', True)) }}

select * 
from {{ var('t024e') }}