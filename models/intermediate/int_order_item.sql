select 
    o.order_id,
    o.order_status,
    o.order_date,
    o.required_date,
    o.shipped_date,
    oi.product_id,
    p.product_name,
    b.brand_name,
    oi.quantity,
    oi.final_order_item_price,
    concat(c.first_name, ' ', c.last_name) as client_full_name,
    concat(sf.first_name, ' ', sf.last_name) as staff_full_name,
    sf.active as staff_is_active,
    sr.store_id,
    sr.store_name
from {{ ref('stg_orders') }} o
    join {{ ref('stg_order_items') }} oi 
        on o.order_id = oi.order_id
    join {{ ref('stg_products') }} p 
        on oi.product_id = p.product_id
    join {{ ref('stg_brands') }} b 
        on p.brand_id = b.brand_id
    join {{ ref('stg_customers') }} c 
        on o.customer_id = c.customer_id
    join {{ ref('stg_staffs') }} sf 
        on o.staff_id = sf.staff_id
    join {{ ref('stg_stores') }} sr 
        on o.store_id = sr.store_id
