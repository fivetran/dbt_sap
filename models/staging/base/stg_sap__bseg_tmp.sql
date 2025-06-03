{{ config(enabled=var('sap_using_bseg', True)) }}

select * 
from {{ var('bseg') }}