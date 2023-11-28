/* 
 Purpose: Display the supplier details of suppliers who can supply more than one product.
 Inputs: None
 Outputs: Supplier details for suppliers meeting the criteria.
 */

SELECT *
FROM supplier
WHERE `SUPP_ID` IN (
        SELECT SUPP_ID
        FROM supplier_pricing
        GROUP BY `SUPP_ID`
        HAVING
            COUNT(`PRO_ID`) > 1
    );

;
