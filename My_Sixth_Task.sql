select * from orders;
select * from products;
SELECT 
  EXTRACT(YEAR FROM STR_TO_DATE(order_date, '%d-%m-%Y')) AS year,
  EXTRACT(MONTH FROM STR_TO_DATE(order_date, '%d-%m-%Y')) AS month,
  SUM(total_price) AS monthly_revenue,
  COUNT(DISTINCT order_id) AS order_volume
FROM orders
GROUP BY year, month
ORDER BY year, month;

SELECT 
  EXTRACT(MONTH FROM STR_TO_DATE(order_date, '%d-%m-%Y')) AS month,
  SUM(total_price) AS monthly_revenue
FROM orders
WHERE EXTRACT(YEAR FROM STR_TO_DATE(order_date, '%d-%m-%Y')) = 2023
GROUP BY month
ORDER BY month;

SELECT 
  YEAR(STR_TO_DATE(order_date, '%d-%m-%Y')) AS year,
  MONTH(STR_TO_DATE(order_date, '%d-%m-%Y')) AS month,
  SUM(total_price) AS monthly_revenue,
  COUNT(DISTINCT order_id) AS order_volume
FROM orders
GROUP BY year, month
ORDER BY year, month;

SELECT 
  YEAR(STR_TO_DATE(order_date, '%d-%m-%Y')) AS year,
  MONTH(STR_TO_DATE(order_date, '%d-%m-%Y')) AS month,
  SUM(total_price) AS monthly_revenue
FROM orders
GROUP BY year, month
ORDER BY monthly_revenue DESC
LIMIT 3;

SELECT 
  p.product_name,
  COUNT(*) AS times_ordered
FROM products p
GROUP BY p.product_name
ORDER BY times_ordered DESC
LIMIT 5;