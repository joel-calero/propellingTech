with orders as (
    select * from {{ ref('int_orders_lineitems') }}
)

select 
    part_id,
    part_name,
    supplier_name,
    round(avg(quantity), 2) as avg_quantity,
    round(avg(line_total), 2) as avg_line_total,
    round(avg(margin), 2) as avg_margin,
from orders
group by part_id, part_name, supplier_name
order by part_name, avg_margin
