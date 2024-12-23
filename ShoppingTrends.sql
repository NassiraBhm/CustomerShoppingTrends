SELECT * FROM [CUSTOMERDATA].dbo.shopping_trends


-- Check for duplicates --

SELECT "Customer ID", COUNT(*) AS duplicate_count
FROM [CUSTOMERDATA].dbo.shopping_trends
GROUP BY "Customer ID"
HAVING COUNT(*) > 1;

/* No duplicates */

-- Check for null values --

SELECT COUNT(*) AS null_count
FROM [CUSTOMERDATA].dbo.shopping_trends
WHERE "Review Rating" IS NULL;

SELECT
    COUNT(*) AS total_rows,
    COUNT("Customer ID") AS count_column1,
    COUNT("Item Purchased") AS count_column2,
	COUNT("Subscription Status") AS count_column3,
	COUNT("Discount Applied") AS count_column4,
   
    SUM(CASE WHEN "Customer ID" IS NULL THEN 1 ELSE 0 END) AS null_count_column1,
    SUM(CASE WHEN "Item Purchased" IS NULL THEN 1 ELSE 0 END) AS null_count_column2,
	SUM(CASE WHEN "Subscription Status" IS NULL THEN 1 ELSE 0 END) AS null_count_column3,
	SUM(CASE WHEN "Discount Applied" IS NULL THEN 1 ELSE 0 END) AS null_count_column4

       )
FROM
    [CUSTOMERDATA].dbo.shopping_trends;

/* our dataset doesn't seem to have any missing values */


-- Demographic Segmentation --

-- Age --
SELECT 
    CASE
        WHEN Age < 18 THEN 'Under 18'
        WHEN Age BETWEEN 18 AND 25 THEN '18-25'
        WHEN Age BETWEEN 26 AND 40 THEN '26-40'
        ELSE '40+'
    END AS AgeGroup,
	COUNT("Customer ID") AS TotalCustomers,
	SUM("Purchase Amount (USD)") AS TotalSpend,
	SUM("Previous Purchases" + 1) AS TotalPurchases
FROM [CUSTOMERDATA].dbo.shopping_trends
GROUP BY 
    CASE
        WHEN Age < 18 THEN 'Under 18'
        WHEN Age BETWEEN 18 AND 25 THEN '18-25'
        WHEN Age BETWEEN 26 AND 40 THEN '26-40'
        ELSE '40+'
    END
ORDER BY 
    TotalSpend DESC;

/* The +40 age category make the most purchase and spend the highest amounts */


-- Gender --

SELECT Gender,  
   COUNT("Customer ID") AS TotalCustomers,
   SUM("Purchase Amount (USD)") AS TotalSpend, 
   SUM("Previous Purchases" + 1) AS TotalPurchases
FROM [CUSTOMERDATA].dbo.shopping_trends
GROUP BY Gender
ORDER BY 
    TotalSpend DESC

/* Males make the most purchases and the spend the highest amounts */

-- Location --

SELECT Location, 
     COUNT("Customer ID") AS TotalCustomers,
     SUM("Purchase Amount (USD)") AS TotalSpend,
	 SUM("Previous Purchases" + 1) AS TotalPurchases
FROM [CUSTOMERDATA].dbo.shopping_trends
GROUP BY Location
ORDER BY 
    TotalCustomers DESC

/* Most of the clients are from Montana (96 clients), California(95), Idaho(93), Illinois(92), people from these locations make. 
Rhode Island and Kanas is where we have the least number of clients (63). Overall we can say that the customer base is, to some extent, evenly spread 
across the 50 locations*/

SELECT Location, 
     COUNT("Customer ID") AS TotalCustomers,
     SUM("Purchase Amount (USD)") AS TotalSpend,
	 SUM("Previous Purchases" + 1) AS TotalPurchases
FROM [CUSTOMERDATA].dbo.shopping_trends
GROUP BY Location
ORDER BY 
    TotalPurchases DESC

