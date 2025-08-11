select	
*
from	
{{ ref('stg_sap__matdoc') }} matdoc	
where	
( matdoc.record_type = 'MDOC'	
and matdoc.header_counter = 1 )