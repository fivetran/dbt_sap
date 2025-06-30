with vw_sales_document_header as (
    select *
    from {{ ref('vw_sales_document_header') }}

), vw_sales_document_item as (
    select *
    from {{ ref('vw_sales_document_item') }}

), vw_sales_document_header_status as (
    select *
    from {{ ref('vw_sales_document_header_status') }}

), vw_sales_document_item_status as (
    select *
    from {{ ref('vw_sales_document_item_status') }}

), final as (
    select
        ltrim(vw_sales_document_header.sales_document_id, '0') as sales_document_number,
        ltrim(vw_sales_document_item.sales_document_item_id, '0') as sales_document_item,
        vw_sales_document_header.sd_document_category,
        vw_sales_document_header.sales_document_type_id,
        vw_sales_document_header.order_reason_id,
        vw_sales_document_header.delivery_block_document_header_id as delivery_block_id,
        vw_sales_document_header.sales_organization_id,
        vw_sales_document_header.distribution_channel_id,
        vw_sales_document_header.division_id,
        vw_sales_document_item.plant_own_or_external_id as plant_id,
        vw_sales_document_header.document_date,
        vw_sales_document_header.requested_delivery_date,
        vw_sales_document_header.sold_to_party_id as sold_to_customer_id,
        vw_sales_document_header.sales_document_id,
        vw_sales_document_item.material_id,
        vw_sales_document_item.material_group_id,
        vw_sales_document_item.sales_document_item_category_id,
        vw_sales_document_item.product_hierarchy_id,
        vw_sales_document_item.base_uom_id,
        case 
        when vw_sales_document_header.sd_document_category = 'c' then vw_sales_document_item.order_quantity
        else vw_sales_document_item.order_quantity * -1
        end as order_quantity,
        vw_sales_document_item.sales_uom_id,
        case 
        when vw_sales_document_header.sd_document_category = 'c' then vw_sales_document_item.net_val
        else vw_sales_document_item.net_val * -1
        end as net_value,
        vw_sales_document_item.net_price_val as net_price,
        vw_sales_document_item.sd_document_currency_id,
        vw_sales_document_item.gross_weight_the_item as gross_weight,
        vw_sales_document_item.weight_uom_id,
        vw_sales_document_header.created_date,
        vw_sales_document_item.returns_item,
        vw_sales_document_item.reason_rejection_id,
        vw_sales_document_header_status.delivery_status,
        vw_sales_document_header_status.overall_status,
        vw_sales_document_item_status.delivery_status as item_delivery_status,
        vw_sales_document_header.created_by,
        vw_sales_document_item._fivetran_deleted,
        vw_sales_document_item._fivetran_synced
    from vw_sales_document_header
    inner join vw_sales_document_item
        on vw_sales_document_header.sales_document_id = vw_sales_document_item.sales_document_id
    inner join vw_sales_document_header_status
        on vw_sales_document_header.sales_document_id = vw_sales_document_header_status.sales_document_id
    inner join vw_sales_document_item_status
        on vw_sales_document_item.sales_document_id = vw_sales_document_item_status.sales_document_id
        and vw_sales_document_item.sales_document_item_id = vw_sales_document_item_status.sd_item_id
    where vw_sales_document_header.sd_document_category in ('c', 'h')
)

select *
from final