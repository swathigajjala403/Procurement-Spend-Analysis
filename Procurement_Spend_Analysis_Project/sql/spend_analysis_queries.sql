-- Procurement Spend Analysis: example SQL queries
-- Adapt table/column names to your database. Data is synthetic.

-- 1. Total spend by category
SELECT Category, SUM(Spend_USD) AS total_spend
FROM procurement_transactions
WHERE Spend_USD > 0
GROUP BY Category
ORDER BY total_spend DESC;

-- 2. Monthly spend trend (syntax may vary by SQL database)
SELECT EXTRACT(YEAR FROM Transaction_Date) AS spend_year,
       EXTRACT(MONTH FROM Transaction_Date) AS spend_month,
       SUM(Spend_USD) AS total_spend
FROM procurement_transactions
WHERE Spend_USD > 0
GROUP BY EXTRACT(YEAR FROM Transaction_Date), EXTRACT(MONTH FROM Transaction_Date)
ORDER BY spend_year, spend_month;

-- 3. Supplier spend concentration
SELECT Supplier_Name, SUM(Spend_USD) AS total_spend,
       SUM(Spend_USD) / NULLIF((SELECT SUM(Spend_USD)
                                FROM procurement_transactions
                                WHERE Spend_USD > 0), 0) AS spend_share
FROM procurement_transactions
WHERE Spend_USD > 0
GROUP BY Supplier_Name
ORDER BY total_spend DESC;

-- 4. Identify records needing data-quality review
SELECT *
FROM procurement_transactions
WHERE Supplier_Name IS NULL OR TRIM(Supplier_Name) = ''
   OR Category IS NULL OR TRIM(Category) = ''
   OR Spend_USD IS NULL OR Spend_USD <= 0;

-- 5. Potential supplier-name variants (manual review required)
SELECT Supplier_Name, COUNT(*) AS transaction_count, SUM(Spend_USD) AS total_spend
FROM procurement_transactions
GROUP BY Supplier_Name
ORDER BY transaction_count DESC;
