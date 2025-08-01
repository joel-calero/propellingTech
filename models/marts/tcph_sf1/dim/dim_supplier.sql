with suppliers as (
    select * from {{ ref('int_part_suppliers') }}
)

select 
    name,
    part_name,
    round(avg(supplier_cost), 2) as avg_supplier_cost,
    country,
    region
from suppliers
group by name, part_name, country, region
order by name, part_name, avg_supplier_cost
