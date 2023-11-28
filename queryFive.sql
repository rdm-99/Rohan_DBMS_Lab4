/* 
Purpose: Display the ID and Name of the products ordered after a specific date.
Inputs:
    - Order Date (2021-10-05): The date to filter the orders.
Outputs:
    - Order ID (order_id): ID of the order.
    - Product ID (product_id): ID of the product.
    - Product Name (product_name): Name of the product.
*/

SELECT
    a.ORD_ID AS order_id,
    p.PRO_ID AS product_id,
    p.PRO_NAME AS product_name
FROM
    `order` AS a
INNER JOIN
    supplier_pricing AS sp ON a.PRICING_ID = sp.PRICING_ID
INNER JOIN
    product AS p ON p.PRO_ID = sp.PRO_ID
WHERE
    a.ORD_DATE > DATE("2021-10-05");
