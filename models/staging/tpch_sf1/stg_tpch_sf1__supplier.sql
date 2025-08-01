{{ config(
materialized='table'
) }}


with 

source as (

    select * from {{ source('tpch_sf1', 'supplier') }}

),

renamed as (

    select
        CAST(s_suppkey as INT) as supplier_id,
        s_name as name,
        s_address,
        CAST(s_nationkey as INT) as nation_id,
        s_phone,
        s_acctbal,
        s_comment

    from source

)

select * from renamed
