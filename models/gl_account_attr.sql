with ska1 as ( 

	select * 
	from {{ var('ska1') }}
),

final as (

	select
		mandt as client,
		ktopl as chart_of_accounts,
		saknr as gl_account_number,
		bilkt as group_account_number,
		gvtyp as pl_statement_account_type,
		vbund as partner_company_id,
		xbilk as is_balance_sheet_account,
		sakan as ,
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
		mandt = {{ var('mandt_var') }}
)

select * 
from final