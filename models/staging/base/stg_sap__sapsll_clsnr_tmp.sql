{{ config(enabled=var('sap_using_sapsll_clsnr', True)) }}

select * 
from {{ var('sapsll_clsnr') }}