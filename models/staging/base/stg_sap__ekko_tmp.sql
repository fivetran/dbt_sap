{{ config(enabled=var('sap_using_ekko', True)) }}

select * 
from {{ var('ekko') }}