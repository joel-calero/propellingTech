with orders as (
    select * from {{ ref('int_orders_customers') }}
),

lineitems as (
    select * from {{ ref('int_lineitem_part_supplier') }}
),

order_lineitems as (
    select
        orders.customer_id,
        orders.customer_name,
        orders.country,
        orders.region,
        orders.market_segment,
        orders.order_id,
        orders.order_date,
        lineitems.line_total
    from orders
    join lineitems on orders.order_id = lineitems.order_id
),

-- Aggregate revenue per customer
customer_value as (
    select
        customer_id,
        customer_name,
        country,
        region,
        market_segment,
        min(order_date) as first_order_date,
        max(order_date) as last_order_date,
        count(distinct order_id) as total_orders,
        sum(line_total) as total_revenue,
        round(avg(line_total), 2) as avg_order_value
    from order_lineitems
    group by customer_id, customer_name, country, region, market_segment
)

select *
from customer_value
