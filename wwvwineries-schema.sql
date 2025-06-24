-- Mateus Conaway and Kaylah Tan
-- 05/05/24
-- CS302: Databases

-- WWV Wineries
-- Create schema and table statements 

DROP SCHEMA IF EXISTS wwvwineries_schema;

CREATE SCHEMA wwvwineries_schema;

-- Region table
CREATE TABLE Region (
Region_ID TINYINT UNSIGNED,
Name VARCHAR(30),
PRIMARY KEY (Region_ID)
);

-- Winery table
CREATE TABLE Winery (
Region_ID TINYINT UNSIGNED,
Winery_ID TINYINT UNSIGNED,
Address VARCHAR(200),
Name VARCHAR(100),
Email VARCHAR(50),
Phone_Number VARCHAR(15),
PRIMARY KEY (Winery_ID)
);

-- Wines table 
CREATE TABLE Wines (
Winery_ID TINYINT UNSIGNED,
Name VARCHAR(100),
Category_Type VARCHAR(100),
Varietal VARCHAR(100),
Alcohol_Percentage DECIMAL(4,2),
Vintage YEAR,
Price DECIMAL(5,2)
);

-- Operating hours table
CREATE TABLE Operating_Hours (
Winery_ID TINYINT UNSIGNED,
Days_Of_Week SET('Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'),
Open TIME,
Close TIME
);
ALTER TABLE wwvwineries_schema.Operating_Hours
MODIFY COLUMN Days_Of_Week VARCHAR(100);
