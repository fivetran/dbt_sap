{{ config(enabled=var('sap_using_matdoc_extract', True)) }}

select * 
from {{ var('matdoc_extract') }}