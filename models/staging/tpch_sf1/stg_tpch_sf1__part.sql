{{ config(
materialized='table'
) }}

with 

source as (

    select * from {{ source('tpch_sf1', 'part') }}

),

renamed as (

    select
        p_partkey as part_id,
        CAST(SUBSTRING(p_mfgr, CHARINDEX('#', p_mfgr) + 1, LEN(p_mfgr)) as int) as manufacturer_id,
        CAST(SUBSTRING(p_brand, CHARINDEX('#', p_brand) + 1, LEN(p_brand)) as int) as brand_id ,
        p_type as type,
        p_size as size,
        p_container as container_type,
        p_retailprice as retail_price,
        p_name as part_name,
        p_comment

    from source

)

select * from renamed
