with customers as (
    select *
    from {{ ref('dim_customer') }}
)


select 
    customer_name,
    country,
    region,
    market_segment,
    total_orders,
    first_order_date,
    last_order_date,
    total_revenue,
    avg_order_value,
    datediff('day', last_order_date, current_date) as days_since_last_order
from customers
order by total_orders desc, last_order_date desc, total_revenue desc