with vw_purchasing_document_header as (
    select *
    from {{ ref('vw_purchasing_document_header') }}

), vw_purchasing_document_category as (
    select *
    from {{ ref('vw_purchasing_document_category') }}

), vw_purchasing_document_type as (
    select *
    from {{ ref('vw_purchasing_document_type') }}

), vw_purchasing_group as (
    select *
    from {{ ref('vw_purchasing_group') }}

), vw_purchasing_document_status as (
    select *
    from {{ ref('vw_purchasing_document_status') }}

), final as (
    select
        vw_purchasing_document_header.purchasing_document_id,
        vw_purchasing_document_header.purchasing_document_category,
        vw_purchasing_document_category.purchasing_document_category_txt,
        vw_purchasing_document_header.purchasing_document_type_id,
        vw_purchasing_document_type.doc_type_descript as purchasing_document_type_text,
        vw_purchasing_document_header.purchasing_group_id,
        vw_purchasing_group.description_purchasing_group,
        vw_purchasing_document_header.status_purchasing_document as purchasing_document_status,
        vw_purchasing_document_status.purchasing_document_status_txt,
        vw_purchasing_document_header.payment_terms,
        vw_purchasing_document_header.reason_cancellation_id,
        vw_purchasing_document_header.company_code_id
    from vw_purchasing_document_header
    left outer join vw_purchasing_document_category
        on vw_purchasing_document_header.purchasing_document_category = vw_purchasing_document_category.purchasing_document_category_id  
    left outer join vw_purchasing_document_type
        on vw_purchasing_document_header.purchasing_document_type_id = vw_purchasing_document_type.purchasing_document_type_id 
        and vw_purchasing_document_type.purch_doc_category_id = vw_purchasing_document_header.purchasing_document_category 
    left outer join vw_purchasing_group
        on vw_purchasing_group.purchasing_group_id = vw_purchasing_document_header.purchasing_group_id 
    left outer join vw_purchasing_document_status
        on vw_purchasing_document_status.purchasing_document_status_id = vw_purchasing_document_header.status_purchasing_document
)

select *
from final