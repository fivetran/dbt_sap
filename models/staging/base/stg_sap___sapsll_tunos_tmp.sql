{{ config(enabled=var('sap_using__sapsll_tunos', True)) }}

select * 
from {{ var('_sapsll_tunos') }}