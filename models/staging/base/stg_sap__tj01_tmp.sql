{{ config(enabled=var('sap_using_tj01', True)) }}

select * 
from {{ var('mchtj01p') }}