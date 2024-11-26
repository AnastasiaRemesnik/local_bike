select 
  order_id,
  customer_id,
  order_status,
  order_date,
  required_date,
  shipped_date as shipped_date,
  store_id,
  staff_id
from {{ source('localbike_raw_data', 'orders') }}
