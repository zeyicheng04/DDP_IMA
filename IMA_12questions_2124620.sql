SELECT COUNT(category_id)
FROM orders
WHERE category_id = 2;

SELECT COUNT(category_id)
FROM orders
WHERE category_id in (2,4,5) ;

SELECT COUNT(price)
FROM orders
WHERE price > 35.00 ;

SELECT COUNT (id) 
FROM orders
WHERE (date_of_birth < 1980-01-01) AND (newsletter = 1)

SELECT COUNT (id)
FROM orders
WHERE customer_surname = 'Davenport';

SELECT customer_firstname
from orders 
WHERE customer_firstname LIKE 'Br%';

SELECT *
FROM orders 
WHERE category_id = 3
ORDER BY price DESC;

SELECT trans_date AS"Transaction Date",price AS"Price",promo_code AS "Promotion code"
FROM orders;

SELECT CONCAT(customer_surname,' ',customer_firstname) 
AS 'Customer Name',county AS 'County'
FROM orders; 

SELECT category_id,AVG(price) AS "Average Price",MIN(price) AS "Minimun Price",MAX(price) AS "Maximum Price"
FROM orders
GROUP BY category_id;

SELECT category_name AS 'Category',
	   COUNT (orders.id) AS "Total order",
       SUM (price) AS "Total sales" 
FROM orders 
LEFT JOIN categories 
ON (orders.category_id = categories.id) 
GROUP BY category_name;

SELECT orders.trans_date AS 'Transaction Date',
	   categories.category_name AS 'Category',
	   orders.customer_surname AS 'Surname',
       orders.customer_firstname AS 'Firstname',
       orders.price AS 'Order Price',
       promotions.discount AS 'Discounted by'
FROM orders
LEFT JOIN categories
ON orders.category_id = categories.id
LEFT JOIN promotions
ON orders.promo_code = promotions.code;

