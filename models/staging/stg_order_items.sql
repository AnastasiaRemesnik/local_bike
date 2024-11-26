select 
  concat(order_id, '_', product_id) as order_item_id,
  order_id,
  item_id,
  product_id,
  quantity,
  list_price,
  discount,
  quantity * list_price * (1 - discount) as final_order_item_price
from {{ source('localbike_raw_data', 'order_items') }}
