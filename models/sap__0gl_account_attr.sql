with ska1 as ( 

	select * 
	from {{ var('ska1') }}
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
<<<<<<< HEAD
	where mandt = "{{ var('ska1_mandt_var') }}"
=======
	where mandt = '{{ var('ska1_mandt_var') }}' 
>>>>>>> e259ae428a731f5b9a026a0400dd972c952e5e56
	{% endif %}
)

select * 
from final
