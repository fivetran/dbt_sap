{{ config(enabled=var('sap_using__sapsll_clsnr', True)) }}

select * 
from {{ var('_sapsll_clsnr') }}