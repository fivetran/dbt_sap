  select 
    dd07l.domvalue_l as document_status_id, 
    dd07t.ddtext as document_status_txt , 
    dd07l.hvr_change_time as hvr_change_time 
  from {{ ref('stg_sap__dd07l') }}
  left join {{ ref('stg_sap__dd07t') }} on
  dd07l.domname = dd07t.domname
  and dd07l.domvalue_l = dd07t.domvalue_l
  and dd07l.as4vers = dd07t.as4vers
  and dd07t.ddlanguage in ('e')
  where 
  dd07l.domname = 'statv' 
  and dd07l.as4vers = '0000'
