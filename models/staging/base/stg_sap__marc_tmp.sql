{{ config(enabled=var('sap_using_marc', True)) }}

select * 
from {{ var('marc') }}