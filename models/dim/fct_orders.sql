{{
    config(
        materialized='table'
    )
}}

select
    order_pk
    ,customer_fk
    ,employee_fk
    ,shipper_fk
    ,product_fk
    ,order_id
    ,customer_id
    ,employee_id
    ,shipper_id
    ,product_id
    ,order_date
    ,required_date
    ,shipped_date
    ,freight
    ,ship_name
    ,ship_address
    ,ship_city
    ,ship_region
    ,ship_postal_code
    ,ship_country
    ,unit_price
    ,quantity
    ,discount
    ,amount
    ,total_order_amount
    ,total_order_quantity
from {{ ref('stg_orders') }}
-- left join product on product_id and date. 