with customers as (
    select
        CUSTOMER_ID,
        COMPANY_NAME,
        CONTACT_NAME,
        CONTACT_TITLE,
        ADDRESS,
        CITY,
        REGION,
        POSTAL_CODE,
        COUNTRY,
        PHONE,
        FAX,
        dbt_scd_id, 
        dbt_updated_at, 
        dbt_valid_from, 
        dbt_valid_to
    from {{ ref('snp_customers')}}
)

select
    dbt_scd_id as customers_key,
    CUSTOMER_ID,
    COMPANY_NAME,
    CONTACT_NAME,
    CONTACT_TITLE,
    ADDRESS,
    CITY,
    REGION,
    POSTAL_CODE,
    COUNTRY,
    PHONE,
    FAX,
    dbt_valid_from::date as valid_from, 
    ifnull(dbt_valid_to::date,current_date) as valid_to
from customers