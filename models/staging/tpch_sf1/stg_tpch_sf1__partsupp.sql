{{ config(
materialized='table'
) }}


with 

source as (

    select * from {{ source('tpch_sf1', 'partsupp') }}

),

renamed as (

    select
        ps_partkey as part_id,
        ps_suppkey as supplier_id,
        ps_availqty as availavility,
        ps_supplycost as supplier_cost,
        ps_comment

    from source

)

select * from renamed

