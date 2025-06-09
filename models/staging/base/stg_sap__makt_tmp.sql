{{ config(enabled=var('sap_using_makt', True)) }}

select * 
from {{ var('makt') }}