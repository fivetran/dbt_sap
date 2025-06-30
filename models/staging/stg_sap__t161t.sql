{{ config(enabled=var('sap_using_t161t', True)) }}

select *
from {{ ref('stg_sap__t161t_tmp') }}
