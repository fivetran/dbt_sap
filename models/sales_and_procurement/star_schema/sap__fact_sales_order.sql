{{ config(enabled=(var('sap_using_vbak', True) and var('sap_using_vbap', True) and var('sap_using_vbuk', True) and var('sap_using_vbup', True))) }}

with sales_document_header as (
    select *
    from {{ ref('int_sap__sales_document_header') }}

), sales_document_item as (
    select *
    from {{ ref('int_sap__sales_document_item') }}

), sales_document_header_status as (
    select *
    from {{ ref('int_sap__sales_document_header_status') }}

), sales_document_item_status as (
    select *
    from {{ ref('int_sap__sales_document_item_status') }}

), final as (
    select
        ltrim(sales_document_header.sales_document_id, '0') as sales_document_number,
        ltrim(sales_document_item.sales_document_item_id, '0') as sales_document_item,
        sales_document_header.sd_document_category,
        sales_document_header.sales_document_type_id,
        sales_document_header.order_reason_id,
        sales_document_header.delivery_block_document_header_id as delivery_block_id,
        sales_document_header.sales_organization_id,
        sales_document_header.distribution_channel_id,
        sales_document_header.division_id,
        sales_document_item.plant_own_or_external_id as plant_id,
        sales_document_header.document_date,
        sales_document_header.requested_delivery_date,
        sales_document_header.sold_to_party_id as sold_to_customer_id,
        sales_document_header.sales_document_id,
        sales_document_item.material_id,
        sales_document_item.material_group_id,
        sales_document_item.sales_document_item_category_id,
        sales_document_item.product_hierarchy_id,
        sales_document_item.base_uom_id,
        case 
        when sales_document_header.sd_document_category = 'c' then sales_document_item.order_quantity
        else sales_document_item.order_quantity * -1
        end as order_quantity,
        sales_document_item.sales_uom_id,
        case 
        when sales_document_header.sd_document_category = 'c' then sales_document_item.net_val
        else sales_document_item.net_val * -1
        end as net_value,
        sales_document_item.net_price_val as net_price,
        sales_document_item.sd_document_currency_id,
        sales_document_item.gross_weight_the_item as gross_weight,
        sales_document_item.weight_uom_id,
        sales_document_header.created_date,
        sales_document_item.returns_item,
        sales_document_item.reason_rejection_id,
        sales_document_header_status.delivery_status,
        sales_document_header_status.overall_status,
        sales_document_item_status.delivery_status as item_delivery_status,
        sales_document_header.created_by,
        sales_document_item._fivetran_deleted,
        sales_document_item._fivetran_synced
    from sales_document_header
    inner join sales_document_item
        on sales_document_header.sales_document_id = sales_document_item.sales_document_id
    inner join sales_document_header_status
        on sales_document_header.sales_document_id = sales_document_header_status.sales_document_id
    inner join sales_document_item_status
        on sales_document_item.sales_document_id = sales_document_item_status.sales_document_id
        and sales_document_item.sales_document_item_id = sales_document_item_status.sd_item_id
    where sales_document_header.sd_document_category in ('c', 'h')
)

select *
from final