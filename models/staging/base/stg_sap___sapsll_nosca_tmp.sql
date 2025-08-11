{{ config(enabled=var('sap_using__sapsll_nosca', True)) }}

select * 
from {{ var('_sapsll_nosca') }}