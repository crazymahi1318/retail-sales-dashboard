-- ============================================
-- Superstore SQL Queries
-- Retail Sales Dashboard Project
-- ============================================

-- 1️⃣ Create table (if needed)
-- Replace with your CSV import if using MySQL Workbench
CREATE TABLE IF NOT EXISTS superstore (
    OrderID VARCHAR(20),
    OrderDate DATE,
    ShipDate DATE,
    ShipMode VARCHAR(50),
    CustomerID VARCHAR(20),
    CustomerName VARCHAR(100),
    Segment VARCHAR(50),
    Country VARCHAR(50),
    City VARCHAR(50),
    State VARCHAR(50),
    PostalCode VARCHAR(20),
    Region VARCHAR(50),
    ProductID VARCHAR(20),
    Category VARCHAR(50),
    SubCategory VARCHAR(50),
    ProductName VARCHAR(150),
    Sales DECIMAL(10,2),
    Quantity INT,
    Discount DECIMAL(5,2),
    Profit DECIMAL(10,2)
);

-- 2️⃣ Top 10 Customers by Sales
SELECT CustomerName, SUM(Sales) AS Total_Sales
FROM superstore
GROUP BY CustomerName
ORDER BY Total_Sales DESC
LIMIT 10;

-- 3️⃣ Top 10 Products by Sales
SELECT ProductName, SUM(Sales) AS Total_Sales
FROM superstore
GROUP BY ProductName
ORDER BY Total_Sales DESC
LIMIT 10;

-- 4️⃣ Sales by Category
SELECT Category, SUM(Sales) AS Total_Sales, SUM(Profit) AS Total_Profit
FROM superstore
GROUP BY Category;

-- 5️⃣ Sales by Region
SELECT Region, SUM(Sales) AS Total_Sales, SUM(Profit) AS Total_Profit
FROM superstore
GROUP BY Region;

-- 6️⃣ Monthly Sales Trend
SELECT DATE_FORMAT(OrderDate, '%Y-%m') AS Month, SUM(Sales) AS Total_Sales
FROM superstore
GROUP BY Month
ORDER BY Month;

-- 7️⃣ Discount Analysis
SELECT Discount, SUM(Sales) AS Total_Sales, SUM(Profit) AS Total_Profit
FROM superstore
GROUP BY Discount
ORDER BY Discount;

-- 8️⃣ Profit Margin by SubCategory
SELECT SubCategory, SUM(Profit)/SUM(Sales) AS Profit_Margin
FROM superstore
GROUP BY SubCategory
ORDER BY Profit_Margin DESC;

-- 9️⃣ Top 5 States by Profit
SELECT State, SUM(Profit) AS Total_Profit
FROM superstore
GROUP BY State
ORDER BY Total_Profit DESC
LIMIT 5;

-- 10️⃣ Sales vs Quantity Correlation (for visualization)
SELECT Sales, Quantity
FROM superstore;

-- Optional: Any custom queries for KPIs, e.g., avg discount, avg profit per order
SELECT AVG(Discount) AS Avg_Discount, AVG(Profit) AS Avg_Profit
FROM superstore;
