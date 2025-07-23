{{ config(enabled=var('sap_using_dd07l', True)) }}

select * 
from {{ var('dd07l') }}