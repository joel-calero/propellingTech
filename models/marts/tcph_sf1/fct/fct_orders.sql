with orders as (
    select *
    from {{ ref('int_orders_customers') }}
)

select
    order_id,
    customer_id,
    order_date,
    total_price as order_total,
    order_status,
    country,
    region,
    date_trunc('year', order_date) as order_year,
    date_trunc('month', order_date) as order_month
from orders