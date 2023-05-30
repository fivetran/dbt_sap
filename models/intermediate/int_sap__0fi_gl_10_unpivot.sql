with sums as ( 

	select * 
	from {{ ref('int_sap__0fi_gl_10_sums') }}
),


final as ( 

	select   
		{{ 
			dbt_utils.unpivot(
				relation=ref('int_sap__0fi_gl_10_sums'), 
				cast_to='numeric', 
        		exclude=['ryear','activ','rmvct','rtcur','runit','awtyp','rldnr','rrcty','rvers','logsys','racct','cost_elem','rbukrs','rcntr','prctr','rfarea','rbusa','kokrs','segment','scntr','pprctr','sfarea','sbusa','rassc','psegment', 'faglflext_timestamp'],
				remove=['drcrk','objnr00','objnr01','objnr02','objnr03','objnr04','objnr05','objnr06','objnr07','objnr08','rclnt','rpmax','waers','periv','zzspreg','ktopl','_fivetran_rowid','_fivetran_deleted','_fivetran_synced'],
				field_name = fieldtype
			) 
		}},
		case when left(fieldtype,1) = 't' then '00'	   
			when left(fieldtype,1) = 'h' then '10'
			when left(fieldtype,1) = 'k' then '20' 
			when left(fieldtype,1) = 'o' then '40' 
			end as currency_type,
		concat("0", case when right(fieldtype,2) = 'vt' then '00' else right(fieldtype,2) end, ".", ryear) as fiscal_period,
		case when drcrk = 's' and substring(fieldtype,3,1) = 'l' then value 
			else 0 
			end as debit_amount,
		case when drcrk = 'h' and substring(fieldtype,3,1) = 'l' then value 
			else 0 
			end as credit_amount,
		case when substring(fieldtype,3,1) = 'm' then value 
			else 0 
			end as accumulated_balance,
		case when substring(fieldtype,3,1) = 'l' then value 
			else 0 
			end as turnover
	from sums
)

select * 
from final