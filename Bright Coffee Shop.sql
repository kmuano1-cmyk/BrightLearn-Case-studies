-- Check my categorical columns (values)
SELECT
distinct store_location 
FROM
  "MUANO"."ANALYSIS1"."COFFEESHOP"; 

SELECT distinct PRODUCT_CATEGORY
FROM
  "MUANO"."ANALYSIS1"."COFFEESHOP"; 

SELECT distinct PRODUCT_TYPE
FROM
  "MUANO"."ANALYSIS1"."COFFEESHOP"; 

----- WHEN did we open the shop 
SELECT MIN (transaction_date) AS Shop_Opening_Date 
FROM
  "MUANO"."ANALYSIS1"."COFFEESHOP"; 

--Time the shop opens 
SELECT MIN(TRANSACTION_TIME) AS opening_hour
FROM
  "MUANO"."ANALYSIS1"."COFFEESHOP"; 

---Time the shop closes 
SELECT Max(TRANSACTION_TIME) AS closinng_hour
FROM
  "MUANO"."ANALYSIS1"."COFFEESHOP"; 

--- last operating date 
SELECT Max (transaction_date) AS last_operating_date  
FROM
  "MUANO"."ANALYSIS1"."COFFEESHOP"; 




--Main code 

SELECT TRANSACTION_DATE,
DAYNAME(TRANSACTION_DATE) AS day_name,
CASE 
WHEN day_name IN ('Sat','Sun') THEN 'Weekend'
ELSE 'Weekday'
END AS day_classification,

MONTHNAME(TRANSACTION_DATE) AS month_name, 

TRANSACTION_TIME,
CASE 
    WHEN TRANSACTION_TIME BETWEEN '06:00:00' AND '11:59:59' THEN 'Morning'
    WHEN TRANSACTION_TIME BETWEEN '12:00:00' AND '16:59:59' THEN 'AFTERNOON'
    WHEN TRANSACTION_TIME >= '17:00:00' THEN 'EVENING'
END AS time_classification,   
HOUR(TRANSACTION_TIME) AS hour_of_day,

-- categorical data 
STORE_LOCATION,
PRODUCT_CATEGORY, 
PRODUCT_DETAIL, 
PRODUCT_TYPE,

--IDs
COUNT(DISTINCT TRANSACTION_ID) AS Number_of_Sales,

--- Revenue calculation 

SUM(TRANSACTION_QTY*UNIT_PRICE) AS Revenue


FROM
  "MUANO"."ANALYSIS1"."COFFEESHOP"
    GROUP BY ALL;
