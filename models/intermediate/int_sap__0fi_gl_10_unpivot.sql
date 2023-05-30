with sums as ( 

	select * 
	from {{ ref('int_sap__0fi_gl_10_sums') }}
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
		case when left(fieldtype,1) = 't' then '00'	   
			when left(fieldtype,1) = 'h' then '10'
			when left(fieldtype,1) = 'k' then '20' 
			when left(fieldtype,1) = 'o' then '40' 
			end as currency_type,
		concat('0', case when right(fieldtype,2) = 'vt' then '00' else right(fieldtype,2) end, '.', ryear) as fiscal_period,
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
	unpivot(value for fieldtype in (
				hslvt, 
				hsmvt,
				hsl01,
				hsm01,
				hsl02,
				hsm02,
				hsl03,
				hsm03,
				hsl04,
				hsm04,
				hsl05,
				hsm05,
				hsl06,
				hsm06,
				hsl07,
				hsm07,
				hsl08,
				hsm08,
				hsl09,
				hsm09,
				hsl10,
				hsm10,
				hsl11,
				hsm11,
				hsl12,
				hsm12,
				hsl13,
				hsm13,
				hsl14,
				hsm14,
				hsl15,
				hsm15,
				hsl16,
				hsm16,
				tslvt,
				tsmvt,
				tsl01,
				tsm01,
				tsl02,
				tsm02,
				tsl03,
				tsm03,
				tsl04,
				tsm04,
				tsl05,
				tsm05,
				tsl06,
				tsm06,
				tsl07,
				tsm07,
				tsl08,
				tsm08,
				tsl09,
				tsm09,
				tsl10,
				tsm10,
				tsl11,
				tsm11,
				tsl12,
				tsm12,
				tsl13,
				tsm13,
				tsl14,
				tsm14,
				tsl15,
				tsm15,
				tsl16,
				tsm16,
				kslvt,
				ksmvt,
				ksl01,
				ksm01,
				ksl02,
				ksm02,
				ksl03,
				ksm03,
				ksl04,
				ksm04,
				ksl05,
				ksm05,
				ksl06,
				ksm06,
				ksl07,
				ksm07,
				ksl08,
				ksm08,
				ksl09,
				ksm09,
				ksl10,
				ksm10,
				ksl11,
				ksm11,
				ksl12,
				ksm12,
				ksl13,
				ksm13,
				ksl14,
				ksm14,
				ksl15,
				ksm15,
				ksl16,
				ksm16,
				oslvt,
				osmvt,
				osl01,
				osm01,
				osl02,
				osm02,
				osl03,
				osm03,
				osl04,
				osm04,
				osl05,
				osm05,
				osl06,
				osm06,
				osl07,
				osm07,
				osl08,
				osm08,
				osl09,
				osm09,
				osl10,
				osm10,
				osl11,
				osm11,
				osl12,
				osm12,
				osl13,
				osm13,
				osl14,
				osm14,
				osl15,
				osm15,
				osl16,
				osm16)
	)
)

select * 
from final