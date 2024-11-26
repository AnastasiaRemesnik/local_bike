WITH products_sold_by_month AS (
  SELECT 
    DATE_TRUNC(order_date, MONTH) AS order_month,
    product_id,
    product_name,
    store_id,
    store_name,
    SUM(quantity) AS num_sold_this_month 
  FROM {{ ref('int_order_item') }}
  GROUP BY 
    order_month, 
    product_id, 
    product_name, 
    store_id, 
    store_name
),

products_with_previous_month AS (
  SELECT 
    *,
    LAG(num_sold_this_month) OVER (
      PARTITION BY product_id, store_id
      ORDER BY order_month
    ) AS num_sold_last_month
  FROM products_sold_by_month
)

SELECT 
  p.order_month,
  p.product_name,
  p.store_name,
  p.num_sold_last_month,
  p.num_sold_this_month,
  s.quantity AS stock_left
FROM products_with_previous_month p
LEFT JOIN {{ ref('stg_stocks') }} s
  ON p.store_id = s.store_id
  AND p.product_id = s.product_id
ORDER BY p.product_id, 
    p.order_month
