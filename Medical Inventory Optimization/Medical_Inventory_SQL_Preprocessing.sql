
-- DATA CLEANING & EDA IN SQL FOR MEDICAL INVENTORY OPTIMIZATION

--Delete Duplicates
DELETE FROM medical_inventory
WHERE row id NOT IN (
    SELECT MIN(rowid)
    FROM medical_inventory
    GROUP BY Patient_ID, Dateofbill, Drug_Name
);

-- 2. Handle missing values
-- Fill null quantities with 0
UPDATE medical_inventory
SET Quantity = 0
WHERE Quantity IS NULL;

-- Fill missing department with 'Unknown'
UPDATE medical_inventory
SET Dept = 'Unknown'
WHERE Dept IS NULL;

-- 3. Extract date features
ALTER TABLE medical_inventory ADD COLUMN Bill_Month INT;
ALTER TABLE medical_inventory ADD COLUMN Bill_Year INT;

UPDATE medical_inventory
SET Bill_Month = EXTRACT(MONTH FROM Dateofbill),
    Bill_Year = EXTRACT(YEAR FROM Dateofbill);

-- 4. Create Bounce_Flag (1 if Final_Sales = 0)
ALTER TABLE medical_inventory ADD COLUMN Bounce_Flag INT;

UPDATE medical_inventory
SET Bounce_Flag = CASE 
    WHEN Final_Sales = 0 THEN 1
    ELSE 0
END;

-- 5. Create Net_Quantity and Net_Sale
ALTER TABLE medical_inventory ADD COLUMN Net_Quantity INT;
ALTER TABLE medical_inventory ADD COLUMN Net_Sale FLOAT;

UPDATE medical_inventory
SET Net_Quantity = Quantity - ReturnQuantity,
    Net_Sale = Final_Sales - RtnMRP;

-- 6. Basic EDA queries
-- Count of bounce cases by department
SELECT Dept, COUNT(*) AS Bounce_Count
FROM medical_inventory
WHERE Bounce_Flag = 1
GROUP BY Dept
ORDER BY Bounce_Count DESC;

-- Top 5 most returned drugs
SELECT Drug_Name, SUM(ReturnQuantity) AS Total_Returns
FROM medical_inventory
GROUP BY Drug_Name
ORDER BY Total_Returns DESC
LIMIT 5;

-- Sales trend by month
SELECT Bill_Year, Bill_Month, SUM(Final_Sales) AS Monthly_Sales
FROM medical_inventory
GROUP BY Bill_Year, Bill_Month
ORDER BY Bill_Year, Bill_Month;
