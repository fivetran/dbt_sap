{{ config(enabled=var('sap_using_sapsll_tunos', True)) }}

select * 
from {{ var('sapsll_tunos') }}