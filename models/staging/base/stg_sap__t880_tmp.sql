{{ config(enabled=var('sap_using_t880', True)) }}

select * 
from {{ var('t880') }}