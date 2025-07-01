{{ config(enabled=var('sap_using_eket', True)) }}

select *
from {{ ref('stg_sap__eket_tmp') }}
