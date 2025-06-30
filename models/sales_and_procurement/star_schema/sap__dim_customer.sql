select	
	ltrim(customer_id, '0' ) as customer_number,
	country_key_id,
	name as customer_name,
	city,
	customer_id 	
from {{ ref('vw_customer') }}
