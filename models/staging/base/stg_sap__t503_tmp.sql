{{ config(enabled=var('sap_using_t503', True)) }}

select * 
from {{ var('t503') }}