{{ config(enabled=var('sap_using_bkpf', True)) }}

select * 
from {{ var('bkpf') }}