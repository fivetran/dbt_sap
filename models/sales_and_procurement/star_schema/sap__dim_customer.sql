{{ config(enabled=var('sap_using_kna1', True)) }}

select
	ltrim(customer_id, '0' ) as customer_number,
	country_key_id,
	name as customer_name,
	city,
	customer_id 	
from {{ ref('int_sap__customer') }}
