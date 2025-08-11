{{ config(enabled=var('sap_using_finsc_ld_cmp', True)) }}

select * 
from {{ var('finsc_ld_cmp') }}