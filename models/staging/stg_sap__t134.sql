{{ config(enabled=var('sap_using_t134', True)) }}

select *
from {{ ref('stg_sap__t134_tmp') }}
