{{ config(enabled=var('sap_using_finsc_cmp_versnd', True)) }}

select * 
from {{ var('finsc_cmp_versnd') }}