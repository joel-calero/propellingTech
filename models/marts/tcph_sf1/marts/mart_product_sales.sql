with sales as (
    select *
    from {{ ref('fct_sales') }}
),

products as (
    select *
    from {{ ref('dim_product') }}
)

select
    products.part_id,
    products.part_name,
    count(distinct sales.order_id) as order_count,
    count(distinct sales.customer_id) as unique_customers,
    sum(sales.quantity) as total_quantity_sold,
    sum(sales.revenue) as total_revenue,
    round(avg(sales.discount), 2) as avg_discount,
    round(avg(sales.margin), 2) as avg_margin
from sales
join products on sales.part_id = products.part_id
group by products.part_id, products.part_name
order by order_count desc