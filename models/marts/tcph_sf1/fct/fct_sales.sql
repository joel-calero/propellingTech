with sales as (
    select *
    from {{ ref('int_orders_lineitems') }}
)

select
    order_id,
    customer_id,
    customer_name,
    order_date,
    part_id,
    part_name,
    supplier_name,
    country,
    region,
    quantity,
    discount,
    line_total as revenue,
    margin,
    to_char(order_date, 'YYYY') as order_year,
    to_char(order_date, 'MM') as order_month,
from sales