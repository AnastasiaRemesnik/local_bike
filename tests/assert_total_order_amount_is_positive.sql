select
    order_id,
    sum(final_order_item_price) as total_amount
from {{ ref('stg_order_items') }}
group by order_id
having total_amount < 0
