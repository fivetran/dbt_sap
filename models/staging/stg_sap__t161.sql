{{ config(enabled=var('sap_using_t161', True)) }}

select *
from {{ ref('stg_sap__t161_tmp') }}
