-- Schema part 
create DATABASE  IF NOT EXISTS order_directory;

use order_directory;

CREATE Table  IF NOT EXISTS supplier (
    supp_id  int PRIMARY KEY,
    supp_name  VARCHAR(50) not null,
    supp_city  VARCHAR(50) not null,
    supp_phone varchar(50) NOT NULL
);


CREATE TABLE IF NOT EXISTS customer(
CUS_ID INT NOT NULL,
CUS_NAME VARCHAR(20) NOT NULL,
CUS_PHONE VARCHAR(10) NOT NULL,
CUS_CITY varchar(30) NOT NULL,
CUS_GENDER CHAR,
PRIMARY KEY (CUS_ID));

CREATE TABLE IF NOT EXISTS category (
CAT_ID INT NOT NULL,
CAT_NAME VARCHAR(20) NOT NULL,
PRIMARY KEY (CAT_ID)
);

CREATE TABLE IF NOT EXISTS product (
PRO_ID INT NOT NULL,
PRO_NAME VARCHAR(20) NOT NULL DEFAULT "Dummy",
PRO_DESC VARCHAR(60),
CAT_ID INT NOT NULL,
PRIMARY KEY (PRO_ID),
FOREIGN KEY (CAT_ID) REFERENCES CATEGORY (CAT_ID)
);

CREATE TABLE IF NOT EXISTS supplier_pricing (
PRICING_ID INT NOT NULL,
PRO_ID INT NOT NULL,
SUPP_ID INT NOT NULL,
SUPP_PRICE INT DEFAULT 0,
PRIMARY KEY (PRICING_ID),
FOREIGN KEY (PRO_ID) REFERENCES PRODUCT (PRO_ID),
FOREIGN KEY (SUPP_ID) REFERENCES SUPPLIER(SUPP_ID)
);

CREATE TABLE IF NOT EXISTS `order` (
ORD_ID INT NOT NULL,
ORD_AMOUNT INT NOT NULL,
ORD_DATE DATE,
CUS_ID INT NOT NULL,
PRICING_ID INT NOT NULL,
PRIMARY KEY (ORD_ID),
FOREIGN KEY (CUS_ID) REFERENCES CUSTOMER(CUS_ID),
FOREIGN KEY (PRICING_ID) REFERENCES SUPPLIER_PRICING(PRICING_ID)
);

CREATE TABLE IF NOT EXISTS rating (
RAT_ID INT NOT NULL,
ORD_ID INT NOT NULL,
RAT_RATSTARS INT NOT NULL,
PRIMARY KEY (RAT_ID),
FOREIGN KEY (ORD_ID) REFERENCES `order`(ORD_ID)
);



-- Insert the data

INSERT INTO SUPPLIER VALUES(1,"Rajesh Retails","Delhi",'1234567890');
INSERT INTO SUPPLIER VALUES(2,"Appario Ltd.","Mumbai",'2589631470');
INSERT INTO SUPPLIER VALUES(3,"Knome products","Banglore",'9785462315');
INSERT INTO SUPPLIER VALUES(4,"Bansal Retails","Kochi",'8975463285');

INSERT INTO SUPPLIER VALUES(5,"Mittal Ltd.","Lucknow",'7898456532');
INSERT INTO CUSTOMER VALUES(1,"AAKASH",'9999999999',"DELHI",'M');
INSERT INTO CUSTOMER VALUES(2,"AMAN",'9785463215',"NOIDA",'M');
INSERT INTO CUSTOMER VALUES(3,"NEHA",'9999999999',"MUMBAI",'F');
INSERT INTO CUSTOMER VALUES(4,"MEGHA",'9994562399',"KOLKATA",'F');
INSERT INTO CUSTOMER VALUES(5,"PULKIT",'7895999999',"LUCKNOW",'M');
INSERT INTO CATEGORY VALUES( 1,"BOOKS");
INSERT INTO CATEGORY VALUES(2,"GAMES");
INSERT INTO CATEGORY VALUES(3,"GROCERIES");
INSERT INTO CATEGORY VALUES (4,"ELECTRONICS");
INSERT INTO CATEGORY VALUES(5,"CLOTHES");
INSERT INTO PRODUCT VALUES(1,"GTA V","Windows 7 and above with i5 processor and 8GB RAM",2);
INSERT INTO PRODUCT VALUES(2,"TSHIRT","SIZE-L with Black, Blue and White variations",5);
INSERT INTO PRODUCT VALUES(3,"ROG LAPTOP","Windows 10 with 15inch screen, i7 processor, 1TB SSD",4);
INSERT INTO PRODUCT VALUES(4,"OATS","Highly Nutritious from Nestle",3);
INSERT INTO PRODUCT VALUES(5,"HARRY POTTER","Best Collection of all time by J.K Rowling",1);
INSERT INTO PRODUCT VALUES(6,"MILK","1L Toned MIlk",3);
INSERT INTO PRODUCT VALUES(7,"Boat EarPhones","1.5Meter long Dolby Atmos",4);
INSERT INTO PRODUCT VALUES(8,"Jeans","Stretchable Denim Jeans with various sizes and color",5);
INSERT INTO PRODUCT VALUES(9,"Project IGI","compatible with windows 7 and above",2);
INSERT INTO PRODUCT VALUES(10,"Hoodie","Black GUCCI for 13 yrs and above",5);
INSERT INTO PRODUCT VALUES(11,"Rich Dad Poor Dad","Written by RObert Kiyosaki",1);
INSERT INTO PRODUCT VALUES(12,"Train Your Brain","By Shireen Stephen",1);
INSERT INTO SUPPLIER_PRICING VALUES(1,1,2,1500);
INSERT INTO SUPPLIER_PRICING VALUES(2,3,5,30000);
INSERT INTO SUPPLIER_PRICING VALUES(3,5,1,3000);
INSERT INTO SUPPLIER_PRICING VALUES(4,2,3,2500);

