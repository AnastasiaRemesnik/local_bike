select 
    brand_id,
    brand_name
from {{ source('localbike_raw_data', 'brands') }}
