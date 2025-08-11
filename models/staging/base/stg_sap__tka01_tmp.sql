{{ config(enabled=var('sap_using_tka01', True)) }}

select * 
from {{ var('tka01') }}