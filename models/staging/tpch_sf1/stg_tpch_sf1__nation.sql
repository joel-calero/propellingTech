{{ config(
materialized='table'
) }}

with 

source as (

    select * from {{ source('tpch_sf1', 'nation') }}

),

renamed as (

    select
        CAST(n_nationkey as INT) as nation_id,
        n_name as name,
        CAST(n_regionkey as INT) as region_id,
        n_comment

    from source

)

select * from renamed
