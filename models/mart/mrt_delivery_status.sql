select 
    order_id,
    order_status,
    order_date,
    required_date,
    shipped_date,
    store_name,
    staff_full_name
from {{ ref('int_order_item') }}
group by 
    order_id,
    order_status,
    order_date,
    required_date,
    shipped_date,
    store_name,
    staff_full_name
