{{ config(enabled=var('sap_using_faglflexa', True)) }}

select * 
from {{ var('faglflexa') }}