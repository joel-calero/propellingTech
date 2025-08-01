with sales as (
    select *
    from {{ ref('fct_sales') }}
),
customers as (
    select *
    from {{ ref("dim_customer")}}
)


select
    sales.region,
    customers.market_segment,
    to_char(sales.order_date, 'YYYY') as order_year,
    to_char(sales.order_date, 'MM') as order_month,
    sum(sales.revenue) as total_revenue,
    sum(sales.margin) as total_margin,
    count(distinct sales.order_id) as order_count,
from sales
join customers on customers.customer_id = sales.customer_id
group by sales.region, order_year, sales.order_date, order_month, customers.market_segment
order by sales.region, order_year, order_month, order_count desc, total_margin desc