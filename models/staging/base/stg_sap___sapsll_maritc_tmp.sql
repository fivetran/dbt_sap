{{ config(enabled=var('sap_using__sapsll_maritc', True)) }}

select * 
from {{ var('_sapsll_maritc') }}