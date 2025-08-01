{{ config(
materialized='table'
) }}


with 

source as (

    select * from {{ source('tpch_sf1', 'orders') }}

),

renamed as (

    select
        o_orderkey as order_id,
        o_custkey as customer_id,
        o_orderstatus as order_status,
        o_totalprice as total_price,
        try_to_date(o_orderdate) as order_date ,
        SUBSTRING(o_orderpriority, CHARINDEX('-', o_orderpriority) + 1, LEN(o_orderpriority)) as order_priority ,
        o_shippriority as ship_priority,
        o_clerk,
        o_comment

    from source

)

select * from renamed
