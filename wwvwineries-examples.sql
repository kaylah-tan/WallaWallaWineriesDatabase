-- Mateus Conaway and Kaylah Tan
-- 05/05/24
-- CS302: Databases 

-- WWV Wineries

-- Sample queries that answer our project proposal questions: -- What are the names of wines that have an alcohol percentage of less than 13.5%?
SELECT Name, Alcohol_Percentage
FROM Wines
WHERE Alcohol_Percentage < 13.5;

-- How many wineries are in each region?
SELECT Region.Name, COUNT(Winery.Winery_ID) AS number_of_wineries
FROM Region
LEFT JOIN Winery ON Region.Region_ID = Winery.Region_ID
GROUP BY Region.Name;

-- Which wineries offer Rose wines?
SELECT Winery.Name, Category_Type
FROM Winery
INNER JOIN Wines ON Winery.Winery_ID = Wines.Winery_ID 
WHERE Category_Type = 'Rose'
GROUP BY Winery.Winery_ID, Winery.Name;

-- Which wineries offer Sparkling wines?
SELECT Winery.Name, Category_Type
FROM Winery
INNER JOIN Wines ON Winery.Winery_ID = Wines.Winery_ID 
WHERE Category_Type = 'Sparkling'
GROUP BY Winery.Winery_ID, Winery.Name;

-- Which wineries have wines with a vintage from 2022? How many of these wines do each of these wineries have?
SELECT Winery.Name, COUNT(*)
FROM Winery
INNER JOIN Wines ON Winery.Winery_ID = Wines.Winery_ID 
WHERE Vintage = 2022
GROUP BY Winery.Winery_ID, Winery.Name
ORDER BY COUNT(*) DESC;

-- Which winery has the most amount of white wines?
SELECT Winery.Name, COUNT(*)
FROM Winery
INNER JOIN Wines ON Winery.Winery_ID = Wines.Winery_ID 
WHERE Category_Type = "White"
GROUP BY Winery.Winery_ID, Winery.Name
ORDER BY COUNT(*) DESC
LIMIT 1;

-- Which wines are less than $50? Start with the cheapest wines.
SELECT Wines.Name, Wines.Price
FROM Wines
WHERE Price < 50
ORDER BY Wines.Price;

-- What wineries offer White wines and are open on wednesdays? When do these wineries open and close?
SELECT DISTINCT Winery.Name, Operating_Hours.Open, Operating_Hours.Close
FROM Winery
INNER JOIN Operating_Hours ON Winery.Winery_ID = Operating_Hours.Winery_ID
INNER JOIN Wines ON Winery.Winery_ID = Wines.Winery_ID 
WHERE Category_Type = 'White' 
  AND Operating_Hours.Days_Of_Week LIKE '%Wednesday%'
  AND Operating_Hours.Open IS NOT NULL
  AND Operating_Hours.Close IS NOT NULL;


-- What are the names and addresses of all wineries on Main Street?
SELECT Winery.Name, Winery.Address
FROM Winery
WHERE Winery.Address LIKE '%Main%';

-- Examples that call our stored procedures below:

-- What are the wineries that sell alcohol within the range of 13.0% and 15%? Includes the wine name and category.
CALL AlcoholPercentage('13.0', '15.0');

-- What wineries are available of on Monday from 12:00:00 - 6:00:00?
CALL AvailableWineryHours('Monday', '12:00:00', '6:00:00');

-- What wineries sell red wines and have at least 10? Includes the count, name of the winery, and the address.
CALL CertainAmount('Red', 10);

-- What wineries sell sparkling wine? Include how many bottles each winery has. 
CALL ListofWineriesThatSell('Sparkling');

-- What wines are priced within $75 through $150? Includes the name of the winery and the category.
CALL PriceRange('75', '150');

-- What wineries sell merlot wines? Includes the winery name and wine name. 
CALL Varietals('Merlot');

-- How many wineries are in airport district? 
CALL WineriesinRegion('Airport District');

-- What are the name of the wineries in airport district? Includes the address and phone number.
CALL WineryNamesInRegion('Airport District');

-- Example of function below:
SELECT Winery.Name, price_amenities(100) AS Price_Amenities
FROM Winery;

-- Example of view below:
SELECT * FROM closed_operating_hours;