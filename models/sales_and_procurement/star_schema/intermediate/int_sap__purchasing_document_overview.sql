{{ config(enabled=var('sap_using_ekbe', True)) }}

select
    purchasing_document_id,
    purchasing_document_item_id,
    max(delivery_completed) delivery_completed,
    max(case when trans_event_type_id = '1' then posting_in_the_document_date else null end) as latest_goods_receive_date,
    max(case when trans_event_type_id = '2' then posting_in_the_document_date else null end) as latest_invoice_receive_date,
    sum(case when trans_event_type_id = '1' then case when debitcredit_indicator = 'h' then -1*qty else qty end else null end) as received_quantity,
    sum(case when trans_event_type_id = '1' then case when debitcredit_indicator = 'h' then -1*loccur_amount else loccur_amount end else null end) as received_value_in_local_curr,
    sum(case when trans_event_type_id = '1' then case when debitcredit_indicator = 'h' then -1*amount_document_currency_val else amount_document_currency_val end else null end) as received_value_in_doc_curr,
    sum(case when trans_event_type_id = '2' then case when debitcredit_indicator = 'h' then -1*qty else qty end else null end) as invoice_quantity, 
    sum(case when trans_event_type_id = '2' then case when debitcredit_indicator = 'h' then -1*voice_val else voice_val end else null end) as invoice_value_local_curr,
    sum(case when trans_event_type_id = '2' then case when debitcredit_indicator = 'h' then -1*voice_fc_val else voice_fc_val end else null end) as invoice_value_foreign_curr,
    max(hvr_change_time) hvr_change_time,
    max(hvr_is_deleted) hvr_is_deleted 
from {{ ref('int_sap__purchasing_document_history') }}
group by 1,2