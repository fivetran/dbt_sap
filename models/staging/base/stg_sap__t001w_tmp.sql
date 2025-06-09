{{ config(enabled=var('sap_using_t001w', True)) }}

select * 
from {{ var('t001w') }}