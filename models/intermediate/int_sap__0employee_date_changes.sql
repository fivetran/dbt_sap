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
            endda as date_change
        from {{ var(employee_model) }}
    ) , 
{% endfor %}

unioned_dates as (

	{% for employee_model in employee_models %}
	select * 
	from {{ employee_model }}_beg

	union 

	select * 
	from {{ employee_model }}_end

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
)

select * 
from employee_date_ranges