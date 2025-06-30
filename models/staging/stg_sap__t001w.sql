{{ config(enabled=var('sap_using_t001w', True)) }}

select *
from {{ ref('stg_sap__t001w_tmp') }}
