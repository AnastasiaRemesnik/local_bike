select 
    order_date,
    store_name,
    staff_full_name,
    count(distinct order_id) as num_orders,
    sum(quantity) as num_products_sold,
    sum(final_order_item_price) as total_price
from {{ ref('int_order_item') }}
group by 
    order_date,
    store_name,
    staff_full_name
