/* 
Purpose: Display the total number of customers based on gender who have placed individual orders of worth at least Rs.3000.
Inputs: None
Outputs:
    - No. of Customers (No_of_customers): Number of customers meeting the criteria.
    - Gender (Gender): Gender of the customers.
*/

USE order_directory;

SELECT
    s2.CUS_GENDER AS Gender,
    COUNT(s2.cust_id) AS No_of_customers
FROM
(
    SELECT
        s1.cust_id,
        s1.CUS_GENDER
    FROM
    (
        SELECT
            c.CUS_ID AS cust_id,
            c.CUS_GENDER AS CUS_GENDER
        FROM
            customer AS c
            INNER JOIN `order` AS o ON o.CUS_ID = c.CUS_ID
        WHERE
            o.ORD_AMOUNT >= 3000
    ) AS s1
    GROUP BY s1.cust_id
) AS s2
GROUP BY s2.CUS_GENDER;
