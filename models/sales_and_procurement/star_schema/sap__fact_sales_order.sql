select 		
	ltrim(t1.sales_document_id , '0') 	as	sales_document_number
,	ltrim(t2.sales_document_item_id  , '0')     as	sales_document_item
,	t1.sd_document_category 
,	t1.sales_document_type_id 
,	t1.order_reason_id 
,	t1.delivery_block_document_header_id 	as	delivery_block_id
,	t1.sales_organization_id 
,	t1.distribution_channel_id 
,	t1.division_id 
,	t2.plant_own_or_external_id as plant_id
, t1.document_date 
, t1.requested_delivery_date 
,	t1.sold_to_party_id as sold_to_customer_id
,	t1.sales_document_id 
,	t2.material_id 
,	t2.material_group_id 
,	t2.sales_document_item_category_id 
,	t2.product_hierarchy_id 
,	t2.base_uom_id 
-- ,	vbap.kwmeng	as	orderquantitysalesunits
,	case when t1.sd_document_category  = 'c' then 
        t2.order_quantity  
        else
        t2.order_quantity  * -1
    end  as order_quantity
,	t2.sales_uom_id 
-- ,	vbap.netwr	as	netvalue
,	case when t1.sd_document_category  = 'c' then 
        t2.net_val 	
        else
        t2.net_val  * -1
    end  as net_value
,	t2.net_price_val 	as	net_price
,	t2.sd_document_currency_id 
,	t2.gross_weight_the_item as	gross_weight
,	t2.weight_uom_id 
,	t1.created_date 
,	t2.returns_item 
,   t2.reason_rejection_id 
,	t3.delivery_status 
,	t3.overall_status 
,	t4.delivery_status as item_delivery_status
, t1.created_by 
, t2._fivetran_deleted
, t2._fivetran_synced 
from {{ ref('vw_sales_document_header') }}  t1
inner join {{ ref('vw_sales_document_item') }}  t2
on t1.sales_document_id = t2.sales_document_id 
inner join {{ ref('vw_sales_document_header_status') }}  t3
on t1.sales_document_id = t3.sales_document_id 
inner join {{ ref('vw_sales_document_item_status') }}  t4
on t2.sales_document_id = t4.sales_document_id 
and t2.sales_document_item_id = t4.sd_item_id  
and t1.sd_document_category  in ('c', 'h')  -- c = orders h returns;
