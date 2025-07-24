{{ config(enabled=var('sap_using_mara', True)) }}

select * 
from {{ var('mara') }}