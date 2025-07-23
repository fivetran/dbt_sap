{{ config(enabled=var('sap_using_kna1', True)) }}

select * 
from {{ var('kna1') }}