with orders as (
    select * from {{ ref('stg_tpch_sf1__orders') }}
),

customers as (
    select * from {{ ref('stg_tpch_sf1__customers') }}
),

nations as (
    select * from {{ ref('stg_tpch_sf1__nation') }}
),

regions as (
    select * from {{ ref('stg_tpch_sf1__region') }}
)

select 
    orders.order_id,
    orders.customer_id,
    customers.name as customer_name,
    nations.name as country,
    regions.name as region,
    customers.market_segment,
    customers.account_balance,
    orders.order_status,
    orders.total_price,
    orders.order_date,
    orders.order_priority,

from orders
join customers on orders.customer_id = customers.customer_id
join nations on nations.nation_id = customers.nation_id
join regions on regions.region_id = nations.region_id