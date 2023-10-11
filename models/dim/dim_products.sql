with products as (
    select
        PRODUCT_ID,
        PRODUCT_NAME,
--        SUPPLIER_ID,
--        CATEGORY_ID,
        QUANTITY_PER_UNIT,
        UNIT_PRICE,
        UNITS_IN_STOCK,
        UNITS_ON_ORDER,
        REORDER_LEVEL,
        DISCONTINUED,
        dbt_scd_id, 
        dbt_updated_at, 
        dbt_valid_from, 
        dbt_valid_to
    from {{ ref('snp_products')}}
)

select
    dbt_scd_id as products_key,
    PRODUCT_ID,
    PRODUCT_NAME,
--        SUPPLIER_ID,
--        CATEGORY_ID,
    QUANTITY_PER_UNIT,
    UNIT_PRICE,
    UNITS_IN_STOCK,
    UNITS_ON_ORDER,
    REORDER_LEVEL,
    DISCONTINUED,
    dbt_valid_from::date as valid_from, 
    ifnull(dbt_valid_to::date,current_date) as valid_to
from products