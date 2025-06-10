  Select 
    dd07l.DOMVALUE_L as Purchasing_Document_Category_id, 
    dd07t.DDTEXT as Purchasing_Document_Category_txt , 
    dd07l.hvr_change_time as hvr_change_time 
  from {{ ref('stg_sap__dd07l') }}
  left join {{ ref('stg_sap__dd07t') }} on
  dd07l.DOMNAME = dd07t.DOMNAME
  and dd07l.DOMVALUE_L = dd07t.DOMVALUE_L
  and dd07l.AS4VERS = dd07t.AS4VERS
  and dd07t.DDLANGUAGE in ('E')
  where 
  dd07l.DOMNAME = 'BSTYP' 
  and dd07l.AS4VERS = '0000'