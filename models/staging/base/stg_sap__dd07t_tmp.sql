{{ config(enabled=var('sap_using_dd07t', True)) }}

select * 
from {{ var('dd07t') }}