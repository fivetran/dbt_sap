with vw_purchasing_document_item as (
    select *
    from {{ ref('vw_purchasing_document_item') }}

), vw_purchasing_document_header as (
    select *
    from {{ ref('vw_purchasing_document_header') }}

), vw_company as (
    select *
    from {{ ref('vw_company') }}

), vw_purchasing_document_overview as (
    select *
    from {{ ref('vw_purchasing_document_overview') }}

), vw_purchasing_document_schedule_total as (
    select *
    from {{ ref('vw_purchasing_document_schedule_total') }}

), final as (
    select
        vw_purchasing_document_item.purchasing_document_id,
        vw_purchasing_document_item.purchasing_document_item_id,
        vw_purchasing_document_header.company_code_id,
        vw_company.currency_id,
        vw_purchasing_document_item.material_id,
        vw_purchasing_document_item.plant_id,
        vw_purchasing_document_header.purchasing_group_id,
        vw_purchasing_document_header.purchasing_organization_id,
        vw_purchasing_document_header.vendor_id,
        vw_purchasing_document_item.order_uom_id,
        vw_purchasing_document_header.purchasing_document_date,
        vw_purchasing_document_schedule_total.lastest_scheduled_delivery_date as scheduled_delivery_date,
        cast((vw_purchasing_document_overview.latest_goods_receive_date - vw_purchasing_document_header.purchasing_document_date) as {{ dbt.type_numeric() }}) as purchase_deliver_late_days,
        cast((vw_purchasing_document_overview.latest_goods_receive_date - vw_purchasing_document_schedule_total.lastest_scheduled_delivery_date) as {{ dbt.type_numeric() }}) as purchase_late_lead_days,

        case 
        when vw_purchasing_document_item.returns_item = ''
            then vw_purchasing_document_item.purchase_order_quantity
        else -1 * vw_purchasing_document_item.purchase_order_quantity
        end as purchase_order_quantity,

        case 
        when vw_purchasing_document_item.delivery_completed <> ''
            then cast(0 as {{ dbt.type_numeric() }})
        else (vw_purchasing_document_item.purchase_order_quantity - coalesce(vw_purchasing_document_overview.received_quantity, 0))
        end as purchase_open_quantity,

        vw_purchasing_document_overview.received_quantity as purchasing_delivered_quantity,

        case 
        when vw_purchasing_document_overview.latest_goods_receive_date > vw_purchasing_document_schedule_total.lastest_scheduled_delivery_date
            then vw_purchasing_document_overview.received_quantity
        else cast(0 as {{ dbt.type_numeric() }})
        end as purchase_late_quantity,

        case 
        when vw_purchasing_document_item.rejection_indicator = 'x'
            then vw_purchasing_document_item.purchase_order_quantity
        else cast(0 as {{ dbt.type_numeric() }})
        end as cancel_purchase_quantity,

        cast(
        vw_purchasing_document_item.net_order_po_currency_val *
        case 
            when vw_purchasing_document_header.exchange_rate < 0
            then -1 / vw_purchasing_document_header.exchange_rate
            else vw_purchasing_document_header.exchange_rate
        end as {{ dbt.type_numeric() }}
        ) as purchase_order_amount,

        vw_purchasing_document_item.net_order_po_currency_val as purchasing_document_currency_amount,
        vw_purchasing_document_header.currency_id as document_currency_id,

        case 
        when vw_purchasing_document_overview.delivery_completed is not null
            then cast(0 as {{ dbt.type_numeric() }})
        else (
            vw_purchasing_document_item.net_order_po_currency_val * 
            (
            case 
                when vw_purchasing_document_header.exchange_rate < 0
                then -1 / vw_purchasing_document_header.exchange_rate
                else vw_purchasing_document_header.exchange_rate
            end
            )
        ) - vw_purchasing_document_overview.received_value_in_local_curr
        end as purchase_open_amount,

        vw_purchasing_document_overview.received_value_in_local_curr as purchase_delivered_amount,

        case 
        when vw_purchasing_document_item.rejection_indicator = 'x'
            then cast(
            vw_purchasing_document_item.net_order_po_currency_val *
            case 
                when vw_purchasing_document_header.exchange_rate < 0
                then -1 / vw_purchasing_document_header.exchange_rate
                else vw_purchasing_document_header.exchange_rate
            end as {{ dbt.type_numeric() }}
            )
        else cast(0 as {{ dbt.type_numeric() }})
        end as cancel_purchase_amount,

        case 
        when vw_purchasing_document_overview.latest_goods_receive_date > vw_purchasing_document_schedule_total.lastest_scheduled_delivery_date
            then vw_purchasing_document_overview.received_value_in_local_curr
        else cast(0 as {{ dbt.type_numeric() }})
        end as purchase_late_amount,

        vw_purchasing_document_overview.invoice_value_local_curr as purchase_invoiced_amount,

        cast(1 as {{ dbt.type_numeric() }}) as purchase_order_item_count,

        case 
        when vw_purchasing_document_overview.latest_goods_receive_date > vw_purchasing_document_schedule_total.lastest_scheduled_delivery_date
            then cast(1 as {{ dbt.type_numeric() }})
        else cast(0 as {{ dbt.type_numeric() }})
        end as purchase_item_late_count,

        case 
        when coalesce(vw_purchasing_document_overview.delivery_completed, 'n') <> ' '
            and coalesce(vw_purchasing_document_overview.received_quantity, 0) < vw_purchasing_document_item.purchase_order_quantity
            then cast(1 as {{ dbt.type_numeric() }})
        else cast(0 as {{ dbt.type_numeric() }})
        end as purchase_item_open_count,

        case 
        when coalesce(vw_purchasing_document_overview.delivery_completed, 'n') <> ' '
            or vw_purchasing_document_overview.received_quantity >= vw_purchasing_document_item.purchase_order_quantity
            then cast(1 as {{ dbt.type_numeric() }})
        else cast(0 as {{ dbt.type_numeric() }})
        end as purchase_item_closed_count
    from vw_purchasing_document_item
    left outer join vw_purchasing_document_header
        on vw_purchasing_document_header.purchasing_document_id = vw_purchasing_document_item.purchasing_document_id
    left outer join vw_company
        on vw_company.company_code_id = vw_purchasing_document_header.company_code_id
    left outer join vw_purchasing_document_overview
        on vw_purchasing_document_overview.purchasing_document_id = vw_purchasing_document_item.purchasing_document_id
        and vw_purchasing_document_overview.purchasing_document_item_id = vw_purchasing_document_item.purchasing_document_item_id
    left outer join vw_purchasing_document_schedule_total
        on vw_purchasing_document_schedule_total.purchasing_document_id = vw_purchasing_document_item.purchasing_document_id
        and vw_purchasing_document_schedule_total.purchasing_document_item_id = vw_purchasing_document_item.purchasing_document_item_id
)

select *
from final