with sales as (
    select *
    from {{ ref('fct_sales') }}
)

select
    region,
    to_char(order_date, 'YYYY') as order_year,
    to_char(order_date, 'MM') as order_month,
    sum(revenue) as total_revenue,
    sum(margin) as total_margin,
    count(distinct order_id) as order_count
from sales
group by region, order_date, order_year, order_month
order by region, order_year, order_month, order_count desc, total_margin desc