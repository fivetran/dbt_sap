{% set using_purchasing_document_header = var('sap_using_ekko', True) %}
{% set using_purchasing_document_category = var('sap_using_dd07l', True) %}
{% set using_purchasing_document_type = var('sap_using_t161', True) %}
{% set using_purchasing_group = var('sap_using_t024', True) %}
{% set using_purchasing_document_status = var('sap_using_dd07l', True) %}

{{ config(enabled=using_purchasing_document_header) }}

with purchasing_document_header as (
    select *
    from {{ ref('int_sap__purchasing_document_header') }}
)

{% if using_purchasing_document_category %}
, purchasing_document_category as (
    select *
    from {{ ref('int_sap__purchasing_document_category') }}
)
{% endif %}

{% if using_purchasing_document_type %}
, purchasing_document_type as (
    select *
    from {{ ref('int_sap__purchasing_document_type') }}
)
{% endif %}

{% if using_purchasing_group %}
, purchasing_group as (
    select *
    from {{ ref('int_sap__purchasing_group') }}
)
{% endif %}

{% if using_purchasing_document_status %}
, purchasing_document_status as (
    select *
    from {{ ref('int_sap__purchasing_document_status') }}
)
{% endif %}

, final as (
    select
        purchasing_document_header.purchasing_document_id,
        purchasing_document_header.purchasing_document_category,
        purchasing_document_header.purchasing_document_type_id,
        purchasing_document_header.purchasing_group_id,
        purchasing_document_header.status_purchasing_document as purchasing_document_status,
        purchasing_document_header.payment_terms,
        purchasing_document_header.reason_cancellation_id,
        purchasing_document_header.company_code_id

        {% if using_purchasing_document_category %}
        , purchasing_document_category.purchasing_document_category_txt
        {% endif %}

        {% if using_purchasing_document_type %}
        , purchasing_document_type.doc_type_descript as purchasing_document_type_text
        {% endif %}

        {% if using_purchasing_group %}
        , purchasing_group.description_purchasing_group
        {% endif %}

        {% if using_purchasing_document_status %}
        , purchasing_document_status.document_status_txt as purchasing_document_status_txt
        {% endif %}

    from purchasing_document_header

    {% if using_purchasing_document_category %}
    left join purchasing_document_category
        on purchasing_document_header.purchasing_document_category = purchasing_document_category.purchasing_document_category_id  
    {% endif %}

    {% if using_purchasing_document_type %}
    left join purchasing_document_type
        on purchasing_document_header.purchasing_document_type_id = purchasing_document_type.purchasing_document_type_id 
        and purchasing_document_type.purch_doc_category_id = purchasing_document_header.purchasing_document_category 
    {% endif %}

    {% if using_purchasing_group %}
    left join purchasing_group
        on purchasing_group.purchasing_group_id = purchasing_document_header.purchasing_group_id 
    {% endif %}

    {% if using_purchasing_document_status %}
    left join purchasing_document_status
        on purchasing_document_status.document_status_id = purchasing_document_header.status_purchasing_document
    {% endif %}
)

select *
from final