{{ config(
materialized='table'
) }}

with 

source as (

    select * from {{ source('tpch_sf1', 'region') }}

),

renamed as (

    select
        CAST(r_regionkey as INT) as region_id ,
        r_name as name,
        r_comment

    from source

)

select * from renamed