/* Illinois (2539 purchases), Alabama (2532) and Montana (2522) are where most of our purchase come from. Rhode Island and Kanas are the location
whith the least purchase */


SELECT Location, 
     COUNT("Customer ID") AS TotalCustomers,
     SUM("Purchase Amount (USD)") AS TotalSpend,
	 SUM("Previous Purchases" + 1) AS TotalPurchases
FROM [CUSTOMERDATA].dbo.shopping_trends
GROUP BY Location
ORDER BY 
    TotalSpend DESC

/* Montana, Illinois, California are where our top spenders come from. Clients from Hawaii, Kansas spend the least. */


-- Behavioral Segmentation --

-- Frequency of Purchase --

SELECT "Frequency of Purchases", COUNT("Customer ID") AS TotalCustomers
FROM [CUSTOMERDATA].dbo.shopping_trends
GROUP BY "Frequency of Purchases"
ORDER BY TotalCustomers DESC

/* Most of our customers purchase every 3 months. Weekly purchases is least common frequency. But we notice that there is no significant differences
between the 7 categories of purchase frequency */


-- Total Purchases --

SELECT "Customer ID", SUM("Previous Purchases" + 1) AS TotalPurchases
FROM [CUSTOMERDATA].dbo.shopping_trends
GROUP BY "Customer ID"
ORDER BY 
    TotalPurchases DESC


SELECT
    "Previous Purchases" + 1 AS TotalPurchases,
    COUNT("Customer ID") AS TotalCustomers
FROM
    [CUSTOMERDATA].dbo.shopping_trends
GROUP BY
    "Previous Purchases"
ORDER BY
    TotalCustomers DESC;

/* Most of our customers tend to make multiple purchases */


-- Product Categories --
SELECT COUNT("Customer ID") AS TotalCustomers, Category 
FROM [CUSTOMERDATA].dbo.shopping_trends
GROUP BY
    Category
ORDER BY
    TotalCustomers DESC;

/* The category our customers tend to buy the most from is clothing, the least commun category is outwear*/


-- Purchased Items --

SELECT COUNT("Customer ID") AS TotalCustomers, "Item Purchased"
FROM [CUSTOMERDATA].dbo.shopping_trends
GROUP BY
    "Item Purchased" 
ORDER BY
    TotalCustomers DESC;

/* The most purchased items are: Blouse, Pants, Jewelry. The least purchased item is Jeans */


-- Subscription Status --

SELECT COUNT("Customer ID") AS TotalCustomers, "Subscription Status"
FROM [CUSTOMERDATA].dbo.shopping_trends
GROUP BY
    "Subscription Status"
ORDER BY
    TotalCustomers DESC;

/* The number of customers with no subscription (2847) is way higher than the ones who do ave a subscription (1053) */


-- Payment Method --

SELECT COUNT("Customer ID") AS TotalCustomers, "Payment Method"
FROM [CUSTOMERDATA].dbo.shopping_trends
GROUP BY
    "Payment Method"
ORDER BY
    TotalCustomers DESC;

/* The most used payment method is credit card, while bank transfer is the least used. But there is no significant difference in the number of clients 
using each of the six methods */


--  Shipping Type --

SELECT COUNT("Customer ID") AS TotalCustomers, "Shipping Type"
FROM [CUSTOMERDATA].dbo.shopping_trends
GROUP BY
    "Shipping Type"
ORDER BY
    TotalCustomers DESC;

/* The most used Shipping Type is Free Shipping, while 2-Day Shipping is the least used. But there is no significant difference in the number of clients 
using each of the shipping types */



SELECT "Discount Applied", COUNT("Customer ID") AS TotalCustomers,  AVG("Purchase Amount (USD)") as Average_Amount_Spent
FROM [CUSTOMERDATA].dbo.shopping_trends
GROUP BY
    "Discount Applied";

/* The number of customers that got a discount (1677) is less than those who didn't (2223). The average amount spent by the first category
is 1 USD less than the second category */



