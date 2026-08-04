-- Soft-deleted MATDOC_EXTRACT rows must be excluded from staging: left in, they skew
-- downstream stock quantity aggregations (e.g. mchb.clabs, marc.umlmc/trame/etc.) negative
-- once the source system removes them. Fails if any leak through.
select *
from {{ ref('stg_sap__matdoc_extract') }}
where _fivetran_deleted
