{{ config(enabled=var('sap_using_sapsll_nosca', True)) }}

select * 
from {{ var('sapsll_nosca') }}