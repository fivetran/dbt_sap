with dd07l as (
    select *
    from {{ ref('stg_sap__dd07l') }}

), dd07t as (
    select *
    from {{ ref('stg_sap__dd07t') }}

), final as (
    select 
        dd07l.domvalue_l as purchasing_document_category_id,
        dd07t.ddtext as purchasing_document_category_txt,
        dd07l.hvr_change_time as hvr_change_time
    from dd07l
    left join dd07t
        on dd07l.domname = dd07t.domname
        and dd07l.domvalue_l = dd07t.domvalue_l
        and dd07l.as4vers = dd07t.as4vers
        and dd07t.ddlanguage in ('e')
    where dd07l.domname = 'bstyp'
        and dd07l.as4vers = '0000'
)

select *
from final