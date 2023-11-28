/* 
Purpose: Display customer name and gender of customers whose names start or end with the character 'A'.
Inputs: None
Outputs:
    - Customer Name (Customer_Name): Name of the customer
    - Gender (Gender): Gender of the customer
*/

SELECT
    c.CUS_NAME AS Customer_Name,
    c.CUS_GENDER AS Gender
FROM
    customer AS c
WHERE
    c.CUS_NAME LIKE 'A%'
    OR c.CUS_NAME LIKE '%A';
