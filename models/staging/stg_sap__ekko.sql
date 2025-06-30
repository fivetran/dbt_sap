{{ config(enabled=var('sap_using_ekko', True)) }}

select *
from {{ ref('stg_sap__ekko_tmp') }}
