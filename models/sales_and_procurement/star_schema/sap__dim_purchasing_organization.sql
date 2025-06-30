select
  t1.purchasing_document_id ,
  t1.purchasing_document_category ,
  t2.purchasing_document_category_txt, 
  t1.purchasing_document_type_id, 
  t3.doc_type_descript purchasing_document_type_text,
  t1.purchasing_group_id ,
  t4.description_purchasing_group ,
  t1.status_purchasing_document as purchasing_document_status,
  t5.purchasing_document_status_txt, 
  t1.payment_terms ,
  t1.reason_cancellation_id ,
  t1.company_code_id 
from {{ ref('vw_purchasing_document_header') }} t1
left outer join {{ ref('vw_purchasing_document_category') }} t2 on
  t1.purchasing_document_category = t2.purchasing_document_category_id  
left outer join {{ ref('vw_purchasing_document_type') }} t3 on
 t1.purchasing_document_type_id = t3.purchasing_document_type_id 
  and t3.purch_doc_category_id  = t1.purchasing_document_category 
left outer join {{ ref('vw_purchasing_group') }} t4 on
 t4.purchasing_group_id  = t1.purchasing_group_id 
left outer join {{ ref('vw_purchasing_document_status') }} t5 on
 t5.purchasing_document_status_id  = t1.status_purchasing_document
