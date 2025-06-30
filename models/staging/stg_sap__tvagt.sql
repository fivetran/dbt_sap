{{ config(enabled=var('sap_using_tvagt', True)) }}

select *
from {{ ref('stg_sap__tvagt_tmp') }}
