{{ config(enabled=var('sap_using_acdoca', True)) }}

select * 
from {{ var('acdoca') }}