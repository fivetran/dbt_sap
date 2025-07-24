{{ config(enabled=var('sap_using_t134', True)) }}

select * 
from {{ var('t134') }}