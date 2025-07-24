{{ config(enabled=var('sap_using_ska1', True)) }}

select * 
from {{ var('ska1') }}