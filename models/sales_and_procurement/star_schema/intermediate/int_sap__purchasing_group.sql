{{ config(enabled=var('sap_using_t024', True)) }}

select
    ekgrp as purchasing_group_id,
    mandt as client_id,
    tel_number as telephone,
    telfx as fax_number,
    ldest as spool_output_device_id,
    ektel as tel_no_purch_group,
    smtp_addr as e_mail_address,
    tel_extens as telephone_no_extension,
    eknam as description_purchasing_group,
    _fivetran_deleted as _fivetran_deleted,
    _fivetran_synced as _fivetran_synced,
    _fivetran_sap_archived as _fivetran_sap_archived
from {{ ref('stg_sap__t024') }}