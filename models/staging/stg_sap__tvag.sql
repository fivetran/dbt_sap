{{ config(enabled=var('sap_using_tvag', True)) }}

select *
from {{ ref('stg_sap__tvag_tmp') }}
