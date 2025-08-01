with orders as (
    select * from {{ ref('int_orders_customers') }}
),

lineitems as (
    select * from {{ ref('int_lineitem_part_supplier') }}
)

select
    orders.order_id,
    orders.order_date,
    orders.total_price,
    orders.customer_id,
    orders.customer_name,
    orders.region,
    orders.country,
    lineitems.part_id,
    lineitems.part_name,
    lineitems.supplier_name,
    lineitems.quantity,
    lineitems.discount,
    lineitems.line_total,
    lineitems.margin
from orders
join lineitems on lineitems.order_id = orders.order_id