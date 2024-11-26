select 
  concat(store_id, '_', product_id) as stock_id,
  store_id,
  product_id,
  quantity
from {{ source('localbike_raw_data', 'stocks') }}
