with purchasing_document_header as (
    select *
    from {{ ref('int_sap__purchasing_document_header') }}

), purchasing_document_category as (
    select *
    from {{ ref('int_sap__purchasing_document_category') }}

), purchasing_document_type as (
    select *
    from {{ ref('int_sap__purchasing_document_type') }}

), purchasing_group as (
    select *
    from {{ ref('int_sap__purchasing_group') }}

), purchasing_document_status as (
    select *
    from {{ ref('int_sap__purchasing_document_status') }}

), final as (
    select
        purchasing_document_header.purchasing_document_id,
        purchasing_document_header.purchasing_document_category,
        purchasing_document_category.purchasing_document_category_txt,
        purchasing_document_header.purchasing_document_type_id,
        purchasing_document_type.doc_type_descript as purchasing_document_type_text,
        purchasing_document_header.purchasing_group_id,
        purchasing_group.description_purchasing_group,
        purchasing_document_header.status_purchasing_document as purchasing_document_status,
        purchasing_document_status.document_status_txt as purchasing_document_status_txt,
        purchasing_document_header.payment_terms,
        purchasing_document_header.reason_cancellation_id,
        purchasing_document_header.company_code_id
    from purchasing_document_header
    left outer join purchasing_document_category
        on purchasing_document_header.purchasing_document_category = purchasing_document_category.purchasing_document_category_id  
    left outer join purchasing_document_type
        on purchasing_document_header.purchasing_document_type_id = purchasing_document_type.purchasing_document_type_id 
        and purchasing_document_type.purch_doc_category_id = purchasing_document_header.purchasing_document_category 
    left outer join purchasing_group
        on purchasing_group.purchasing_group_id = purchasing_document_header.purchasing_group_id 
    left outer join purchasing_document_status
        on purchasing_document_status.document_status_id = purchasing_document_header.status_purchasing_document
)

select *
from final