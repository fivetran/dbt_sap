{{ config(enabled=var('sap_using_lfa1', True)) }}
with lfa1 as ( 

	select * 
	from {{ ref('stg_sap__lfa1') }}
),

final as (

    select
        mandt,
        lifnr,
        name1 as txtmd
    from lfa1
)

select * 
from final