{{ config(enabled=var('sap_using_t161', True)) }}

select * 
from {{ var('t161') }}