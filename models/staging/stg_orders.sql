{{
    config(
        materialized='table'
    )
}}

with
raw_order_headers as (
    select 
        {{ dbt_utils.star(from=source('postgres_rds_public', 'orders'), except=["_fivetran_deleted", "_fivetran_synced"]) }}
    from {{ source('postgres_rds_public', 'orders') }}
)
, raw_order_details as (
    select 
        {{ dbt_utils.star(from=source('postgres_rds_public', 'order_details'), except=["_fivetran_deleted", "_fivetran_synced"]) }}
    from {{ source('postgres_rds_public', 'order_details') }}
)
, final as (

    select
        {{dbt_utils.generate_surrogate_key(['order_id','order_date','product_id'])}} as order_pk
        ,{{dbt_utils.generate_surrogate_key(['customer_id'])}} as customer_fk
        ,{{dbt_utils.generate_surrogate_key(['employee_id'])}} as employee_fk
        ,{{dbt_utils.generate_surrogate_key(['ship_via'])}} as shipper_fk
        ,{{dbt_utils.generate_surrogate_key(['product_id'])}} as product_fk
        ,order_id
        ,customer_id
        ,employee_id
        ,ship_via as shipper_id
        ,product_id
        ,order_date::date as order_date
        ,required_date::date as required_date
        ,shipped_date::date as shipped_date
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
        ,round(quantity*unit_price*(1-discount),2) as amount
        ,round(sum(amount) over (partition by customer_id, order_id),2) as total_order_amount
        ,sum(quantity) over (partition by customer_id, order_id) as total_order_quantity
    from raw_order_headers
    left join raw_order_details using(order_id)

)
    select * from final 