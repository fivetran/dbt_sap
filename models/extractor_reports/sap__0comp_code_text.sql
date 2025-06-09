{{ config(enabled=var('sap_using_t001', True)) }}

with t001 as ( 

	select * 
	from {{ ref('stg_sap__t001') }}
),

final as (

    select
        mandt,
        bukrs,
        butxt as txtmd,
        spras as langu
    from t001
)

select * 
from final