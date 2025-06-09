{{ config(enabled=var('sap_using_ska1', True)) }}

with ska1 as ( 

	select * 
	from {{ ref('stg_sap__ska1') }}
),

final as (

	select
		mandt, 
		ktopl,
		saknr,
		bilkt,
		gvtyp,
		vbund,
		xbilk,
		sakan,
		erdat,
		ernam,
		ktoks,
		xloev,
		xspea,
		xspeb,
		xspep,
		func_area,
		mustr	
	from ska1

	{% if var('ska1_mandt_var',[]) %}
	where mandt = '{{ var('ska1_mandt_var') }}'
	{% endif %}
)

select * 
from final
