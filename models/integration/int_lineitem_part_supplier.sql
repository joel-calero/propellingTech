with lineitems as (
    select * from {{ ref('stg_tpch_sf1__lineitem') }}
),

parts as (
    select * from {{ ref('stg_tpch_sf1__part') }}
),

suppliers as (
    select * from {{ ref('stg_tpch_sf1__supplier') }}
),

partsupps as (
    select * from {{ ref('stg_tpch_sf1__partsupp') }}
),

nations as (
    select * from {{ ref('stg_tpch_sf1__nation') }}
),

regions as (
    select * from {{ ref('stg_tpch_sf1__region') }}
)


select 
    lineitems.order_id,
    parts.part_id,
    parts.part_name,
    parts.manufacturer_id,
    parts.brand_id ,
    parts.type as part_type,
    parts.size as part_size,
    parts.container_type,
    parts.retail_price,
    suppliers.supplier_id,
    suppliers.name as supplier_name,
    nations.name as country,
    regions.name as region,
    lineitems.quantity,
    lineitems.extended_price,
    lineitems.discount,
    lineitems.ship_date,
    lineitems.commit_date,
    lineitems.receipt_date,
    lineitems.ship_mode,
    partsupps.availavility,
    partsupps.supplier_cost,
    (lineitems.extended_price * (1-lineitems.discount)) as line_total,
    line_total - (lineitems.quantity * partsupps.supplier_cost) as margin
from lineitems
join parts on parts.part_id = lineitems.part_id
join suppliers on suppliers.supplier_id = lineitems.supplier_id
join partsupps on partsupps.part_id = parts.part_id
join nations on nations.nation_id = suppliers.nation_id
join regions on regions.region_id = nations.region_id