select t1.purchasing_document_id
	,t1.purchasing_document_item_id
	,t2.company_code_id
	,t3.currency_id
	,t1.material_id
	,t1.plant_id
	,t2.purchasing_group_id
	,t2.purchasing_organization_id
	,t2.vendor_id
	,t1.order_uom_id
	,t2.purchasing_document_date
	,t5.lastest_scheduled_delivery_date as scheduled_delivery_date
	,cast((t4.latest_goods_receive_date - t2.purchasing_document_date) as {{ dbt.type_numeric() }}) as purchase_deliver_late_days
	,cast((t4.latest_goods_receive_date - t5.lastest_scheduled_delivery_date) as {{ dbt.type_numeric() }}) as purchase_late_lead_days
	,
	--  cast((t4.latest_goods_receive_date - t5.lastest_scheduled_delivery_date) as {{ dbt.type_numeric() }}) as purchase_late_orig_lead_days,
	case 
		when t1.returns_item = ''
			then t1.purchase_order_quantity
		else - 1 * t1.purchase_order_quantity
		end as purchase_order_quantity
	,case 
		when t1.delivery_completed <> ''
			then cast(0 as {{ dbt.type_numeric() }})
		else (t1.purchase_order_quantity - coalesce(t4.received_quantity,0))
		end as purchase_open_quantity
	,t4.received_quantity as purchasing_delivered_quantity
	,
	--  case
	--   when t4.latest_goods_receive_date > t1.original_latest_sched_del_date
	--    then t4.received_quantity
	--    else cast(0 as {{ dbt.type_numeric() }})
	--  end as purchase_orig_late_quantity,
	case 
		when t4.latest_goods_receive_date > t5.lastest_scheduled_delivery_date
			then t4.received_quantity
		else cast(0 as {{ dbt.type_numeric() }})
		end as purchase_late_quantity
	,case 
		when t1.rejection_indicator = 'x'
			then t1.purchase_order_quantity
		else cast(0 as {{ dbt.type_numeric() }})
		end as cancel_purchase_quantity
	,cast(t1.net_order_po_currency_val * case 
			when t2.exchange_rate < 0
				then - 1 / t2.exchange_rate
			else t2.exchange_rate
			end as {{ dbt.type_numeric() }}) as purchase_order_amount
	,t1.net_order_po_currency_val purchasing_document_currency_amount
	,t2.currency_id document_currency_id
	,case 
		when t4.delivery_completed is not null
			then cast(0 as {{ dbt.type_numeric() }})
		else (
				t1.net_order_po_currency_val  * (
					case 
						when t2.exchange_rate < 0
							then - 1 / t2.exchange_rate
						else t2.exchange_rate
						end
					)
				) - t4.received_value_in_local_curr
		end as purchase_open_amount
	,t4.received_value_in_local_curr as purchase_delivered_amount
	,case 
		when t1.rejection_indicator = 'x'
			then (
					cast(t1.net_order_po_currency_val * case 
							when t2.exchange_rate < 0
								then - 1 / t2.exchange_rate
							else t2.exchange_rate
							end as {{ dbt.type_numeric() }})
					)
		else cast(0 as {{ dbt.type_numeric() }})
		end as cancel_purchase_amount
	,case 
		when t4.latest_goods_receive_date > t5.lastest_scheduled_delivery_date
			then t4.received_value_in_local_curr
		else cast(0 as {{ dbt.type_numeric() }})
		end as purchase_late_amount
	,
	-- case
	--   when t4.latest_goods_receive_date > t1.original_latest_sched_del_date
	--   then t4.received_value_in_local_curr
	--   else cast(0 as {{ dbt.type_numeric() }})
	-- end as purchase_late_orig_amount,
	-- t4.received_value_in_local_curr - coalesce(cast((t1.net_value * t2.exchange_rate) as {{ dbt.type_numeric() }}), 0) as purch_invoice_variance_amount,
	t4.invoice_value_local_curr as purchase_invoiced_amount
	,cast(1 as {{ dbt.type_numeric() }}) as purchase_order_item_count
	,case 
		when t4.latest_goods_receive_date > t5.lastest_scheduled_delivery_date
			then cast(1 as {{ dbt.type_numeric() }})
		else cast(0 as {{ dbt.type_numeric() }})
		end purchase_item_late_count
	,
	-- case
	--  when t4.latest_goods_receive_date > t1.original_latest_sched_del_date 
	--  then cast(1 as {{ dbt.type_numeric() }})
	--  else cast(0 as {{ dbt.type_numeric() }})
	-- end as purchase_item_org_late_count,
	case 
		when coalesce(t4.delivery_completed, 'n') <> ' '
			and coalesce (t4.received_quantity,0) < t1.purchase_order_quantity
			then cast(1 as {{ dbt.type_numeric() }})
		else cast(0 as {{ dbt.type_numeric() }})
		end as purchase_item_open_count
	,case 
		when coalesce(t4.delivery_completed, 'n') <> ' '
			or t4.received_quantity >= t1.purchase_order_quantity
			then cast(1 as {{ dbt.type_numeric() }})
		else cast(0 as {{ dbt.type_numeric() }})
		end as purchase_item_closed_count
from {{ ref('vw_purchasing_document_item') }} t1
left outer join {{ ref('vw_purchasing_document_header') }} t2 on t2.purchasing_document_id = t1.purchasing_document_id
left outer join {{ ref('vw_company') }} t3 on t3.company_code_id = t2.company_code_id
left outer join {{ ref('vw_purchasing_document_overview') }} t4 on t4.purchasing_document_id = t1.purchasing_document_id
	and t4.purchasing_document_item_id = t1.purchasing_document_item_id
--where coalesce (t1.deletion_indicator) , '#') in ('#','s')
--  and coalesce (t2.hvr_is_deleted , 'y') <> 'x'
left outer join {{ ref('vw_purchasing_document_schedule_total') }} t5 on t1.purchasing_document_id = t5.purchasing_document_id
	and t1.purchasing_document_item_id = t5.purchasing_document_item_id
