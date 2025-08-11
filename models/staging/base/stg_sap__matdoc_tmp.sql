{{ config(enabled=var('sap_using_matdoc', True)) }}

select * 
from {{ var('matdoc') }}