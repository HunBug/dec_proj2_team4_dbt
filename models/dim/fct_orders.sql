{{
    config(
        materialized='incremental'
    )
}}

with
staged_orders as (

    select
        {{ dbt_utils.star(from=ref('stg_orders')) }}
    from {{ ref('stg_orders') }}
    where true
    {% if is_incremental() %}
        -- this filter will only be applied on an incremental run
        and order_date > (select max(order_date) from {{ this }}) 
    {% endif %}
)
, final as (
    select
        o.order_pk
        ,c.customers_key as customer_fk
        ,e.employees_key as employee_fk
        ,p.products_key as product_fk
        ,shipper_fk
        ,o.order_id
        ,o.customer_id
        ,o.employee_id
        ,o.shipper_id
        ,o.product_id
        ,order_date
        ,o.required_date
        ,o.shipped_date
        ,o.freight
        ,o.ship_name
        ,o.ship_address
        ,o.ship_city
        ,o.ship_region
        ,o.ship_postal_code
        ,o.ship_country
        ,o.unit_price
        ,o.quantity
        ,o.discount
        ,o.amount
        ,o.total_order_amount
        ,o.total_order_quantity
    from {{ ref('stg_orders') }} o
    left join {{ ref('dim_products') }} p 
        on o.product_id = p.product_id 
            --and o.order_date between p.valid_from and p.valid_to
    left join {{ ref('dim_customers') }} c 
        on o.customer_id = c.customer_id 
            --and o.order_date between c.valid_from and c.valid_to
    left join {{ ref('dim_employees') }} e
        on o.employee_id = e.employee_id
            --and o.order_date between e.valid_from and e.valid_to
)
    select * from final