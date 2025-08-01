{{ config(
materialized='table'
) }}

with 

source as (

    select * from {{ source('tpch_sf1', 'lineitem') }}

),

renamed as (

    select
        CAST(l_orderkey as INT) as order_id,
        CAST(l_partkey as INT) as part_id,
        CAST(l_suppkey as INT) as supplier_id,
        CAST(l_linenumber as INT) as line_number,
        CAST(l_quantity as INT) as quantity,
        CAST(l_extendedprice as INT) as extended_price,
        l_discount as discount,
        l_tax,
        l_returnflag,
        l_linestatus,
        CAST(l_shipdate as DATE) as ship_date,
        CAST(l_commitdate as DATE) as commit_date,
        CAST(l_receiptdate as DATE) as receipt_date,
        l_shipinstruct,
        l_shipmode as ship_mode,
        l_comment

    from source

)

select * from renamed
