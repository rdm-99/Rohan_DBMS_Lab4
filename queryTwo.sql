/* 
Purpose: Display all the orders along with the product name ordered by a customer with a specific Customer ID.
Inputs:
    - Customer ID (2): ID of the customer to filter the orders.
Outputs:
    - All Order Columns (o.*): All columns from the 'order' table for the specific customer.
    - Product Name (PRO_NAME): Name of the product associated with each order.
*/

SELECT
    o.*,
    p.PRO_NAME as Product_Name
FROM
    `order` AS o
JOIN
    supplier_pricing AS s ON o.PRICING_ID = s.PRICING_ID
JOIN
    product AS p ON s.PRO_ID = p.PRO_ID
WHERE
    o.CUS_ID = 2;
