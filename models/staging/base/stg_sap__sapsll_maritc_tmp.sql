{{ config(enabled=var('sap_using_sapsll_maritc', True)) }}

select * 
from {{ var('sapsll_maritc') }}