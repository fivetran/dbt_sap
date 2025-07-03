{{ config(enabled=var('sap_using_eket', True)) }}

select
    purchasing_document_id, 
    purchasing_document_item_id, 
    max(item_delivery_date) as lastest_scheduled_delivery_date,
    sum(scheduled_quantity) as total_scheduled_delivery_quantity
from {{ ref('int_sap__purchasing_document_schedule_line') }}
group by 1,2