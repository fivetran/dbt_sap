{{ config(enabled=var('sap_using_t001', True)) }}

select * 
from {{ var('t001') }}