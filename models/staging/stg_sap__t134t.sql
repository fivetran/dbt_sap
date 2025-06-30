{{ config(enabled=var('sap_using_t134t', True)) }}

select *
from {{ ref('stg_sap__t134t_tmp') }}
