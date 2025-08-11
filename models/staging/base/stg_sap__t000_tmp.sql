{{ config(enabled=var('sap_using_t000', True)) }}

select * 
from {{ var('t000') }}