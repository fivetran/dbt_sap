{{ config(enabled=var('sap_using_t134t', True)) }}

select * 
from {{ var('t134t') }}