/* 10)
Purpose: Create a stored procedure to display supplier id, name, Rating (Average rating of all the products sold by every customer), and Type_of_Service.
Inputs: None
Outputs:
    - Supplier ID (supp_id): ID of the supplier
    - Supplier Name (supp_name): Name of the supplier
    - Average Ratings (avg_ratings): Average rating of all the products sold by every customer for the supplier
    - Type of Service (Type_of_Service): Description of the service based on the average rating
        - "Excellent Service" if rating = 5
        - "Good Service" if rating > 4
        - "Average Service" if rating > 2
        - "Poor Service" for any other rating
*/

DELIMITER //
CREATE PROCEDURE If NOT EXISTS `SP`()
BEGIN
    SELECT
        s1.supp_id as id,
        s1.supp_name as name,
        ROUND(AVG(s1.rating),2) AS Rating,
        CASE
            WHEN AVG(s1.rating) = 5 THEN "Excellent Service"
            WHEN AVG(s1.rating) > 4 THEN "Good Service"
            WHEN AVG(s1.rating) > 2 THEN "Average Service"
            ELSE "Poor Service"
        END AS Type_of_Service
    FROM (
        SELECT
            s.supp_id,
            s.supp_name,
            r.`RAT_RATSTARS` AS rating
        FROM `order` AS o
        JOIN rating AS r ON o.`ORD_ID` = r.`ORD_ID`
        JOIN supplier_pricing AS sp ON sp.`PRICING_ID` = o.`PRICING_ID`
        JOIN supplier AS s ON s.supp_id = sp.`SUPP_ID`
    ) AS s1
    GROUP BY s1.supp_id;
END //
DELIMITER ;

call sp();
