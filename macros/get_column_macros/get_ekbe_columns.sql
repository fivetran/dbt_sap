{% macro get_ekbe_columns() %}

{% set columns = [
    {"name": "arewb", "datatype": dbt.type_string()},
    {"name": "arewr", "datatype": dbt.type_string()},
    {"name": "arewr_pop", "datatype": dbt.type_string()},
    {"name": "areww", "datatype": dbt.type_string()},
    {"name": "bamng", "datatype": dbt.type_string()},
    {"name": "bekkn", "datatype": dbt.type_string()},
    {"name": "belnr", "datatype": dbt.type_string()},
    {"name": "bewtp", "datatype": dbt.type_string()},
    {"name": "bldat", "datatype": dbt.type_string()},
    {"name": "bpmng", "datatype": dbt.type_string()},
    {"name": "bpmng_pop", "datatype": dbt.type_string()},
    {"name": "bpweb", "datatype": dbt.type_string()},
    {"name": "bpwes", "datatype": dbt.type_string()},
    {"name": "budat", "datatype": dbt.type_string()},
    {"name": "buzei", "datatype": dbt.type_string()},
    {"name": "bwart", "datatype": dbt.type_string()},
    {"name": "bwtar", "datatype": dbt.type_string()},
    {"name": "charg", "datatype": dbt.type_string()},
    {"name": "cpudt", "datatype": dbt.type_string()},
    {"name": "cputm", "datatype": dbt.type_string()},
    {"name": "dmbtr", "datatype": dbt.type_string()},
    {"name": "dmbtr_pop", "datatype": dbt.type_string()},
    {"name": "ebeln", "datatype": dbt.type_string()},
    {"name": "ebelp", "datatype": dbt.type_string()},
    {"name": "elikz", "datatype": dbt.type_string()},
    {"name": "ematn", "datatype": dbt.type_string()},
    {"name": "ernam", "datatype": dbt.type_string()},
    {"name": "et_upd", "datatype": dbt.type_string()},
    {"name": "etens", "datatype": dbt.type_string()},
    {"name": "evere", "datatype": dbt.type_string()},
    {"name": "fsh_collection", "datatype": dbt.type_string()},
    {"name": "fsh_season", "datatype": dbt.type_string()},
    {"name": "fsh_season_year", "datatype": dbt.type_string()},
    {"name": "fsh_theme", "datatype": dbt.type_string()},
    {"name": "gjahr", "datatype": dbt.type_string()},
    {"name": "grund", "datatype": dbt.type_string()},
    {"name": "hswae", "datatype": dbt.type_string()},
    {"name": "hvr_change_time", "datatype": dbt.type_string()},
    {"name": "hvr_is_deleted", "datatype": dbt.type_int()},
    {"name": "introw", "datatype": dbt.type_string()},
    {"name": "inv_item_origin", "datatype": dbt.type_string()},
    {"name": "j_sc_die_comp_f", "datatype": dbt.type_string()},
    {"name": "knumv", "datatype": dbt.type_string()},
    {"name": "kudif", "datatype": dbt.type_string()},
    {"name": "lemin", "datatype": dbt.type_string()},
    {"name": "lfbnr", "datatype": dbt.type_string()},
    {"name": "lfgja", "datatype": dbt.type_string()},
    {"name": "lfpos", "datatype": dbt.type_string()},
    {"name": "lsmeh", "datatype": dbt.type_string()},
    {"name": "lsmng", "datatype": dbt.type_string()},
    {"name": "mandt", "datatype": dbt.type_string()},
    {"name": "matnr", "datatype": dbt.type_string()},
    {"name": "menge", "datatype": dbt.type_int()},
    {"name": "menge_pop", "datatype": dbt.type_string()},
    {"name": "mwskz", "datatype": dbt.type_string()},
    {"name": "packno", "datatype": dbt.type_string()},
    {"name": "reewr", "datatype": dbt.type_string()},
    {"name": "refwr", "datatype": dbt.type_string()},
    {"name": "retamt_fc", "datatype": dbt.type_string()},
    {"name": "retamt_lc", "datatype": dbt.type_string()},
    {"name": "retamtp_fc", "datatype": dbt.type_string()},
    {"name": "retamtp_lc", "datatype": dbt.type_string()},
    {"name": "rewrb", "datatype": dbt.type_string()},
    {"name": "saprl", "datatype": dbt.type_string()},
    {"name": "sgt_scat", "datatype": dbt.type_string()},
    {"name": "shkzg", "datatype": dbt.type_string()},
    {"name": "srvpos", "datatype": dbt.type_string()},
    {"name": "vbeln_st", "datatype": dbt.type_string()},
    {"name": "vbelp_st", "datatype": dbt.type_string()},
    {"name": "vgabe", "datatype": dbt.type_string()},
    {"name": "waers", "datatype": dbt.type_string()},
    {"name": "weora", "datatype": dbt.type_string()},
    {"name": "werks", "datatype": dbt.type_string()},
    {"name": "wesbb", "datatype": dbt.type_string()},
    {"name": "wesbs", "datatype": dbt.type_string()},
    {"name": "wkurs", "datatype": dbt.type_string()},
    {"name": "wrbtr", "datatype": dbt.type_string()},
    {"name": "wrbtr_pop", "datatype": dbt.type_string()},
    {"name": "wrf_charstc1", "datatype": dbt.type_string()},
    {"name": "wrf_charstc2", "datatype": dbt.type_string()},
    {"name": "wrf_charstc3", "datatype": dbt.type_string()},
    {"name": "xblnr", "datatype": dbt.type_string()},
    {"name": "xmacc", "datatype": dbt.type_string()},
    {"name": "xunpl", "datatype": dbt.type_string()},
    {"name": "xwoff", "datatype": dbt.type_string()},
    {"name": "xwsbr", "datatype": dbt.type_string()},
    {"name": "zekkn", "datatype": dbt.type_string()},
    {"name": "_fivetran_deleted", "datatype": "boolean"},
    {"name": "_fivetran_synced", "datatype": dbt.type_timestamp()},
    {"name": "_fivetran_sap_archived", "datatype": dbt.type_string()}
] %}

{{ return(columns) }}

{% endmacro %}
