{% set employee_models = ['pa0000', 'pa0001', 'pa0007', 'pa0008', 'pa0031'] %}

with
{% for employee_model in employee_models %}
    {{ employee_model }}_beg as (
        select
            pernr,
            begda as date_change
        from {{ var(employee_model) }}
    ),

    {{ employee_model }}_end as (
        select
            pernr,
			case when endda = '99991231' then endda
				else
				--convert date strings to dates to avoid null records when joining on date ranges in the end model
				{% if target.type in ('redshift', 'snowflake', 'snowflake-sap') %}
				to_char(dateadd(day, 1, to_date(endda, 'YYYYMMDD')), 'YYYYMMDD') end as date_change
				{% elif target.type == 'postgres' %}
				to_char(to_date(endda, 'YYYYMMDD') + interval '1 day', 'YYYYMMDD') end as date_change
				{% elif target.type == 'bigquery' %}
				format_date('%Y%m%d', date_add(parse_date('%Y%m%d', endda), interval 1 day)) end as date_change
				{% elif target.type == 'databricks' %}
				date_format(date_add(to_date(endda, 'yyyyMMdd'), 1), 'yyyyMMdd') end as date_change
				{% endif %}
		from {{ var(employee_model) }}
	), 
{% endfor %}

unioned_dates as (

	{% for employee_model in employee_models %}
	select 
		pernr,
		date_change 
	from {{ employee_model }}_beg
	{{ dbt_utils.group_by(2) }}

	union 

	select 
		pernr,
		date_change 
	from {{ employee_model }}_end
	{{ dbt_utils.group_by(2) }}

	{% if not loop.last %}
    union
	{% endif %} 
	
	{% endfor %}
	order by pernr, date_change
),

employee_date_ranges as (

	select 
		pernr,
		date_change as begda,
		lead(date_change, 1) over (partition by pernr order by date_change) as endda      
	from unioned_dates			
),

employee_original_date_ranges as (

	select
		pernr,
		begda,
		case when endda = '99991231' then endda
			else
				--convert date strings to dates to avoid null records when joining on date ranges in the end model
				{% if target.type in ('redshift', 'snowflake', 'snowflake-sap') %}
				to_char(dateadd(day, -1, to_date(endda, 'YYYYMMDD')), 'YYYYMMDD') end as endda
				{% elif target.type == 'postgres' %}
				to_char(to_date(endda, 'YYYYMMDD') - interval '1 day', 'YYYYMMDD') end as date_change
				{% elif target.type == 'bigquery' %}
				format_date('%Y%m%d', date_sub(parse_date('%Y%m%d', endda), interval 1 day)) end as endda
				{% elif target.type == 'databricks' %}
				date_format(date_sub(to_date(endda, 'yyyyMMdd'), 1), 'yyyyMMdd') end as endda
				{% endif %}
	from employee_date_ranges
)

select * 
from employee_original_date_ranges