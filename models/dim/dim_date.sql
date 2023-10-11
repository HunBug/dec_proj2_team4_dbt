
with 
date_spine as (
{{ dbt_utils.date_spine(
    datepart="day",
    start_date="cast('1996-07-01' as date)",
    end_date="cast('2023-12-31' as date)"
   )
}}
)

, final as (

    select 
        date_day
        ,dayname(date_day) as day_name
        ,weekiso(date_day) as week
        ,monthname(date_day) as month_name
        ,month(date_day) as month
        ,quarter(date_day) as quarter
        ,year(date_day) as year
    from date_spine
)
    select * from final