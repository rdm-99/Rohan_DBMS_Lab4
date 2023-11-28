/* 
Purpose: Find the least expensive product from each category and print the table with category id, name, product name, and price of the product.
Inputs: None
Outputs:
    - Category ID (CAT_ID): ID of the category
    - Category Name (CAT_NAME): Name of the category
    - Product ID (PRO_ID): ID of the product
    - Product Name (PRO_NAME): Name of the product
    - Supplier Price (SUPP_PRICE): Price of the product from the supplier
*/

-- Fetching the least expensive product from each category
SELECT
    s2.CAT_ID,
    s2.CAT_NAME,
    s2.PRO_ID,
    s2.PRO_NAME,
    s2.SUPP_PRICE
FROM
(
    -- Add row number to the data according to category
    SELECT
        s1.CAT_ID,
        s1.CAT_NAME,
        s1.PRO_ID,
        s1.PRO_NAME,
        s1.SUPP_PRICE,
        ROW_NUMBER() OVER (
            PARTITION BY s1.CAT_ID
            ORDER BY s1.SUPP_PRICE ASC
        ) AS rn
    FROM
    (
        -- Getting the required data for each product and category
        SELECT
            c.CAT_ID,
            c.CAT_NAME,
            p.PRO_NAME,
            p.PRO_ID,
            sp.SUPP_PRICE
        FROM supplier_pricing AS sp
        JOIN product AS p ON sp.PRO_ID = p.PRO_ID
        JOIN category AS c ON c.CAT_ID = p.CAT_ID
    ) AS s1
) AS s2
WHERE s2.rn = 1;
