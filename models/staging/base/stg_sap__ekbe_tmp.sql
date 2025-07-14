{{ config(enabled=var('sap_using_ekbe', True)) }}

select * 
from {{ var('ekbe') }}