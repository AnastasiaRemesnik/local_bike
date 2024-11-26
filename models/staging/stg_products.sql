select 
  product_id,
  product_name,
  brand_id,
  category_id,
  model_year,
  list_price
from {{ source('localbike_raw_data', 'products') }}
