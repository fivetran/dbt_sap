{{ config(enabled=var('sap_using_faglflext', True)) }}

select * 
from {{ var('faglflext') }}