{{ config(
materialized='table'
) }}

with 

source as (

    select * from {{ source('tpch_sf1', 'customer') }}

),


renamed as (
    select
    c_custkey      as customer_id,
    lower(c_name)         as name,
    c_address     as customer_adress,
    c_nationkey    as nation_id,
    c_phone       as customer_phone,
    c_acctbal      as account_balance,
    c_mktsegment   as market_segment,
    c_comment      as customer_comment
    from source

)

select * from renamed
