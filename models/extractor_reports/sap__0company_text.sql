{{ config(enabled=var('sap_using_t880', True)) }}

with t880 as ( 

	select * 
	from {{ ref('stg_sap__t880') }}
),

final as (

    select 
        mandt,
        rcomp,
        name1 as txtmd
    from t880
)

select * 
from final