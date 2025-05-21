use da;
-- Q1: Orders shipped via 'Economy' mode with total amount > ₹25,000
-- sql

SELECT *
FROM sales
WHERE Ship_Mode = 'Economy'
  AND Total_Amount > 25000;
-- Q2: Technology sales in Ireland after 2020-01-01
-- sql

SELECT *
FROM sales
WHERE Category = 'Technology'
  AND Country = 'Ireland'
  AND Order_Date > '01-01-2020';
-- Q3: Top 10 most profitable sales transactions (descending order)
-- sql

SELECT *
FROM sales
ORDER BY Unit_Profit * Sold_Quantity DESC
LIMIT 10;
-- Q4: Customers whose names start with 'J' and end with 'n'
-- sql

SELECT *
FROM sales
WHERE Customer_Name LIKE 'J%n';
-- Q5: Product names that contain 'Acco'
-- sql

SELECT DISTINCT Product_Name
FROM sales
WHERE Product_Name LIKE '%Acco%';
-- Q6: Top 5 cities with the highest total sales amount
-- sql

SELECT City, SUM(Total_Amount) AS Total_Sales
FROM sales_data
GROUP BY City
ORDER BY Total_Sales DESC
LIMIT 5;
-- Q7: Total revenue, average unit cost, and total number of orders
-- sql

SELECT 
    SUM(Total_Amount) AS Total_Revenue,
    AVG(Unit_Cost) AS Average_Unit_Cost,
    COUNT(DISTINCT Order_ID) AS Total_Orders
FROM sales;
-- Q8: Total sales per product category
-- sql

SELECT Category, SUM(Total_Amount) AS Total_Sales
FROM sales
GROUP BY Category;
-- Q9: Customers with orders worth more than ₹50,000
-- sql

SELECT Customer_Name, SUM(Total_Amount) AS Customer_Total
FROM sales
GROUP BY Customer_Name
HAVING SUM(Total_Amount) > 50000;
-- Q10: Top 5 customers by sales revenue using DENSE_RANK()
-- sql

SELECT Customer_Name,SUM(Total_Amount) AS Total_Sales, 
DENSE_RANK() OVER (ORDER BY SUM(Total_Amount) DESC) AS Rnk
FROM sales
GROUP BY Customer_Name
order by rnk
limit 5;


