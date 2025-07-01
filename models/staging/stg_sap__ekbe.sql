{{ config(enabled=var('sap_using_ekbe', True)) }}

select *
from {{ ref('stg_sap__ekbe_tmp') }}
