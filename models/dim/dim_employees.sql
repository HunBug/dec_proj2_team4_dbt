with employees as (
    select
        EMPLOYEE_ID,
        LAST_NAME,
        FIRST_NAME,
        TITLE,
        TITLE_OF_COURTESY,
        BIRTH_DATE,
        HIRE_DATE,
        ADDRESS,
        CITY,
        REGION,
        POSTAL_CODE,
        COUNTRY,
        HOME_PHONE,
        EXTENSION,
        NOTES,
        REPORTS_TO,
        dbt_scd_id, 
        dbt_updated_at, 
        dbt_valid_from, 
        dbt_valid_to
    from {{ ref('snp_employees')}}
)

select
    dbt_scd_id as employees_key,
    EMPLOYEE_ID,
    LAST_NAME,
    FIRST_NAME,
    TITLE,
    TITLE_OF_COURTESY,
    BIRTH_DATE,
    HIRE_DATE,
    ADDRESS,
    CITY,
    REGION,
    POSTAL_CODE,
    COUNTRY,
    HOME_PHONE,
    EXTENSION,
    NOTES,
    REPORTS_TO,
    dbt_valid_from::date as valid_from, 
    ifnull(dbt_valid_to::date, current_date) as valid_to
from employees