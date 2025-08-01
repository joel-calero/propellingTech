with customers as (
    select * from {{ ref('int_customer_value') }}
)

select 
    customer_id,
    customer_name,
    country,
    region,
    market_segment,
    total_orders,
    first_order_date,
    last_order_date,
    to_char(last_order_date, 'YYYY') as year_order_date,
    total_revenue,
    avg_order_value
from customers
order by total_orders desc, last_order_date desc, total_revenue desc