{{ config(enabled=var('sap_using_ekpo', True)) }}

select * 
from {{ var('ekpo') }}