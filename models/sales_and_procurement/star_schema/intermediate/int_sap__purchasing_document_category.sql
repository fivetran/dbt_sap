{{ config(enabled=var('sap_using_dd07l', True)) }}

with dd07l as (
    select *
    from {{ ref('stg_sap__dd07l') }}

{% set using_dd07t = var('sap_using_dd07t', True) %}
{% if using_dd07t %}
), dd07t as (
    select *
    from {{ ref('stg_sap__dd07t') }}
{% endif %}

), final as (
    select 
        dd07l.domvalue_l as purchasing_document_category_id,
        dd07l.hvr_change_time as hvr_change_time,
        {{ 'dd07t.ddtext' if using_dd07t else 'cast(null as {{ dbt.type_string() }})' }} as purchasing_document_category_txt
    from dd07l

    {% if using_dd07t %}
    left join dd07t
        on dd07l.domname = dd07t.domname
        and dd07l.domvalue_l = dd07t.domvalue_l
        and dd07l.as4vers = dd07t.as4vers
        and dd07t.ddlanguage in ('e')
    {% endif %}

    where dd07l.domname = 'bstyp'
        and dd07l.as4vers = '0000'
)

select *
from final