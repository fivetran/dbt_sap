with unpivot as ( 

	select * 
	from {{ ref('int_sap__0fi_gl_10_unpivot') }}
),

final as (

    select 
        ryear,
        activ,
        rmvct,
        rtcur,
        runit,
        awtyp,
        rldnr,
        rrcty,
        rvers,
        logsys,
        racct,
        cost_elem,
        rbukrs,
        rcntr,
        prctr,
        rfarea,
        rbusa,
        kokrs,
        segment,
        scntr,
        pprctr,
        sfarea,
        sbusa,
        rassc,
        psegment,
        faglflext_timestamp,
        currency_type,
        fiscal_period,
        sum(debit_amount) AS debit_amount,
        sum(credit_amount) as credit_amount,
        sum(accumulated_balance) AS accumulated_balance
        sum(turnover) AS turnover
    from unpivot
    {{ dbt_utils.group_by(28) }}  
)

select * 
from final