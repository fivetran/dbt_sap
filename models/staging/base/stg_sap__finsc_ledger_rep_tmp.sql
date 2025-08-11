{{ config(enabled=var('sap_using_finsc_ledger_rep', True)) }}

select * 
from {{ var('finsc_ledger_rep') }}