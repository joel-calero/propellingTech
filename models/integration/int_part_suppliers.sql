with partsupps as (
    select * from {{ ref('stg_tpch_sf1__partsupp') }}
),

parts as (
    select * from {{ ref('stg_tpch_sf1__part') }}
),

suppliers as (
    select * from {{ ref('stg_tpch_sf1__supplier') }}
),

nations as (
    select * from {{ ref('stg_tpch_sf1__nation') }}
),

regions as (
    select * from {{ ref('stg_tpch_sf1__region') }}
)


select 
    partsupps.part_id,
    parts.part_name,
    suppliers.supplier_id,
    suppliers.name,
    partsupps.supplier_cost,
    parts.manufacturer_id,
    nations.name as country,
    regions.name as region,
from partsupps
join parts on parts.part_id = partsupps.part_id
join suppliers on suppliers.supplier_id = partsupps.supplier_id
join nations on nations.nation_id = suppliers.nation_id
join regions on regions.region_id = nations.region_id
