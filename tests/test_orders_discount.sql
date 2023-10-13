select 
    amount,
    discount,
    round(quantity*unit_price,2) as amount_no_discount
from {{ ref("stg_orders")}}
where amount > amount_no_discount