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
	from
		ska1
	where
		mandt = {{ var('ska1_mandt_var') }}
)

select * 
from final