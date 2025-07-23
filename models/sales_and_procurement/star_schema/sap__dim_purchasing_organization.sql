{{ config(enabled=var('sap_using_t024e', true)) }}

select
	company_code_id,
    purchasing_organization_id,
    description
from {{ ref('int_sap__purchasing_organization') }}