INSERT INTO SUPPLIER_PRICING VALUES(5,4,1,1000);
INSERT INTO SUPPLIER_PRICING VALUES(6,12,2,780);
INSERT INTO SUPPLIER_PRICING VALUES(7,12,4,789);
INSERT INTO SUPPLIER_PRICING VALUES(8,3,1,31000);
INSERT INTO SUPPLIER_PRICING VALUES(9,1,5,1450);
INSERT INTO SUPPLIER_PRICING VALUES(10,4,2,999);
INSERT INTO SUPPLIER_PRICING VALUES(11,7,3,549);
INSERT INTO SUPPLIER_PRICING VALUES(12,7,4,529);
INSERT INTO SUPPLIER_PRICING VALUES(13,6,2,105);
INSERT INTO SUPPLIER_PRICING VALUES(14,6,1,99);
INSERT INTO SUPPLIER_PRICING VALUES(15,2,5,2999);
INSERT INTO SUPPLIER_PRICING VALUES(16,5,2,2999);
INSERT INTO `ORDER` VALUES (101,1500,"2021-10-06",2,1);
INSERT INTO `ORDER` VALUES(102,1000,"2021-10-12",3,5);
INSERT INTO `ORDER` VALUES(103,30000,"2021-09-16",5,2);
INSERT INTO `ORDER` VALUES(104,1500,"2021-10-05",1,1);
INSERT INTO `ORDER` VALUES(105,3000,"2021-08-16",4,3);
INSERT INTO `ORDER` VALUES(106,1450,"2021-08-18",1,9);
INSERT INTO `ORDER` VALUES(107,789,"2021-09-01",3,7);
INSERT INTO `ORDER` VALUES(108,780,"2021-09-07",5,6);
INSERT INTO `ORDER` VALUES(109,3000,"2021-09-10",5,3);
INSERT INTO `ORDER` VALUES(110,2500,"2021-09-10",2,4);
INSERT INTO `ORDER` VALUES(111,1000,"2021-09-15",4,5);
INSERT INTO `ORDER` VALUES(112,789,"2021-09-16",4,7);
INSERT INTO `ORDER` VALUES(113,31000,"2021-09-16",1,8);
INSERT INTO `ORDER` VALUES(114,1000,"2021-09-16",3,5);
INSERT INTO `ORDER` VALUES(115,3000,"2021-09-16",5,3);
INSERT INTO `ORDER` VALUES(116,99,"2021-09-17",2,14);
INSERT INTO RATING VALUES(1,101,4);

INSERT INTO RATING VALUES(2,102,3);
INSERT INTO RATING VALUES(3,103,1);
INSERT INTO RATING VALUES(4,104,2);
INSERT INTO RATING VALUES(5,105,4);
INSERT INTO RATING VALUES(6,106,3);
INSERT INTO RATING VALUES(7,107,4);
INSERT INTO RATING VALUES(8,108,4);
INSERT INTO RATING VALUES(9,109,3);
INSERT INTO RATING VALUES(10,110,5);
INSERT INTO RATING VALUES(11,111,3);
INSERT INTO RATING VALUES(12,112,4);
INSERT INTO RATING VALUES(13,113,2);
INSERT INTO RATING VALUES(14,114,1);
INSERT INTO RATING VALUES(15,115,1);
INSERT INTO RATING VALUES(16,116,0);




-- solving the QUERY


/* 1)
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


/* 5)
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


/* 6)
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


//RDM
/* 7)
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


/* 8)
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




/* 9)
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
