{{ config(enabled=var('sap_using_t024', True)) }}

select * 
from {{ var('t024') }}