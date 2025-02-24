CREATE DATABASE RETAILDB_DEV;
USE DATABASE RETAILDB_DEV;

--CREATE OR REPLACE DATABASE RETAILDB_DEV;
CREATE OR REPLACE SCHEMA RETAILDB_DEV.RAW;
USE SCHEMA RETAILDB_DEV.RAW;


CREATE SCHEMA RAW_PRODUCT; --PRODUCTS,CATEGORIES,INVENTORY, 
CREATE SCHEMA RAW_Procurement; --SUPPLIERS,PURCHASEORDERS, PURCHASEORDERDETAILS
CREATE SCHEMA RAW_HR; --STORES, EMPLOYEES
CREATE SCHEMA RAW_Sales; 	--CUSTOMERS, SALES, SALEDETAILS

--Product	:PRODUCTS, CATEGORIES, INVENTORY
--Procurement	:SUPPLIERS, PURCHASEORDERS, PURCHASEORDERDETAILS
--Sales/Customer
--Store/Employee	



-- #
-- Stores

CREATE OR REPLACE TABLE  RETAILDB_DEV.RAW_HR.Stores (
StoreID VARCHAR(255) PRIMARY KEY 
,StoreName VARCHAR(100) NOT NULL
,Location VARCHAR(255) NOT NULL
,ContactNumber VARCHAR(20)
,ManagerID VARCHAR(255)
--,FOREIGN KEY (ManagerID) REFERENCES Employees(EmployeeID)
);


INSERT INTO RETAILDB_DEV.RAW_HR.Stores (StoreID, StoreName, Location, ContactNumber, ManagerID) VALUES
('STR001', 'Downtown Supermart', '123 Main Street, New York, NY', '212-555-1234', 'EMP101'),
('STR002', 'City Center Grocery', '456 Broadway Ave, Chicago, IL', '312-555-5678', 'EMP102'),
('STR003', 'West End Market', '789 Sunset Blvd, Los Angeles, CA', '213-555-7890', 'EMP103'),
('STR004', 'Suburban Essentials', '1011 Oak Drive, Houston, TX', '713-555-2345', 'EMP104'),
('STR005', 'Metro Quick Stop', '1314 Maple Road, San Francisco, CA', '415-555-6789', 'EMP105'),
('STR006', 'Neighborhood Mart', '1516 Pine Street, Miami, FL', '305-555-4567', 'EMP106'),
('STR007', 'Lakeside Grocery', '1718 Willow Lane, Seattle, WA', '206-555-8901', 'EMP107');



-- #
-- Stores



CREATE OR REPLACE TABLE  RETAILDB_DEV.RAW_Sales.Employees (
EmployeeID VARCHAR(255) PRIMARY KEY
,FirstName VARCHAR(50) NOT NULL
,LastName VARCHAR(50) NOT NULL
,Email VARCHAR(100) 
,PhoneNumber VARCHAR(20)
,HireDate DATE NOT NULL
,JobTitle VARCHAR(50)
,StoreID VARCHAR(255) 
--FOREIGN KEY (StoreID) REFERENCES Stores(StoreID)
);




INSERT INTO RETAILDB_DEV.RAW_Sales.Employees (EmployeeID, FirstName, LastName, Email, PhoneNumber, HireDate, JobTitle, StoreID) VALUES
-- Store Managers (7)
('EMP101', 'John', 'Doe', 'john.doe@retailchain.com', '212-555-1001', '2024-04-15', 'Store Manager', 'STR001'), ('EMP102', 'Alice', 'Smith', 'alice.smith@retailchain.com', '312-555-1002', '2024-04-20', 'Store Manager', 'STR002'), ('EMP103', 'Robert', 'Johnson', 'robert.johnson@retailchain.com', '213-555-1003', '2024-04-25', 'Store Manager', 'STR003'), ('EMP104', 'Emily', 'Davis', 'emily.davis@retailchain.com', '713-555-1004', '2024-04-30', 'Store Manager', 'STR004'), ('EMP105', 'Michael', 'Wilson', 'michael.wilson@retailchain.com', '415-555-1005', '2024-05-05', 'Store Manager', 'STR005'), ('EMP106', 'Sophia', 'Martinez', 'sophia.martinez@retailchain.com', '305-555-1006', '2024-05-10', 'Store Manager', 'STR006'), ('EMP107', 'Daniel', 'Brown', 'daniel.brown@retailchain.com', '206-555-1007', '2024-05-15', 'Store Manager', 'STR007'),

-- Supervisors (7)
('EMP108', 'Laura', 'Garcia', 'laura.garcia@retailchain.com', '212-555-1008', '2024-05-20', 'Supervisor', 'STR001'), ('EMP109', 'James', 'Miller', 'james.miller@retailchain.com', '312-555-1009', '2024-05-22', 'Supervisor', 'STR002'), ('EMP110', 'Emma', 'Lopez', 'emma.lopez@retailchain.com', '213-555-1010', '2024-05-25', 'Supervisor', 'STR003'), ('EMP111', 'Benjamin', 'Harris', 'benjamin.harris@retailchain.com', '713-555-1011', '2024-05-28', 'Supervisor', 'STR004'), ('EMP112', 'Olivia', 'Clark', 'olivia.clark@retailchain.com', '415-555-1012', '2024-05-30', 'Supervisor', 'STR005'), ('EMP113', 'Henry', 'Walker', 'henry.walker@retailchain.com', '305-555-1013', '2024-06-01', 'Supervisor', 'STR006'), ('EMP114', 'Ava', 'Lewis', 'ava.lewis@retailchain.com', '206-555-1014', '2024-06-05', 'Supervisor', 'STR007'),

-- Cashiers (10)
('EMP115', 'Lucas', 'Hall', 'lucas.hall@retailchain.com', '212-555-1015', '2024-06-10', 'Cashier', 'STR001'), ('EMP116', 'Mia', 'Allen', 'mia.allen@retailchain.com', '312-555-1016', '2024-06-12', 'Cashier', 'STR002'), ('EMP117', 'Ethan', 'Young', 'ethan.young@retailchain.com', '213-555-1017', '2024-06-15', 'Cashier', 'STR003'), ('EMP118', 'Charlotte', 'King', 'charlotte.king@retailchain.com', '713-555-1018', '2024-06-17', 'Cashier', 'STR004'), ('EMP119', 'Noah', 'Wright', 'noah.wright@retailchain.com', '415-555-1019', '2024-06-20', 'Cashier', 'STR005'), ('EMP120', 'Amelia', 'Scott', 'amelia.scott@retailchain.com', '305-555-1020', '2024-06-22', 'Cashier', 'STR006'), ('EMP121', 'Logan', 'Green', 'logan.green@retailchain.com', '206-555-1021', '2024-06-25', 'Cashier', 'STR007'), ('EMP122', 'Harper', 'Baker', 'harper.baker@retailchain.com', '212-555-1022', '2024-06-27', 'Cashier', 'STR001'), ('EMP123', 'William', 'Evans', 'william.evans@retailchain.com', '312-555-1030', '2024-06-29', 'Cashier', 'STR002'), ('EMP124', 'Sophia', 'Hughes', 'sophia.hughes@retailchain.com', '213-555-1036', '2024-06-30', 'Cashier', 'STR003'),
 
-- Sales Associates (12)
('EMP125', 'Alexander', 'Gonzalez', 'alexander.gonzalez@retailchain.com', '312-555-1023', '2024-06-07', 'Sales Associate', 'STR002'), ('EMP126', 'Liam', 'Nelson', 'liam.nelson@retailchain.com', '213-555-1024', '2024-06-09', 'Sales Associate', 'STR003'), ('EMP127', 'Isabella', 'Carter', 'isabella.carter@retailchain.com', '713-555-1025', '2024-06-11', 'Sales Associate', 'STR004'), ('EMP128', 'Mason', 'Mitchell', 'mason.mitchell@retailchain.com', '415-555-1026', '2024-06-13', 'Sales Associate', 'STR005'), ('EMP129', 'Evelyn', 'Perez', 'evelyn.perez@retailchain.com', '305-555-1027', '2024-06-15', 'Sales Associate', 'STR006'), ('EMP130', 'Aiden', 'Roberts', 'aiden.roberts@retailchain.com', '206-555-1028', '2024-06-18', 'Sales Associate', 'STR007'), ('EMP131', 'Gabriel', 'Ross', 'gabriel.ross@retailchain.com', '212-555-1040', '2024-06-20', 'Sales Associate', 'STR001'), ('EMP132', 'Zoe', 'Howard', 'zoe.howard@retailchain.com', '312-555-1041', '2024-06-21', 'Sales Associate', 'STR002'), ('EMP133', 'Nathan', 'Ward', 'nathan.ward@retailchain.com', '213-555-1042', '2024-06-22', 'Sales Associate', 'STR003'), ('EMP134', 'Stella', 'Murphy', 'stella.murphy@retailchain.com', '713-555-1043', '2024-06-23', 'Sales Associate', 'STR004'), ('EMP135', 'Ryan', 'Sanders', 'ryan.sanders@retailchain.com', '415-555-1044', '2024-06-24', 'Sales Associate', 'STR005'), ('EMP136', 'Lucy', 'Bennett', 'lucy.bennett@retailchain.com', '305-555-1045', '2024-06-25', 'Sales Associate', 'STR006'),

-- Stock Clerks (7)
('EMP137', 'Ella', 'Phillips', 'ella.phillips@retailchain.com', '212-555-1029', '2024-06-03', 'Stock Clerk', 'STR001'), ('EMP138', 'Grace', 'Turner', 'grace.turner@retailchain.com', '213-555-1031', '2024-06-07', 'Stock Clerk', 'STR003'), ('EMP139', 'Scarlett', 'Parker', 'scarlett.parker@retailchain.com', '415-555-1033', '2024-06-11', 'Stock Clerk', 'STR005'), ('EMP140', 'Samuel', 'Edwards', 'samuel.edwards@retailchain.com', '305-555-1034', '2024-06-13', 'Stock Clerk', 'STR006'), ('EMP141', 'Zoey', 'Collins', 'zoey.collins@retailchain.com', '206-555-1035', '2024-06-15', 'Stock Clerk', 'STR007');







CREATE OR REPLACE TABLE  RETAILDB_DEV.RAW_Procurement.Suppliers (
SupplierID VARCHAR(255) PRIMARY KEY 
,SupplierName VARCHAR(100) NOT NULL
,ContactPerson VARCHAR(100)
,ContactNumber VARCHAR(20)
,Email VARCHAR(100) 
,Address  VARCHAR(255) 
,City VARCHAR(255) 
,State VARCHAR(255) 
,ZipCode VARCHAR(255) 
,Country VARCHAR(255) 
);


INSERT INTO  RETAILDB_DEV.RAW_Procurement.Suppliers (SupplierID, SupplierName, ContactPerson, Email, ContactNumber, Address, City, State, ZipCode, Country) VALUES
('SUP_001', 'Fresh Farms Produce', 'James Anderson', 'james.anderson@freshfarms.com', '212-555-2001', '123 Greenway Blvd', 'New York', 'NY', '10001', 'USA'), ('SUP_002', 'TechGenius Electronics', 'Sophia Carter', 'sophia.carter@techgenius.com', '312-555-2002', '456 Silicon Ave', 'San Francisco', 'CA', '94103', 'USA'), ('SUP_003', 'HomeStyle Furnishings', 'Michael Lee', 'michael.lee@homestyle.com', '213-555-2003', '789 Comfort St', 'Los Angeles', 'CA', '90012', 'USA'), ('SUP_004', 'QuickWear Apparel', 'Emma Thompson', 'emma.thompson@quickwear.com', '713-555-2004', '101 Fashion Way', 'Houston', 'TX', '77002', 'USA'), ('SUP_005', 'Daily Essentials Co.', 'Daniel Robinson', 'daniel.robinson@dailyessentials.com', '415-555-2005', '258 Market St', 'Chicago', 'IL', '60601', 'USA'), ('SUP_006', 'Global Beverages Ltd.', 'Olivia Martinez', 'olivia.martinez@globalbeverages.com', '305-555-2006', '369 Beverage Rd', 'Miami', 'FL', '33101', 'USA'), ('SUP_007', 'Speedy Logistics', 'Benjamin Harris', 'benjamin.harris@speedylogistics.com', '206-555-2007', '789 Delivery Ln', 'Seattle', 'WA', '98101', 'USA'), ('SUP_008', 'Gourmet Delights', 'Ava Gonzalez', 'ava.gonzalez@gourmetdelights.com', '512-555-2008', '852 Fine Dining Ave', 'Austin', 'TX', '73301', 'USA'), ('SUP_009', 'PowerHouse Tools', 'Noah Adams', 'noah.adams@powerhousetools.com', '718-555-2009', '963 Hardware St', 'Boston', 'MA', '02108', 'USA'), ('SUP_010', 'HealthFirst Pharmacy', 'Charlotte Wilson', 'charlotte.wilson@healthfirst.com', '602-555-2010', '147 Wellness Blvd', 'Phoenix', 'AZ', '85001', 'USA'); 







CREATE OR REPLACE TABLE  RETAILDB_DEV.RAW_PRODUCT.Categories (
CategoryID VARCHAR(255) PRIMARY KEY 
,CategoryName VARCHAR(100) NOT NULL
,Description TEXT
);


INSERT INTO RETAILDB_DEV.RAW_PRODUCT.Categories (CategoryID, CategoryName, Description) VALUES
('CAT_001', 'Groceries', 'Basic grocery items including fresh produce, canned goods, and dairy products.'),
('CAT_002', 'Electronics', 'Wide range of electronics including phones, computers, and accessories.'),
('CAT_003', 'Furniture', 'Furniture for home and office including sofas, tables, and chairs.'),
('CAT_004', 'Clothing', 'Apparel for men, women, and children including seasonal collections.'),
('CAT_005', 'Toys & Games', 'Toys and games for children of all ages, from educational to recreational.'),
('CAT_006', 'Health & Beauty', 'Personal care products, cosmetics, health supplements, and skincare items.'),
('CAT_007', 'Books & Media', 'Books, movies, music, and digital media for entertainment and education.'),
('CAT_008', 'Sporting Goods', 'Sports equipment, activewear, and accessories for various sports.'),
('CAT_009', 'Home Appliances', 'Appliances for everyday use, including washing machines, refrigerators, and microwaves.'),
('CAT_010', 'Pet Supplies', 'Products for pets including food, toys, and grooming items.'),
('CAT_011', 'Automotive', 'Automotive accessories, parts, and tools for car maintenance and repair.'),
('CAT_012', 'Gardening & Outdoors', 'Outdoor and garden products, including tools, plants, and furniture.'),
('CAT_013', 'Stationery', 'Office supplies and stationery items including paper, pens, and organizers.'),
('CAT_014', 'Jewelry & Watches', 'Fashion and fine jewelry, watches, and accessories.'),
('CAT_015', 'Food & Beverages', 'Packaged food, beverages, snacks, and ready-to-eat meals.');







CREATE OR REPLACE TABLE  RETAILDB_DEV.RAW_Sales.Customers (
CustomerID VARCHAR(255) PRIMARY KEY
,FirstName VARCHAR(50) NOT NULL
,LastName VARCHAR(50) NOT NULL
,Email VARCHAR(100) UNIQUE
,PhoneNumber VARCHAR(255)
,Address VARCHAR(255)
,City VARCHAR(255)
,State VARCHAR(255)
,ZipCode VARCHAR(255)
,Country VARCHAR(255)
);




INSERT INTO RETAILDB_DEV.RAW_Sales.Customers (CustomerID, FirstName, LastName, Email, PhoneNumber, Address, City, State, ZipCode, Country) VALUES ('CUST_001', 'Kelli', 'Sanchez', 'velasquezjessica@hahn.org', '8631889795', '836 Donna Light New Debbie, CA 36293', 'Boonefurt', 'UT', '06031', 'USA'), ('CUST_002', 'Krystal', 'Olsen', 'xevans@tucker.biz', '(461)517-1287', '281 Robert Estates Apt. 212 Davidhaven, WA 68557', 'North Jenniferside', 'HI', '09289', 'USA'), ('CUST_003', 'Jeffrey', 'Hart', 'brandicurtis@sanchez.com', '3229748760', '22534 Winters Junction Suite 941 Lawrenceview, MA 65043', 'East Sandra', 'IN', '61091', 'USA'), ('CUST_004', 'Jessica', 'Reyes', 'sanchezjennifer@hotmail.com', '143-608-9548x4719', 'Unit 2452 Box 1045 DPO AE 71051', 'West Erin', 'AR', '80730', 'USA'), ('CUST_005', 'Sarah', 'Fisher', 'alexandercarroll@hester.info', '(850)910-9629', '0832 Douglas Fords Suite 803 Watsonport, AR 90441', 'Carlshire', 'FL', '58599', 'USA'), ('CUST_006', 'Anna', 'Delgado', 'xfrank@yahoo.com', '3371565421', '6470 Stacy Neck Apt. 570 South Edward, SD 69130', 'East Williambury', 'DC', '57410', 'USA'), ('CUST_007', 'Lisa', 'Lindsey', 'darren50@sutton-thomas.info', '1759842296', '23536 Melissa Villages Apt. 576 Galvanland, DE 44170', 'Daychester', 'TX', '97531', 'USA'), ('CUST_008', 'Jesus', 'Martinez', 'johnnyjenkins@yahoo.com', '277-393-0057', '35176 Craig Villages Paulmouth, DE 98069', 'New Laurie', 'AZ', '99656', 'USA'), ('CUST_009', 'Eric', 'Taylor', 'jessicagibbs@yahoo.com', '845.245.3246', '594 Ryan Vista Lake Loriview, WV 26530', 'West Steve', 'RI', '86808', 'USA'), ('CUST_010', 'Nicholas', 'King', 'monique60@gmail.com', '(810)626-9750x14588', '4245 Schroeder Well Apt. 617 New Katie, MS 70027', 'Sharonton', 'NJ', '31410', 'USA'), ('CUST_011', 'Alexander', 'Munoz', 'chelseasanchez@gmail.com', '001-989-627-1577', '943 Fuller Via Suite 667 Ericview, TN 73814', 'North William', 'TX', '51452', 'USA'), ('CUST_012', 'Alice', 'Gomez', 'woodmathew@yahoo.com', '(472)783-6754x53190', '96329 Amanda Orchard Suite 497 East Kathryn, AL 83209', 'North Jeffreystad', 'ID', '89419', 'USA'), ('CUST_013', 'Robert', 'Garrett', 'josborne@yahoo.com', '001-323-732-8188x5850', '7469 Brian Ridge Apt. 823 South Jacqueline, ID 20113', 'Weberburgh', 'TN', '53584', 'USA'), ('CUST_014', 'Lisa', 'Powell', 'tanya17@gmail.com', '(497)415-6085x0420', '56565 Teresa Mission Port Maureen, MD 26889', 'South Elizabethchester', 'IL', '40223', 'USA'), ('CUST_015', 'Melissa', 'Burke', 'douglas97@norton-davis.biz', '302-802-8564', '15081 Hopkins Row Suite 590 Newtonbury, VT 55179', 'West Melissaport', 'NM', '83571', 'USA'), ('CUST_016', 'Tiffany', 'Craig', 'jacksoneric@gmail.com', '295-633-2397', '4138 Johnson Trail Emilyton, RI 11986', 'Lake Adrianaville', 'KY', '50079', 'USA'), ('CUST_017', 'Carolyn', 'Miller', 'hurstbrady@gmail.com', '724-662-9021x35957', '869 Lisa Station Apt. 046 Gallagherville, NC 65454', 'East Meganberg', 'CA', '35610', 'USA'), ('CUST_018', 'Jennifer', 'Nunez', 'gregoryhardin@gmail.com', '(556)255-4854', '8321 Cox Crossing Suite 782 Martinfurt, MA 07861', 'Port Amberfurt', 'PA', '10003', 'USA'), ('CUST_019', 'Jennifer', 'Rangel', 'hansenelizabeth@hotmail.com', '001-480-331-6639x4092', '787 Ramirez Village Apt. 842 Rodriguezmouth, KY 76856', 'South Donaldhaven', 'ID', '77467', 'USA'), ('CUST_020', 'Tamara', 'Bowman', 'sue74@robinson.org', '929.697.5936x71537', '0497 Mark Plain South Anne, DC 62797', 'East Calebhaven', 'IN', '73156', 'USA'), ('CUST_021', 'Nicole', 'Armstrong', 'jennifer26@yahoo.com', '274-321-4095', '98125 Matthew Passage West Danielbury, UT 74041', 'Trevorfurt', 'MT', '80042', 'USA'), ('CUST_022', 'Danielle', 'Terry', 'judithmeyer@hotmail.com', '809.746.1875', '253 Reyes Common West Julian, HI 10284', 'Goodwinport', 'MS', '53019', 'USA'), ('CUST_023', 'Norman', 'Reed', 'burgesschristine@hotmail.com', '(765)405-4990x17277', 'Unit 9657 Box 4720 DPO AP 41043', 'Shahmouth', 'WA', '04158', 'USA'), ('CUST_024', 'Ashley', 'Baldwin', 'sergiolewis@gmail.com', '001-823-073-0815', '54989 Michael Village Sanchezfort, DC 43562', 'Port Steven', 'KS', '63899', 'USA'), ('CUST_025', 'Jeffrey', 'Thomas', 'bduffy@peterson.info', '251.307.5520x43901', '4963 Johnson Harbors Smithfort, WI 77224', 'South Erinburgh', 'WA', '76262', 'USA'), ('CUST_026', 'Christopher', 'Larson', 'sharonanderson@collins.com', '759.694.4663', '01700 Roberts Via East Gregoryburgh, WV 95780', 'East Feliciachester', 'NH', '36601', 'USA'), ('CUST_027', 'Joshua', 'Johnson', 'mercerjeffery@ferguson.com', '+1-889-958-2103x735', 'Unit 8090 Box 9857 DPO AP 04671', 'Lake Isabellaberg', 'NC', '69064', 'USA'), ('CUST_028', 'Robert', 'Cole', 'jeffrey13@gmail.com', '001-038-463-2502x42954', '3090 Thomas Rapids Jacquelineborough, RI 27149', 'South Kathleenmouth', 'GA', '73799', 'USA'), ('CUST_029', 'Michael', 'Davis', 'erikmorgan@gmail.com', '424-711-3594', '806 Johnson Mountain Apt. 268 Connerton, TX 36778', 'Martinbury', 'ME', '98888', 'USA'), ('CUST_030', 'Jeffrey', 'Wilson', 'crossderrick@gmail.com', '108-008-0376x9591', '91729 Lyons Rapid Apt. 467 Port Jeffrey, KS 32982', 'Morganberg', 'KY', '26923', 'USA'), ('CUST_031', 'Cory', 'Rodriguez', 'hcarroll@thompson.com', '(082)303-0433x6468', '6065 David Groves Spencerfort, WY 03171', 'East Christopherborough', 'NE', '34244', 'USA'), ('CUST_032', 'Linda', 'Hawkins', 'glennjohnson@gmail.com', '001-380-621-0547', '0210 Tammy Hill Apt. 564 West Chelseaport, AR 85926', 'Marychester', 'IA', '92463', 'USA'), ('CUST_033', 'Stacy', 'Thompson', 'charles78@gmail.com', '+1-160-933-7662x2716', '8034 Carroll Oval Suite 983 Deborahland, SC 14564', 'Wilcoxbury', 'IA', '95177', 'USA'), ('CUST_034', 'Robert', 'Hanson', 'destinyhansen@gmail.com', '+1-793-110-2041x05150', '990 Walker Avenue Bakermouth, IA 51469', 'North Becky', 'LA', '69117', 'USA'), ('CUST_035', 'Lisa', 'Kemp', 'hernandezbarbara@gmail.com', '+1-071-442-1879x075', '7200 Lindsey Ports Apt. 021 East Robertofurt, VT 98721', 'North Rodneymouth', 'FL', '47713', 'USA'), ('CUST_036', 'Amy', 'Love', 'hallmolly@johnson-brown.com', '+1-427-304-6540x2301', '52588 George Camp Hammondmouth, NJ 11110', 'Loganbury', 'UT', '07316', 'USA'), ('CUST_037', 'Leah', 'White', 'bacosta@miles.com', '3514706129', 'USNV Martinez FPO AE 42434', 'East Richard', 'CT', '62087', 'USA'), ('CUST_038', 'Amy', 'Preston', 'echase@jones.org', '+1-621-887-8367', '273 Christine Plain Lake Ann, TN 17947', 'Natashaborough', 'DE', '58924', 'USA'), ('CUST_039', 'Brooke', 'Adams', 'cliffordbowers@moore.info', '725.779.1457x692', '774 Zachary Summit Harperport, MI 57696', 'Lake Alexander', 'ND', '69875', 'USA'), ('CUST_040', 'Vanessa', 'Matthews', 'tracy43@clark.com', '(938)064-6080', '90247 Fleming Road Apt. 172 Duffychester, MD 33157', 'North Laurie', 'WV', '82465', 'USA'), ('CUST_041', 'John', 'Herring', 'wrightandrea@moore.com', '+1-629-405-7314x85223', '28430 Martin Branch Teresaview, MA 19890', 'Grantville', 'WI', '13504', 'USA'), ('CUST_042', 'Katherine', 'Huerta', 'deborahholloway@hotmail.com', '001-066-574-4504x8021', '1211 Burke Inlet Jacksonside, NC 50933', 'Charlesport', 'DE', '58768', 'USA'), ('CUST_043', 'Daniel', 'Castillo', 'karenwillis@cole-reeves.com', '+1-558-874-5514x581', 'USNV Martin FPO AP 32078', 'Rossport', 'MS', '38319', 'USA'), ('CUST_044', 'Benjamin', 'Barnes', 'pchang@nguyen.info', '237-089-6690x46783', '430 Edward Drive Suite 648 Kevinton, ID 17554', 'South Kaitlynfurt', 'NJ', '25843', 'USA'), ('CUST_045', 'Jennifer', 'Smith', 'kelly04@yahoo.com', '900.178.5956x9862', '3800 Walker Motorway Apt. 251 West Melodyside, DE 55993', 'Lindahaven', 'NY', '14906', 'USA'), ('CUST_046', 'Susan', 'Sawyer', 'careychristina@gmail.com', '(654)864-8307', 'PSC 4235, Box 1703 APO AA 23237', 'Josephton', 'NE', '08178', 'USA'), ('CUST_047', 'Victoria', 'Carroll', 'gutierrezjenna@yahoo.com', '655-974-5018x17979', '5250 Jackson Inlet Morrisside, NM 08721', 'Brettmouth', 'CO', '53770', 'USA'), ('CUST_048', 'Laura', 'Wagner', 'elizabeth18@harris.biz', '(635)574-3661x964', '1390 Wright Mountains Lake Michelle, MS 31157', 'Younghaven', 'VA', '88563', 'USA'), ('CUST_049', 'Joel', 'Booth', 'vsmith@hotmail.com', '862.510.4490x913', '3930 Richard Center Apt. 933 Lake Anitatown, HI 61088', 'North Heatherport', 'MT', '47338', 'USA'), ('CUST_050', 'Jeffrey', 'Torres', 'julia25@jones.com', '387.807.9390', '486 Becky Spurs Suite 438 South Rachel, NE 76879', 'New Jenniferstad', 'NY', '14000', 'USA'), ('CUST_051', 'Allen', 'Conrad', 'amanda13@white.com', '+1-418-595-1101x68542', '467 Joseph Corners Lake Alexandrastad, NH 29225', 'Donaldborough', 'AZ', '52199', 'USA'), ('CUST_052', 'Jason', 'Tate', 'paul90@williams.biz', '+1-240-504-9240x16594', '544 Michael Rue Apt. 008 Morganshire, OK 78704', 'Catherinemouth', 'CO', '68975', 'USA'), ('CUST_053', 'William', 'Davis', 'wardhannah@gmail.com', '001-789-970-9849', '627 Graves Valleys Apt. 341 Juliashire, UT 51840', 'Jeanneland', 'MD', '76034', 'USA'), ('CUST_054', 'Michael', 'Holmes', 'andrewortiz@hotmail.com', '814.051.8237x700', '763 Boyer Fall Suite 007 East Judy, UT 25990', 'New Natashachester', 'TX', '72044', 'USA'), ('CUST_055', 'Melissa', 'Scott', 'mendezsamuel@gmail.com', '001-075-004-2338x37033', '644 Melissa Canyon West Allen, AR 01307', 'Dianaton', 'ME', '98601', 'USA'), ('CUST_056', 'John', 'Thomas', 'kwilliams@jackson-ellis.info', '245.691.6249', '158 Alexandra Junctions Port Brent, MA 64387', 'Johnmouth', 'MN', '51238', 'USA'), ('CUST_057', 'Marilyn', 'Warner', 'uedwards@yahoo.com', '(447)241-0674x9421', '660 Elizabeth Plaza Apt. 957 Taylorland, MI 44048', 'North Amberport', 'DC', '13084', 'USA'), ('CUST_058', 'Brenda', 'Nelson', 'barmstrong@sims.com', '+1-868-831-5994', '577 Green Lights Gutierrezfurt, AK 88205', 'Anthonyborough', 'WI', '52135', 'USA'), ('CUST_059', 'Amanda', 'Newton', 'rachel48@miller.net', '105-647-0111x65608', '09375 Hunt Oval Apt. 685 Tiffanychester, TX 89603', 'West Jennifer', 'PA', '55978', 'USA'), ('CUST_060', 'Christy', 'Gray', 'kathleen14@romero.com', '001-810-868-1815x48955', '3259 Jennifer River Apt. 237 Hernandezmouth, VA 86156', 'Myersburgh', 'NJ', '15190', 'USA'), ('CUST_061', 'Kenneth', 'Brown', 'alex83@yahoo.com', '321-005-1845x33905', '2842 Morales Mills New Janice, KY 71793', 'Hunterview', 'IA', '20144', 'USA'), ('CUST_062', 'Aaron', 'Robinson', 'rachel19@day.com', '568-881-7125x6460', '07040 Martin Manor Apt. 583 Lake Devin, KS 00892', 'West Andrew', 'CA', '26344', 'USA'), ('CUST_063', 'David', 'Larson', 'mvasquez@yahoo.com', '682.996.0261x362', '64509 Lee Orchard Masonbury, OK 22219', 'Lake Frankport', 'IA', '94310', 'USA'), ('CUST_064', 'James', 'Patton', 'vargasheather@howe-anderson.biz', '025.459.1295x4253', 'Unit 2371 Box 2854 DPO AP 64615', 'Fletchermouth', 'UT', '82840', 'USA'), ('CUST_065', 'Joshua', 'Morris', 'marcusalvarado@gmail.com', '554.202.6144x470', '9220 Nelson Forges Lisamouth, KY 52295', 'West Scottfurt', 'CO', '60703', 'USA'), ('CUST_066', 'Carol', 'Schultz', 'mcasey@gmail.com', '+1-087-438-8778x39115', 'USS Schultz FPO AP 91218', 'Riveraburgh', 'VA', '47037', 'USA'), ('CUST_067', 'Lydia', 'Wise', 'ryan51@gmail.com', '001-491-878-9701', 'USS Hopkins FPO AP 00542', 'East Ronaldview', 'MS', '51181', 'USA'), ('CUST_068', 'James', 'Cummings', 'ogonzalez@hotmail.com', '+1-309-523-5860', 'USS Mckee FPO AE 13632', 'Brentburgh', 'AR', '26300', 'USA'), ('CUST_069', 'Heidi', 'Grant', 'kshelton@yahoo.com', '(300)051-7156x5463', '799 Khan Prairie Apt. 907 Jamesshire, MT 87421', 'South Meghanbury', 'DE', '93079', 'USA'), ('CUST_070', 'Vicki', 'Norris', 'vincentray@riley.com', '001-861-248-5040x069', '4556 Michael Hill Suite 500 Matthewchester, MN 88893', 'North Cynthiaborough', 'MD', '27385', 'USA'), ('CUST_071', 'Rachel', 'Brown', 'mhubbard@alvarado-medina.com', '001-658-736-9470x5929', '043 Edward Manor New Megan, LA 83877', 'Carterfurt', 'CT', '32946', 'USA'), ('CUST_072', 'Alexander', 'Hendrix', 'stephaniesmith@scott-little.biz', '(269)996-1136', 'PSC 3422, Box 4211 APO AP 72147', 'Lake Erica', 'VA', '63818', 'USA'), ('CUST_073', 'Lauren', 'Martinez', 'gary35@flores.info', '(168)424-9579x33554', '440 Misty Dam West Tanyaport, KS 16765', 'West Lisafort', 'AZ', '15598', 'USA'), ('CUST_074', 'Craig', 'Porter', 'christina54@gmail.com', '1968504450', '479 Rebecca Springs Apt. 502 Cartermouth, HI 15530', 'East Emily', 'VA', '61474', 'USA'), ('CUST_075', 'Aaron', 'James', 'alejandrahunter@yahoo.com', '(130)762-3622', '853 William Prairie Robertborough, ID 62477', 'Olsenton', 'MS', '30144', 'USA'), ('CUST_076', 'Eric', 'Hardin', 'brookskayla@yahoo.com', '001-863-425-8906x892', '03645 Catherine Mountain Apt. 106 Amberside, VA 32551', 'Longstad', 'LA', '60541', 'USA'), ('CUST_077', 'Jennifer', 'Ellis', 'kyle95@hotmail.com', '700.101.7501x4688', '940 Charlene Meadows Ibarraberg, AZ 14901', 'Lifurt', 'MO', '77423', 'USA'), ('CUST_078', 'Elizabeth', 'Robinson', 'jenniferferguson@powell-robbins.com', '638-183-2244x2615', '668 Black Pike Suite 767 New Russell, MT 55232', 'Lake Anthony', 'NY', '24479', 'USA'), ('CUST_079', 'Jonathan', 'Riley', 'mendezdonna@gmail.com', '243.540.9139x6954', '70360 Gary Knoll South Donna, SD 16589', 'South Rodney', 'TX', '88477', 'USA'), ('CUST_080', 'Diana', 'Johnson', 'kyle71@robertson.com', '609.434.9180x1896', '25147 Shannon Court Rivasberg, MO 85014', 'Amyshire', 'NJ', '03165', 'USA'), ('CUST_081', 'Ann', 'Roberts', 'oscott@gmail.com', '884.395.0872', '5669 Michael Ports Apt. 754 Dawsonside, OR 44098', 'Hernandezbury', 'SC', '27047', 'USA'), ('CUST_082', 'James', 'Dalton', 'sandra00@price-swanson.com', '693.352.1916x996', '8573 Ricardo Cliff Port David, CT 29781', 'Caitlinfurt', 'OH', '19861', 'USA'), ('CUST_083', 'Roberta', 'Sosa', 'rjohnson@yahoo.com', '2512444452', '26244 Conley Union Suite 391 West Sean, WY 12091', 'Lovetown', 'SC', '02989', 'USA'), ('CUST_084', 'Jessica', 'Adams', 'klopez@johnson.com', '+1-902-013-9229x23347', '8203 Autumn Fall Michaelside, NY 49810', 'West Tammyton', 'WI', '25183', 'USA'), ('CUST_085', 'Ryan', 'Moore', 'antonio74@yahoo.com', '975-004-2352', 'PSC 8290, Box 9383 APO AP 64994', 'Loganview', 'CT', '75262', 'USA'), ('CUST_086', 'Joseph', 'Paul', 'lauracraig@thomas.org', '626-500-7855', '57023 Marquez Springs North Kelly, DC 87537', 'West Nicoleborough', 'VA', '18538', 'USA'), ('CUST_087', 'Shannon', 'Johnson', 'kevin88@cohen-cook.org', '+1-717-861-5551x98151', '00634 Hooper Estate Apt. 010 South Tylerland, MN 88037', 'Evelynport', 'MT', '38105', 'USA'), ('CUST_088', 'Lauren', 'Perez', 'matthew67@yahoo.com', '018.292.9502', '0897 David Harbor Murrayfurt, IN 34441', 'Lake Reginatown', 'RI', '24807', 'USA'), ('CUST_089', 'Regina', 'Hamilton', 'cabbott@gregory.com', '373.654.7014x9247', '54157 Patrick Harbors Apt. 547 Roblesbury, NH 37912', 'Alvarezport', 'VT', '18026', 'USA'), ('CUST_090', 'Angela', 'Snyder', 'foxrobert@li-everett.com', '001-460-048-3064x54183', '93177 Joseph Cape Apt. 993 South Masonberg, AZ 02201', 'Hollyfort', 'IL', '54084', 'USA'), ('CUST_091', 'Jennifer', 'Alvarez', 'william28@yahoo.com', '+1-364-455-3575x138', 'PSC 9067, Box 4189 APO AP 80130', 'West Lindamouth', 'SC', '06462', 'USA'), ('CUST_092', 'Emily', 'Schwartz', 'rachel31@lewis-peterson.com', '001-256-286-8082', '9356 Dorsey Drive Suite 493 Reginaldburgh, CO 94064', 'South Jacksonberg', 'GA', '48783', 'USA'), ('CUST_093', 'Thomas', 'Flores', 'stacy76@wood.com', '001-816-496-6844x72937', '5398 Harry Prairie East Richardtown, FL 70604', 'Johnsonberg', 'IA', '26611', 'USA'), ('CUST_094', 'William', 'Buck', 'burtonraymond@gross.com', '001-959-763-6583x310', '9808 Natasha Drives Gregoryton, TX 53047', 'Edwardmouth', 'VT', '89838', 'USA'), ('CUST_095', 'Kenneth', 'Hernandez', 'kwilson@wright-lee.net', '(768)855-9546x60891', '852 Eric Junctions Pinedachester, MN 47236', 'South Brucebury', 'RI', '29745', 'USA'), ('CUST_096', 'Jason', 'Knight', 'davidrobinson@hicks.info', '(494)055-8882x332', '60372 Brian Plains Apt. 864 Kimberlymouth, NM 07693', 'East Franciscoton', 'IA', '97296', 'USA'), ('CUST_097', 'Andrew', 'Acevedo', 'eddiewilliams@hotmail.com', '+1-694-968-1449x0770', '45928 Ibarra Square Apt. 089 Tamarahaven, NV 89043', 'Harrisbury', 'AK', '50202', 'USA'), ('CUST_098', 'Charles', 'Ramirez', 'johnsondaniel@santiago.com', '001-742-950-0583x9172', '593 Joseph Shore Suite 195 Adamshaven, NJ 03593', 'Fryehaven', 'NC', '07771', 'USA'), ('CUST_099', 'Sarah', 'Hudson', 'chill@hotmail.com', '(766)511-9675x661', '36120 Estes Forges Alisonside, LA 59769', 'New Johnport', 'DC', '16229', 'USA'), ('CUST_100', 'George', 'Morton', 'lisasmith@hotmail.com', '2009825590', '992 Linda Port Lake Carlos, CO 68374', 'Bernardberg', 'ME', '03548', 'USA');







CREATE OR REPLACE TABLE  RETAILDB_DEV.RAW_PRODUCT.Products (
ProductID VARCHAR(255) PRIMARY KEY
,ProductName VARCHAR(100) NOT NULL
,CategoryID VARCHAR(255) 
,SupplierID VARCHAR(255) 
,Price DECIMAL(10,2) NOT NULL
,Cost DECIMAL(10,2) NOT NULL
,StockQuantity INT DEFAULT 0
,IsActive BOOLEAN DEFAULT TRUE
--,FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
--,FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID)

);

INSERT INTO RETAILDB_DEV.RAW_PRODUCT.Products  (ProductID, ProductName, CategoryID, SupplierID, Price, Cost, StockQuantity, IsActive) VALUES
-- Groceries (CAT_001) - Supplier: SUP_001
('PROD_001', 'Fresh Apples', 'CAT_001', 'SUP_001', 2.99, 1.50, 150, TRUE),
('PROD_002', 'Organic Bananas', 'CAT_001', 'SUP_001', 1.99, 1.00, 200, TRUE),
('PROD_003', 'Whole Milk (1 Gallon)', 'CAT_001', 'SUP_001', 3.49, 2.20, 100, TRUE),
('PROD_004', 'Brown Bread Loaf', 'CAT_001', 'SUP_001', 2.49, 1.40, 120, TRUE),
('PROD_005', 'Cheddar Cheese (8 oz)', 'CAT_001', 'SUP_001', 4.99, 3.20, 80, TRUE),
('PROD_006', 'Eggs (Dozen)', 'CAT_001', 'SUP_001', 2.79, 1.60, 130, TRUE),
('PROD_007', 'Orange Juice (1L)', 'CAT_001', 'SUP_001', 3.99, 2.50, 90, TRUE),
('PROD_008', 'Cereal (500g)', 'CAT_001', 'SUP_001', 4.29, 2.80, 110, TRUE),
('PROD_009', 'Rice (5 lb)', 'CAT_001', 'SUP_001', 5.99, 3.50, 70, TRUE),

-- Electronics (CAT_002) - Supplier: SUP_002
('PROD_010', 'Smartphone X100', 'CAT_002', 'SUP_002', 699.99, 500.00, 50, TRUE),
('PROD_011', 'Bluetooth Headphones', 'CAT_002', 'SUP_002', 89.99, 60.00, 120, TRUE),
('PROD_012', 'Laptop Pro 15', 'CAT_002', 'SUP_002', 1199.99, 900.00, 40, TRUE),
('PROD_013', '4K LED TV 42"', 'CAT_002', 'SUP_002', 399.99, 280.00, 30, TRUE),
('PROD_014', 'Wireless Speaker', 'CAT_002', 'SUP_002', 129.99, 80.00, 70, TRUE),
('PROD_015', 'Digital Camera ZX', 'CAT_002', 'SUP_002', 549.99, 400.00, 35, TRUE),
('PROD_016', 'Gaming Console Y', 'CAT_002', 'SUP_002', 299.99, 220.00, 60, TRUE),
('PROD_017', 'Tablet A10', 'CAT_002', 'SUP_002', 249.99, 180.00, 80, TRUE),
('PROD_018', 'Smartwatch Series 5', 'CAT_002', 'SUP_002', 199.99, 150.00, 90, TRUE),

-- Furniture (CAT_003) - Supplier: SUP_003
('PROD_019', 'Modern Sofa', 'CAT_003', 'SUP_003', 499.99, 350.00, 20, TRUE),
('PROD_020', 'Dining Table Set', 'CAT_003', 'SUP_003', 599.99, 450.00, 15, TRUE),
('PROD_021', 'Office Chair Ergonomic', 'CAT_003', 'SUP_003', 149.99, 100.00, 40, TRUE),
('PROD_022', 'Coffee Table', 'CAT_003', 'SUP_003', 89.99, 60.00, 35, TRUE),
('PROD_023', 'Bookshelf 5-Tier', 'CAT_003', 'SUP_003', 129.99, 90.00, 30, TRUE),
('PROD_024', 'Queen Bed Frame', 'CAT_003', 'SUP_003', 399.99, 280.00, 25, TRUE),
('PROD_025', 'Wardrobe', 'CAT_003', 'SUP_003', 349.99, 250.00, 20, TRUE),
('PROD_026', 'Recliner Chair', 'CAT_003', 'SUP_003', 299.99, 210.00, 15, TRUE),
('PROD_027', 'TV Stand', 'CAT_003', 'SUP_003', 179.99, 130.00, 30, TRUE),

-- Clothing (CAT_004) - Supplier: SUP_004
('PROD_028', 'Men\'s T-Shirt', 'CAT_004', 'SUP_004', 19.99, 10.00, 100, TRUE),
('PROD_029', 'Women\'s Blouse', 'CAT_004', 'SUP_004', 29.99, 15.00, 90, TRUE),
('PROD_030', 'Jeans (Unisex)', 'CAT_004', 'SUP_004', 39.99, 20.00, 80, TRUE),
('PROD_031', 'Summer Dress', 'CAT_004', 'SUP_004', 49.99, 25.00, 70, TRUE),
('PROD_032', 'Jacket (Men)', 'CAT_004', 'SUP_004', 59.99, 35.00, 60, TRUE),
('PROD_033', 'Skirt (Women)', 'CAT_004', 'SUP_004', 34.99, 18.00, 75, TRUE),
('PROD_034', 'Sweater', 'CAT_004', 'SUP_004', 44.99, 28.00, 65, TRUE),
('PROD_035', 'Shorts (Men)', 'CAT_004', 'SUP_004', 24.99, 14.00, 85, TRUE),
('PROD_036', 'Leggings (Women)', 'CAT_004', 'SUP_004', 19.99, 10.00, 90, TRUE),

-- Toys & Games (CAT_005) - Supplier: SUP_005
('PROD_037', 'Building Blocks Set', 'CAT_005', 'SUP_005', 24.99, 15.00, 150, TRUE),
('PROD_038', 'Puzzle 500 Pieces', 'CAT_005', 'SUP_005', 14.99, 8.00, 140, TRUE),
('PROD_039', 'Board Game Classic', 'CAT_005', 'SUP_005', 29.99, 18.00, 130, TRUE),
('PROD_040', 'Action Figures Pack', 'CAT_005', 'SUP_005', 19.99, 12.00, 160, TRUE),
('PROD_041', 'Doll with Accessories', 'CAT_005', 'SUP_005', 34.99, 20.00, 120, TRUE),
('PROD_042', 'Remote Control Car', 'CAT_005', 'SUP_005', 39.99, 25.00, 110, TRUE),
('PROD_043', 'Toy Train Set', 'CAT_005', 'SUP_005', 49.99, 30.00, 100, TRUE),
('PROD_044', 'Stuffed Animal', 'CAT_005', 'SUP_005', 19.99, 10.00, 170, TRUE),
('PROD_045', 'Educational Game', 'CAT_005', 'SUP_005', 24.99, 15.00, 150, TRUE),

-- Health & Beauty (CAT_006) - Supplier: SUP_006
('PROD_046', 'Shampoo 500ml', 'CAT_006', 'SUP_006', 7.99, 4.50, 200, TRUE),
('PROD_047', 'Conditioner 500ml', 'CAT_006', 'SUP_006', 7.99, 4.50, 200, TRUE),
('PROD_048', 'Body Lotion 250ml', 'CAT_006', 'SUP_006', 9.99, 6.00, 180, TRUE),
('PROD_049', 'Face Cream 50ml', 'CAT_006', 'SUP_006', 14.99, 9.00, 150, TRUE),
('PROD_050', 'Lip Balm', 'CAT_006', 'SUP_006', 2.99, 1.50, 220, TRUE),
('PROD_051', 'Perfume 100ml', 'CAT_006', 'SUP_006', 29.99, 18.00, 100, TRUE),
('PROD_052', 'Hair Serum', 'CAT_006', 'SUP_006', 19.99, 12.00, 120, TRUE),
('PROD_053', 'Sunscreen SPF 30', 'CAT_006', 'SUP_006', 12.99, 7.50, 130, TRUE),
('PROD_054', 'Nail Polish', 'CAT_006', 'SUP_006', 5.99, 3.00, 140, TRUE),

-- Home Appliances (CAT_007) - Supplier: SUP_007
('PROD_055', 'Microwave Oven', 'CAT_007', 'SUP_007', 99.99, 70.00, 50, TRUE),
('PROD_056', 'Refrigerator 18 cu.ft', 'CAT_007', 'SUP_007', 499.99, 350.00, 20, TRUE),
('PROD_057', 'Washing Machine', 'CAT_007', 'SUP_007', 399.99, 300.00, 25, TRUE),
('PROD_058', 'Air Conditioner 1.5 Ton', 'CAT_007', 'SUP_007', 299.99, 210.00, 30, TRUE),
('PROD_059', 'Vacuum Cleaner', 'CAT_007', 'SUP_007', 149.99, 100.00, 40, TRUE),
('PROD_060', 'Dishwasher', 'CAT_007', 'SUP_007', 349.99, 250.00, 15, TRUE),
('PROD_061', 'Coffee Maker', 'CAT_007', 'SUP_007', 49.99, 30.00, 70, TRUE),
('PROD_062', 'Toaster', 'CAT_007', 'SUP_007', 29.99, 18.00, 80, TRUE),
('PROD_063', 'Electric Kettle', 'CAT_007', 'SUP_007', 39.99, 25.00, 90, TRUE),

-- Pet Supplies (CAT_008) - Supplier: SUP_008
('PROD_064', 'Dog Food (10 lb)', 'CAT_008', 'SUP_008', 24.99, 15.00, 150, TRUE),
('PROD_065', 'Cat Food (5 lb)', 'CAT_008', 'SUP_008', 19.99, 12.00, 140, TRUE),
('PROD_066', 'Bird Seed (2 lb)', 'CAT_008', 'SUP_008', 9.99, 5.00, 200, TRUE),
('PROD_067', 'Pet Shampoo', 'CAT_008', 'SUP_008', 12.99, 7.50, 130, TRUE),
('PROD_068', 'Pet Toy', 'CAT_008', 'SUP_008', 7.99, 4.50, 180, TRUE),
('PROD_069', 'Cat Litter (20 lb)', 'CAT_008', 'SUP_008', 14.99, 9.00, 100, TRUE),
('PROD_070', 'Dog Leash', 'CAT_008', 'SUP_008', 15.99, 9.00, 120, TRUE),
('PROD_071', 'Pet Bed', 'CAT_008', 'SUP_008', 29.99, 18.00, 80, TRUE),
('PROD_072', 'Flea Treatment', 'CAT_008', 'SUP_008', 19.99, 12.00, 90, TRUE),

-- Office Supplies (CAT_009) - Supplier: SUP_009
('PROD_073', 'Ballpoint Pens (Pack of 10)', 'CAT_009', 'SUP_009', 4.99, 2.00, 300, TRUE),
('PROD_074', 'Notebook (200 pages)', 'CAT_009', 'SUP_009', 3.99, 2.50, 250, TRUE),
('PROD_075', 'Printer Paper (500 sheets)', 'CAT_009', 'SUP_009', 6.99, 4.00, 200, TRUE),
('PROD_076', 'Stapler', 'CAT_009', 'SUP_009', 8.99, 5.50, 150, TRUE),
('PROD_077', 'Desk Organizer', 'CAT_009', 'SUP_009', 12.99, 8.00, 100, TRUE),
('PROD_078', 'Whiteboard', 'CAT_009', 'SUP_009', 29.99, 20.00, 80, TRUE),
('PROD_079', 'File Folders (Pack of 5)', 'CAT_009', 'SUP_009', 5.99, 3.50, 220, TRUE),
('PROD_080', 'Highlighter Set', 'CAT_009', 'SUP_009', 7.99, 4.00, 190, TRUE),
('PROD_081', 'Scissors', 'CAT_009', 'SUP_009', 4.99, 2.50, 210, TRUE),

-- Sports & Outdoors (CAT_010) - Supplier: SUP_010
('PROD_082', 'Soccer Ball', 'CAT_010', 'SUP_010', 19.99, 10.00, 120, TRUE),
('PROD_083', 'Basketball', 'CAT_010', 'SUP_010', 24.99, 14.00, 110, TRUE),
('PROD_084', 'Tennis Racket', 'CAT_010', 'SUP_010', 49.99, 30.00, 80, TRUE),
('PROD_085', 'Running Shoes', 'CAT_010', 'SUP_010', 69.99, 45.00, 70, TRUE),
('PROD_086', 'Camping Tent', 'CAT_010', 'SUP_010', 99.99, 65.00, 50, TRUE),
('PROD_087', 'Hiking Backpack', 'CAT_010', 'SUP_010', 59.99, 40.00, 60, TRUE),
('PROD_088', 'Yoga Mat', 'CAT_010', 'SUP_010', 29.99, 18.00, 100, TRUE),
('PROD_089', 'Dumbbell Set', 'CAT_010', 'SUP_010', 79.99, 50.00, 40, TRUE),
('PROD_090', 'Cycling Helmet', 'CAT_010', 'SUP_010', 39.99, 25.00, 80, TRUE);





CREATE OR REPLACE TABLE  RETAILDB_DEV.RAW_Sales.Sales (
SaleID VARCHAR(255) PRIMARY KEY
,SaleDate DATETIME DEFAULT CURRENT_TIMESTAMP
,StoreID VARCHAR(255) 
,EmployeeID VARCHAR(255) 
,CustomerID VARCHAR(255) 
,TotalAmount DECIMAL(10,2) NOT NULL
,PaymentMethod VARCHAR(255) --ENUM('Cash', 'Credit Card', 'Debit Card', 'Online Payment') NOT NULL
--,FOREIGN KEY (StoreID) REFERENCES Stores(StoreID)
--,FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
--,FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

INSERT INTO RETAILDB_DEV.RAW_Sales.Sales (SaleID, SaleDate, StoreID, EmployeeID, CustomerID, TotalAmount, PaymentMethod) VALUES
('SALE_001', '2024-10-01 10:15:00', 'STR_001', 'EMP_101', 'CUST_001', 53.00, 'Cash'), ('SALE_002', '2024-10-02 11:30:00', 'STR_002', 'EMP_102', 'CUST_002', 56.00, 'Credit Card'), ('SALE_003', '2024-10-03 10:15:00', 'STR_003', 'EMP_103', 'CUST_003', 59.00, 'Debit Card'), ('SALE_004', '2024-10-04 11:30:00', 'STR_004', 'EMP_104', 'CUST_004', 62.00, 'Online Payment'), ('SALE_005', '2024-10-05 10:15:00', 'STR_005', 'EMP_105', 'CUST_005', 65.00, 'Cash'), ('SALE_006', '2024-10-06 11:30:00', 'STR_006', 'EMP_106', 'CUST_006', 68.00, 'Credit Card'), ('SALE_007', '2024-10-07 10:15:00', 'STR_007', 'EMP_107', 'CUST_007', 71.00, 'Debit Card'), ('SALE_008', '2024-10-08 11:30:00', 'STR_001', 'EMP_108', 'CUST_008', 74.00, 'Online Payment'), ('SALE_009', '2024-10-09 10:15:00', 'STR_002', 'EMP_109', 'CUST_009', 77.00, 'Cash'), ('SALE_010', '2024-10-10 11:30:00', 'STR_003', 'EMP_110', 'CUST_010', 80.00, 'Credit Card'), ('SALE_011', '2024-10-11 10:15:00', 'STR_004', 'EMP_111', 'CUST_011', 83.00, 'Debit Card'), ('SALE_012', '2024-10-12 11:30:00', 'STR_005', 'EMP_112', 'CUST_012', 86.00, 'Online Payment'), ('SALE_013', '2024-10-13 10:15:00', 'STR_006', 'EMP_113', 'CUST_013', 89.00, 'Cash'), ('SALE_014', '2024-10-14 11:30:00', 'STR_007', 'EMP_114', 'CUST_014', 92.00, 'Credit Card'), ('SALE_015', '2024-10-15 10:15:00', 'STR_001', 'EMP_115', 'CUST_015', 95.00, 'Debit Card'), ('SALE_016', '2024-10-16 11:30:00', 'STR_002', 'EMP_116', 'CUST_016', 98.00, 'Online Payment'), ('SALE_017', '2024-10-17 10:15:00', 'STR_003', 'EMP_117', 'CUST_017', 101.00, 'Cash'), ('SALE_018', '2024-10-18 11:30:00', 'STR_004', 'EMP_118', 'CUST_018', 104.00, 'Credit Card'), ('SALE_019', '2024-10-19 10:15:00', 'STR_005', 'EMP_119', 'CUST_019', 107.00, 'Debit Card'), ('SALE_020', '2024-10-20 11:30:00', 'STR_006', 'EMP_120', 'CUST_020', 110.00, 'Online Payment'), ('SALE_021', '2024-10-21 10:15:00', 'STR_007', 'EMP_121', 'CUST_021', 113.00, 'Cash'), ('SALE_022', '2024-10-22 11:30:00', 'STR_001', 'EMP_122', 'CUST_022', 116.00, 'Credit Card'), ('SALE_023', '2024-10-23 10:15:00', 'STR_002', 'EMP_123', 'CUST_023', 119.00, 'Debit Card'), ('SALE_024', '2024-10-24 11:30:00', 'STR_003', 'EMP_124', 'CUST_024', 122.00, 'Online Payment'), ('SALE_025', '2024-10-25 10:15:00', 'STR_004', 'EMP_125', 'CUST_025', 125.00, 'Cash'), ('SALE_026', '2024-10-26 11:30:00', 'STR_005', 'EMP_126', 'CUST_026', 128.00, 'Credit Card'), ('SALE_027', '2024-10-27 10:15:00', 'STR_006', 'EMP_127', 'CUST_027', 131.00, 'Debit Card'), ('SALE_028', '2024-10-28 11:30:00', 'STR_007', 'EMP_128', 'CUST_028', 134.00, 'Online Payment'), ('SALE_029', '2024-10-29 10:15:00', 'STR_001', 'EMP_129', 'CUST_029', 137.00, 'Cash'), ('SALE_030', '2024-10-30 11:30:00', 'STR_002', 'EMP_130', 'CUST_030', 140.00, 'Credit Card'), ('SALE_031', '2024-10-31 10:15:00', 'STR_003', 'EMP_131', 'CUST_031', 143.00, 'Debit Card'), ('SALE_032', '2024-10-01 11:30:00', 'STR_004', 'EMP_132', 'CUST_032', 146.00, 'Online Payment'), ('SALE_033', '2024-10-02 10:15:00', 'STR_005', 'EMP_133', 'CUST_033', 149.00, 'Cash'), ('SALE_034', '2024-10-03 11:30:00', 'STR_006', 'EMP_134', 'CUST_034', 152.00, 'Credit Card'), ('SALE_035', '2024-10-04 10:15:00', 'STR_007', 'EMP_135', 'CUST_035', 155.00, 'Debit Card'), ('SALE_036', '2024-10-05 11:30:00', 'STR_001', 'EMP_136', 'CUST_036', 158.00, 'Online Payment'), ('SALE_037', '2024-10-06 10:15:00', 'STR_002', 'EMP_137', 'CUST_037', 161.00, 'Cash'), ('SALE_038', '2024-10-07 11:30:00', 'STR_003', 'EMP_138', 'CUST_038', 164.00, 'Credit Card'), ('SALE_039', '2024-10-08 10:15:00', 'STR_004', 'EMP_139', 'CUST_039', 167.00, 'Debit Card'), ('SALE_040', '2024-10-09 11:30:00', 'STR_005', 'EMP_140', 'CUST_040', 170.00, 'Online Payment'), ('SALE_041', '2024-10-10 10:15:00', 'STR_006', 'EMP_141', 'CUST_041', 173.00, 'Cash'), ('SALE_042', '2024-10-11 11:30:00', 'STR_007', 'EMP_101', 'CUST_042', 176.00, 'Credit Card'), ('SALE_043', '2024-10-12 10:15:00', 'STR_001', 'EMP_102', 'CUST_043', 179.00, 'Debit Card'), ('SALE_044', '2024-10-13 11:30:00', 'STR_002', 'EMP_103', 'CUST_044', 182.00, 'Online Payment'), ('SALE_045', '2024-10-14 10:15:00', 'STR_003', 'EMP_104', 'CUST_045', 185.00, 'Cash'), ('SALE_046', '2024-10-15 11:30:00', 'STR_004', 'EMP_105', 'CUST_046', 188.00, 'Credit Card'), ('SALE_047', '2024-10-16 10:15:00', 'STR_005', 'EMP_106', 'CUST_047', 191.00, 'Debit Card'), ('SALE_048', '2024-10-17 11:30:00', 'STR_006', 'EMP_107', 'CUST_048', 194.00, 'Online Payment'), ('SALE_049', '2024-10-18 10:15:00', 'STR_007', 'EMP_108', 'CUST_049', 197.00, 'Cash'), ('SALE_050', '2024-10-19 11:30:00', 'STR_001', 'EMP_109', 'CUST_050', 200.00, 'Credit Card'), ('SALE_051', '2024-10-20 10:15:00', 'STR_002', 'EMP_110', 'CUST_051', 203.00, 'Debit Card'), ('SALE_052', '2024-10-21 11:30:00', 'STR_003', 'EMP_111', 'CUST_052', 206.00, 'Online Payment'), ('SALE_053', '2024-10-22 10:15:00', 'STR_004', 'EMP_112', 'CUST_053', 209.00, 'Cash'), ('SALE_054', '2024-10-23 11:30:00', 'STR_005', 'EMP_113', 'CUST_054', 212.00, 'Credit Card'), ('SALE_055', '2024-10-24 10:15:00', 'STR_006', 'EMP_114', 'CUST_055', 215.00, 'Debit Card'), ('SALE_056', '2024-10-25 11:30:00', 'STR_007', 'EMP_115', 'CUST_056', 218.00, 'Online Payment'), ('SALE_057', '2024-10-26 10:15:00', 'STR_001', 'EMP_116', 'CUST_057', 221.00, 'Cash'), ('SALE_058', '2024-10-27 11:30:00', 'STR_002', 'EMP_117', 'CUST_058', 224.00, 'Credit Card'), ('SALE_059', '2024-10-28 10:15:00', 'STR_003', 'EMP_118', 'CUST_059', 227.00, 'Debit Card'), ('SALE_060', '2024-10-29 11:30:00', 'STR_004', 'EMP_119', 'CUST_060', 230.00, 'Online Payment'), ('SALE_061', '2024-10-30 10:15:00', 'STR_005', 'EMP_120', 'CUST_061', 233.00, 'Cash'), ('SALE_062', '2024-10-31 11:30:00', 'STR_006', 'EMP_121', 'CUST_062', 236.00, 'Credit Card'), ('SALE_063', '2024-10-01 10:15:00', 'STR_007', 'EMP_122', 'CUST_063', 239.00, 'Debit Card'), ('SALE_064', '2024-10-02 11:30:00', 'STR_001', 'EMP_123', 'CUST_064', 242.00, 'Online Payment'), ('SALE_065', '2024-10-03 10:15:00', 'STR_002', 'EMP_124', 'CUST_065', 245.00, 'Cash'), ('SALE_066', '2024-10-04 11:30:00', 'STR_003', 'EMP_125', 'CUST_066', 248.00, 'Credit Card'), ('SALE_067', '2024-10-05 10:15:00', 'STR_004', 'EMP_126', 'CUST_067', 251.00, 'Debit Card'), ('SALE_068', '2024-10-06 11:30:00', 'STR_005', 'EMP_127', 'CUST_068', 254.00, 'Online Payment'), ('SALE_069', '2024-10-07 10:15:00', 'STR_006', 'EMP_128', 'CUST_069', 257.00, 'Cash'), ('SALE_070', '2024-10-08 11:30:00', 'STR_007', 'EMP_129', 'CUST_070', 260.00, 'Credit Card');






CREATE OR REPLACE TABLE  RETAILDB_DEV.RAW_Sales.Sales_Nov2024 (
SaleID VARCHAR(255) PRIMARY KEY
,SaleDate DATETIME DEFAULT CURRENT_TIMESTAMP
,StoreID VARCHAR(255) 
,EmployeeID VARCHAR(255) 
,CustomerID VARCHAR(255) 
,TotalAmount DECIMAL(10,2) NOT NULL
,PaymentMethod VARCHAR(255) --ENUM('Cash', 'Credit Card', 'Debit Card', 'Online Payment') NOT NULL
--,FOREIGN KEY (StoreID) REFERENCES Stores(StoreID)
--,FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
--,FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);


INSERT INTO RETAILDB_DEV.RAW_Sales.Sales_Nov2024  (SaleID, SaleDate, StoreID, EmployeeID, CustomerID, TotalAmount, PaymentMethod) VALUES
('SALE_071', '2024-11-01 10:15:00', 'STR_001', 'EMP_101', 'CUST_071', 300.00, 'Cash'),
('SALE_072', '2024-11-02 11:30:00', 'STR_002', 'EMP_102', 'CUST_072', 303.00, 'Credit Card'),
('SALE_073', '2024-11-03 10:15:00', 'STR_003', 'EMP_103', 'CUST_073', 306.00, 'Debit Card'),
('SALE_074', '2024-11-04 11:30:00', 'STR_004', 'EMP_104', 'CUST_074', 309.00, 'Online Payment'),
('SALE_075', '2024-11-05 10:15:00', 'STR_005', 'EMP_105', 'CUST_075', 312.00, 'Cash'),
('SALE_076', '2024-11-06 11:30:00', 'STR_006', 'EMP_106', 'CUST_076', 315.00, 'Credit Card'),
('SALE_077', '2024-11-07 10:15:00', 'STR_007', 'EMP_107', 'CUST_077', 318.00, 'Debit Card'),
('SALE_078', '2024-11-08 11:30:00', 'STR_001', 'EMP_108', 'CUST_078', 321.00, 'Online Payment'),
('SALE_079', '2024-11-09 10:15:00', 'STR_002', 'EMP_109', 'CUST_079', 324.00, 'Cash'),
('SALE_080', '2024-11-10 11:30:00', 'STR_003', 'EMP_110', 'CUST_080', 327.00, 'Credit Card'),
('SALE_081', '2024-11-11 10:15:00', 'STR_004', 'EMP_111', 'CUST_081', 330.00, 'Debit Card'),
('SALE_082', '2024-11-12 11:30:00', 'STR_005', 'EMP_112', 'CUST_082', 333.00, 'Online Payment'),
('SALE_083', '2024-11-13 10:15:00', 'STR_006', 'EMP_113', 'CUST_083', 336.00, 'Cash'),
('SALE_084', '2024-11-14 11:30:00', 'STR_007', 'EMP_114', 'CUST_084', 339.00, 'Credit Card'),
('SALE_085', '2024-11-15 10:15:00', 'STR_001', 'EMP_115', 'CUST_085', 342.00, 'Debit Card'),
('SALE_086', '2024-11-16 11:30:00', 'STR_002', 'EMP_116', 'CUST_086', 345.00, 'Online Payment'),
('SALE_087', '2024-11-17 10:15:00', 'STR_003', 'EMP_117', 'CUST_087', 348.00, 'Cash'),
('SALE_088', '2024-11-18 11:30:00', 'STR_004', 'EMP_118', 'CUST_088', 351.00, 'Credit Card'),
('SALE_089', '2024-11-19 10:15:00', 'STR_005', 'EMP_119', 'CUST_089', 354.00, 'Debit Card'),
('SALE_090', '2024-11-20 11:30:00', 'STR_006', 'EMP_120', 'CUST_090', 357.00, 'Online Payment'),
('SALE_091', '2024-11-21 10:15:00', 'STR_007', 'EMP_121', 'CUST_091', 360.00, 'Cash'),
('SALE_092', '2024-11-22 11:30:00', 'STR_001', 'EMP_122', 'CUST_092', 363.00, 'Credit Card'),
('SALE_093', '2024-11-23 10:15:00', 'STR_002', 'EMP_123', 'CUST_093', 366.00, 'Debit Card'),
('SALE_094', '2024-11-24 11:30:00', 'STR_003', 'EMP_124', 'CUST_094', 369.00, 'Online Payment'),
('SALE_095', '2024-11-25 10:15:00', 'STR_004', 'EMP_125', 'CUST_095', 372.00, 'Cash'),
('SALE_096', '2024-11-26 11:30:00', 'STR_005', 'EMP_126', 'CUST_096', 375.00, 'Credit Card'),
('SALE_097', '2024-11-27 10:15:00', 'STR_006', 'EMP_127', 'CUST_097', 378.00, 'Debit Card'),
('SALE_098', '2024-11-28 11:30:00', 'STR_007', 'EMP_128', 'CUST_098', 381.00, 'Online Payment'),
('SALE_099', '2024-11-29 10:15:00', 'STR_001', 'EMP_129', 'CUST_099', 384.00, 'Cash'),
('SALE_100', '2024-11-30 11:30:00', 'STR_002', 'EMP_130', 'CUST_100', 387.00, 'Credit Card'),
('SALE_101', '2024-11-01 10:15:00', 'STR_003', 'EMP_131', 'CUST_101', 390.00, 'Debit Card'),
('SALE_102', '2024-11-02 11:30:00', 'STR_004', 'EMP_132', 'CUST_102', 393.00, 'Online Payment'),
('SALE_103', '2024-11-03 10:15:00', 'STR_005', 'EMP_133', 'CUST_103', 396.00, 'Cash'),
('SALE_104', '2024-11-04 11:30:00', 'STR_006', 'EMP_134', 'CUST_104', 399.00, 'Credit Card'),
('SALE_105', '2024-11-05 10:15:00', 'STR_007', 'EMP_135', 'CUST_105', 402.00, 'Debit Card'),
('SALE_106', '2024-11-06 11:30:00', 'STR_001', 'EMP_136', 'CUST_106', 405.00, 'Online Payment'),
('SALE_107', '2024-11-07 10:15:00', 'STR_002', 'EMP_137', 'CUST_107', 408.00, 'Cash'),
('SALE_108', '2024-11-08 11:30:00', 'STR_003', 'EMP_138', 'CUST_108', 411.00, 'Credit Card'),
('SALE_109', '2024-11-09 10:15:00', 'STR_004', 'EMP_139', 'CUST_109', 414.00, 'Debit Card'),
('SALE_110', '2024-11-10 11:30:00', 'STR_005', 'EMP_140', 'CUST_110', 417.00, 'Online Payment'),
('SALE_111', '2024-11-11 10:15:00', 'STR_006', 'EMP_141', 'CUST_111', 420.00, 'Cash'),
('SALE_112', '2024-11-12 11:30:00', 'STR_007', 'EMP_101', 'CUST_112', 423.00, 'Credit Card'),
('SALE_113', '2024-11-13 10:15:00', 'STR_001', 'EMP_102', 'CUST_113', 426.00, 'Debit Card'),
('SALE_114', '2024-11-14 11:30:00', 'STR_002', 'EMP_103', 'CUST_114', 429.00, 'Online Payment'),
('SALE_115', '2024-11-15 10:15:00', 'STR_003', 'EMP_104', 'CUST_115', 432.00, 'Cash'),
('SALE_116', '2024-11-16 11:30:00', 'STR_004', 'EMP_105', 'CUST_116', 435.00, 'Credit Card'),
('SALE_117', '2024-11-17 10:15:00', 'STR_005', 'EMP_106', 'CUST_117', 438.00, 'Debit Card'),
('SALE_118', '2024-11-18 11:30:00', 'STR_006', 'EMP_107', 'CUST_118', 441.00, 'Online Payment'),
('SALE_119', '2024-11-19 10:15:00', 'STR_007', 'EMP_108', 'CUST_119', 444.00, 'Cash'),
('SALE_120', '2024-11-20 11:30:00', 'STR_001', 'EMP_109', 'CUST_120', 447.00, 'Credit Card'),
('SALE_121', '2024-11-21 10:15:00', 'STR_002', 'EMP_110', 'CUST_121', 450.00, 'Debit Card'),
('SALE_122', '2024-11-22 11:30:00', 'STR_003', 'EMP_111', 'CUST_122', 453.00, 'Online Payment'),
('SALE_123', '2024-11-23 10:15:00', 'STR_004', 'EMP_112', 'CUST_123', 456.00, 'Cash'),
('SALE_124', '2024-11-24 11:30:00', 'STR_005', 'EMP_113', 'CUST_124', 459.00, 'Credit Card'),
('SALE_125', '2024-11-25 10:15:00', 'STR_006', 'EMP_114', 'CUST_125', 462.00, 'Debit Card'),
('SALE_126', '2024-11-26 11:30:00', 'STR_007', 'EMP_115', 'CUST_126', 465.00, 'Online Payment'),
('SALE_127', '2024-11-27 10:15:00', 'STR_001', 'EMP_116', 'CUST_127', 468.00, 'Cash'),
('SALE_128', '2024-11-28 11:30:00', 'STR_002', 'EMP_117', 'CUST_128', 471.00, 'Credit Card'),
('SALE_129', '2024-11-29 10:15:00', 'STR_003', 'EMP_118', 'CUST_129', 474.00, 'Debit Card'),
('SALE_130', '2024-11-30 11:30:00', 'STR_004', 'EMP_119', 'CUST_130', 477.00, 'Online Payment'),
('SALE_131', '2024-11-01 10:15:00', 'STR_005', 'EMP_120', 'CUST_131', 480.00, 'Cash'),
('SALE_132', '2024-11-02 11:30:00', 'STR_006', 'EMP_121', 'CUST_132', 483.00, 'Credit Card'),
('SALE_133', '2024-11-03 10:15:00', 'STR_007', 'EMP_122', 'CUST_133', 486.00, 'Debit Card'),
('SALE_134', '2024-11-04 11:30:00', 'STR_001', 'EMP_123', 'CUST_134', 489.00, 'Online Payment'),
('SALE_135', '2024-11-05 10:15:00', 'STR_002', 'EMP_124', 'CUST_135', 492.00, 'Cash'),
('SALE_136', '2024-11-06 11:30:00', 'STR_003', 'EMP_125', 'CUST_136', 495.00, 'Credit Card'),
('SALE_137', '2024-11-07 10:15:00', 'STR_004', 'EMP_126', 'CUST_137', 498.00, 'Debit Card'),
('SALE_138', '2024-11-08 11:30:00', 'STR_005', 'EMP_127', 'CUST_138', 501.00, 'Online Payment'),
('SALE_139', '2024-11-09 10:15:00', 'STR_006', 'EMP_128', 'CUST_139', 504.00, 'Cash'),
('SALE_140', '2024-11-10 11:30:00', 'STR_007', 'EMP_129', 'CUST_140', 507.00, 'Credit Card'),
('SALE_141', '2024-11-11 10:15:00', 'STR_001', 'EMP_130', 'CUST_141', 510.00, 'Debit Card'),
('SALE_142', '2024-11-12 11:30:00', 'STR_002', 'EMP_131', 'CUST_142', 513.00, 'Online Payment'),
('SALE_143', '2024-11-13 10:15:00', 'STR_003', 'EMP_132', 'CUST_143', 516.00, 'Cash'),
('SALE_144', '2024-11-14 11:30:00', 'STR_004', 'EMP_133', 'CUST_144', 519.00, 'Credit Card'),
('SALE_145', '2024-11-15 10:15:00', 'STR_005', 'EMP_134', 'CUST_145', 522.00, 'Debit Card'),
('SALE_146', '2024-11-16 11:30:00', 'STR_006', 'EMP_135', 'CUST_146', 525.00, 'Online Payment'),
('SALE_147', '2024-11-17 10:15:00', 'STR_007', 'EMP_136', 'CUST_147', 528.00, 'Cash'),
('SALE_148', '2024-11-18 11:30:00', 'STR_001', 'EMP_137', 'CUST_148', 531.00, 'Credit Card'),
('SALE_149', '2024-11-19 10:15:00', 'STR_002', 'EMP_138', 'CUST_149', 534.00, 'Debit Card'),
('SALE_150', '2024-11-20 11:30:00', 'STR_003', 'EMP_139', 'CUST_150', 537.00, 'Online Payment'),
('SALE_151', '2024-11-21 10:15:00', 'STR_004', 'EMP_140', 'CUST_151', 540.00, 'Cash'),
('SALE_152', '2024-11-22 11:30:00', 'STR_005', 'EMP_141', 'CUST_152', 543.00, 'Credit Card'),
('SALE_153', '2024-11-23 10:15:00', 'STR_006', 'EMP_101', 'CUST_153', 546.00, 'Debit Card'),
('SALE_154', '2024-11-24 11:30:00', 'STR_007', 'EMP_102', 'CUST_154', 549.00, 'Online Payment'),
('SALE_155', '2024-11-25 10:15:00', 'STR_001', 'EMP_103', 'CUST_155', 552.00, 'Cash');














CREATE OR REPLACE TABLE  RETAILDB_DEV.RAW_Sales.Sales_Dec2024 (
SaleID VARCHAR(255) PRIMARY KEY
,SaleDate DATETIME DEFAULT CURRENT_TIMESTAMP
,StoreID VARCHAR(255) 
,EmployeeID VARCHAR(255) 
,CustomerID VARCHAR(255) 
,TotalAmount DECIMAL(10,2) NOT NULL
,PaymentMethod VARCHAR(255) --ENUM('Cash', 'Credit Card', 'Debit Card', 'Online Payment') NOT NULL
--,FOREIGN KEY (StoreID) REFERENCES Stores(StoreID)
--,FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
--,FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

INSERT INTO RETAILDB_DEV.RAW_Sales.Sales_Dec2024 (SaleID, SaleDate, StoreID, EmployeeID, CustomerID, TotalAmount, PaymentMethod) VALUES
('SALE_156', '2024-12-01 10:15:00', 'STR_001', 'EMP_101', 'CUST_156', 600.00, 'Cash'),
('SALE_157', '2024-12-02 11:30:00', 'STR_002', 'EMP_102', 'CUST_157', 602.50, 'Credit Card'),
('SALE_158', '2024-12-03 10:15:00', 'STR_003', 'EMP_103', 'CUST_158', 605.00, 'Debit Card'),
('SALE_159', '2024-12-04 11:30:00', 'STR_004', 'EMP_104', 'CUST_159', 607.50, 'Online Payment'),
('SALE_160', '2024-12-05 10:15:00', 'STR_005', 'EMP_105', 'CUST_160', 610.00, 'Cash'),
('SALE_161', '2024-12-06 11:30:00', 'STR_006', 'EMP_106', 'CUST_161', 612.50, 'Credit Card'),
('SALE_162', '2024-12-07 10:15:00', 'STR_007', 'EMP_107', 'CUST_162', 615.00, 'Debit Card'),
('SALE_163', '2024-12-08 11:30:00', 'STR_001', 'EMP_108', 'CUST_163', 617.50, 'Online Payment'),
('SALE_164', '2024-12-09 10:15:00', 'STR_002', 'EMP_109', 'CUST_164', 620.00, 'Cash'),
('SALE_165', '2024-12-10 11:30:00', 'STR_003', 'EMP_110', 'CUST_165', 622.50, 'Credit Card'),
('SALE_166', '2024-12-11 10:15:00', 'STR_004', 'EMP_111', 'CUST_166', 625.00, 'Debit Card'),
('SALE_167', '2024-12-12 11:30:00', 'STR_005', 'EMP_112', 'CUST_167', 627.50, 'Online Payment'),
('SALE_168', '2024-12-13 10:15:00', 'STR_006', 'EMP_113', 'CUST_168', 630.00, 'Cash'),
('SALE_169', '2024-12-14 11:30:00', 'STR_007', 'EMP_114', 'CUST_169', 632.50, 'Credit Card'),
('SALE_170', '2024-12-15 10:15:00', 'STR_001', 'EMP_115', 'CUST_170', 635.00, 'Debit Card'),
('SALE_171', '2024-12-16 11:30:00', 'STR_002', 'EMP_116', 'CUST_171', 637.50, 'Online Payment'),
('SALE_172', '2024-12-17 10:15:00', 'STR_003', 'EMP_117', 'CUST_172', 640.00, 'Cash'),
('SALE_173', '2024-12-18 11:30:00', 'STR_004', 'EMP_118', 'CUST_173', 642.50, 'Credit Card'),
('SALE_174', '2024-12-19 10:15:00', 'STR_005', 'EMP_119', 'CUST_174', 645.00, 'Debit Card'),
('SALE_175', '2024-12-20 11:30:00', 'STR_006', 'EMP_120', 'CUST_175', 647.50, 'Online Payment'),
('SALE_176', '2024-12-21 10:15:00', 'STR_007', 'EMP_121', 'CUST_176', 650.00, 'Cash'),
('SALE_177', '2024-12-22 11:30:00', 'STR_001', 'EMP_122', 'CUST_177', 652.50, 'Credit Card'),
('SALE_178', '2024-12-23 10:15:00', 'STR_002', 'EMP_123', 'CUST_178', 655.00, 'Debit Card'),
('SALE_179', '2024-12-24 11:30:00', 'STR_003', 'EMP_124', 'CUST_179', 657.50, 'Online Payment'),
('SALE_180', '2024-12-25 10:15:00', 'STR_004', 'EMP_125', 'CUST_180', 660.00, 'Cash'),
('SALE_181', '2024-12-26 11:30:00', 'STR_005', 'EMP_126', 'CUST_181', 662.50, 'Credit Card'),
('SALE_182', '2024-12-27 10:15:00', 'STR_006', 'EMP_127', 'CUST_182', 665.00, 'Debit Card'),
('SALE_183', '2024-12-28 11:30:00', 'STR_007', 'EMP_128', 'CUST_183', 667.50, 'Online Payment'),
('SALE_184', '2024-12-29 10:15:00', 'STR_001', 'EMP_129', 'CUST_184', 670.00, 'Cash'),
('SALE_185', '2024-12-30 11:30:00', 'STR_002', 'EMP_130', 'CUST_185', 672.50, 'Credit Card'),
('SALE_186', '2024-12-31 10:15:00', 'STR_003', 'EMP_131', 'CUST_186', 675.00, 'Debit Card'),
('SALE_187', '2024-12-01 11:30:00', 'STR_004', 'EMP_132', 'CUST_187', 677.50, 'Online Payment'),
('SALE_188', '2024-12-02 10:15:00', 'STR_005', 'EMP_133', 'CUST_188', 680.00, 'Cash'),
('SALE_189', '2024-12-03 11:30:00', 'STR_006', 'EMP_134', 'CUST_189', 682.50, 'Credit Card'),
('SALE_190', '2024-12-04 10:15:00', 'STR_007', 'EMP_135', 'CUST_190', 685.00, 'Debit Card'),
('SALE_191', '2024-12-05 11:30:00', 'STR_001', 'EMP_136', 'CUST_191', 687.50, 'Online Payment'),
('SALE_192', '2024-12-06 10:15:00', 'STR_002', 'EMP_137', 'CUST_192', 690.00, 'Cash'),
('SALE_193', '2024-12-07 11:30:00', 'STR_003', 'EMP_138', 'CUST_193', 692.50, 'Credit Card'),
('SALE_194', '2024-12-08 10:15:00', 'STR_004', 'EMP_139', 'CUST_194', 695.00, 'Debit Card'),
('SALE_195', '2024-12-09 11:30:00', 'STR_005', 'EMP_140', 'CUST_195', 697.50, 'Online Payment'),
('SALE_196', '2024-12-10 10:15:00', 'STR_006', 'EMP_141', 'CUST_196', 700.00, 'Cash'),
('SALE_197', '2024-12-11 11:30:00', 'STR_007', 'EMP_101', 'CUST_197', 702.50, 'Credit Card'),
('SALE_198', '2024-12-12 10:15:00', 'STR_001', 'EMP_102', 'CUST_198', 705.00, 'Debit Card'),
('SALE_199', '2024-12-13 11:30:00', 'STR_002', 'EMP_103', 'CUST_199', 707.50, 'Online Payment'),
('SALE_200', '2024-12-14 10:15:00', 'STR_003', 'EMP_104', 'CUST_200', 710.00, 'Cash'),
('SALE_201', '2024-12-15 11:30:00', 'STR_004', 'EMP_105', 'CUST_201', 712.50, 'Credit Card'),
('SALE_202', '2024-12-16 10:15:00', 'STR_005', 'EMP_106', 'CUST_202', 715.00, 'Debit Card'),
('SALE_203', '2024-12-17 11:30:00', 'STR_006', 'EMP_107', 'CUST_203', 717.50, 'Online Payment'),
('SALE_204', '2024-12-18 10:15:00', 'STR_007', 'EMP_108', 'CUST_204', 720.00, 'Cash'),
('SALE_205', '2024-12-19 11:30:00', 'STR_001', 'EMP_109', 'CUST_205', 722.50, 'Credit Card'),
('SALE_206', '2024-12-20 10:15:00', 'STR_002', 'EMP_110', 'CUST_206', 725.00, 'Debit Card'),
('SALE_207', '2024-12-21 11:30:00', 'STR_003', 'EMP_111', 'CUST_207', 727.50, 'Online Payment'),
('SALE_208', '2024-12-22 10:15:00', 'STR_004', 'EMP_112', 'CUST_208', 730.00, 'Cash'),
('SALE_209', '2024-12-23 11:30:00', 'STR_005', 'EMP_113', 'CUST_209', 732.50, 'Credit Card'),
('SALE_210', '2024-12-24 10:15:00', 'STR_006', 'EMP_114', 'CUST_210', 735.00, 'Debit Card'),
('SALE_211', '2024-12-25 11:30:00', 'STR_007', 'EMP_115', 'CUST_211', 737.50, 'Online Payment'),
('SALE_212', '2024-12-26 10:15:00', 'STR_001', 'EMP_116', 'CUST_212', 740.00, 'Cash'),
('SALE_213', '2024-12-27 11:30:00', 'STR_002', 'EMP_117', 'CUST_213', 742.50, 'Credit Card'),
('SALE_214', '2024-12-28 10:15:00', 'STR_003', 'EMP_118', 'CUST_214', 745.00, 'Debit Card'),
('SALE_215', '2024-12-29 11:30:00', 'STR_004', 'EMP_119', 'CUST_215', 747.50, 'Online Payment'),
('SALE_216', '2024-12-30 10:15:00', 'STR_005', 'EMP_120', 'CUST_216', 750.00, 'Cash'),
('SALE_217', '2024-12-31 11:30:00', 'STR_006', 'EMP_121', 'CUST_217', 752.50, 'Credit Card'),
('SALE_218', '2024-12-01 10:15:00', 'STR_007', 'EMP_122', 'CUST_218', 755.00, 'Debit Card'),
('SALE_219', '2024-12-02 11:30:00', 'STR_001', 'EMP_123', 'CUST_219', 757.50, 'Online Payment'),
('SALE_220', '2024-12-03 10:15:00', 'STR_002', 'EMP_124', 'CUST_220', 760.00, 'Cash'),
('SALE_221', '2024-12-04 11:30:00', 'STR_003', 'EMP_125', 'CUST_221', 762.50, 'Credit Card'),
('SALE_222', '2024-12-05 10:15:00', 'STR_004', 'EMP_126', 'CUST_222', 765.00, 'Debit Card'),
('SALE_223', '2024-12-06 11:30:00', 'STR_005', 'EMP_127', 'CUST_223', 767.50, 'Online Payment'),
('SALE_224', '2024-12-07 10:15:00', 'STR_006', 'EMP_128', 'CUST_224', 770.00, 'Cash'),
('SALE_225', '2024-12-08 11:30:00', 'STR_007', 'EMP_129', 'CUST_225', 772.50, 'Credit Card'),
('SALE_226', '2024-12-09 10:15:00', 'STR_001', 'EMP_130', 'CUST_226', 775.00, 'Debit Card'),
('SALE_227', '2024-12-10 11:30:00', 'STR_002', 'EMP_131', 'CUST_227', 777.50, 'Online Payment'),
('SALE_228', '2024-12-11 10:15:00', 'STR_003', 'EMP_132', 'CUST_228', 780.00, 'Cash'),
('SALE_229', '2024-12-12 11:30:00', 'STR_004', 'EMP_133', 'CUST_229', 782.50, 'Credit Card'),
('SALE_230', '2024-12-13 10:15:00', 'STR_005', 'EMP_134', 'CUST_230', 785.00, 'Debit Card'),
('SALE_231', '2024-12-14 11:30:00', 'STR_006', 'EMP_135', 'CUST_231', 787.50, 'Online Payment'),
('SALE_232', '2024-12-15 10:15:00', 'STR_007', 'EMP_136', 'CUST_232', 790.00, 'Cash'),
('SALE_233', '2024-12-16 11:30:00', 'STR_001', 'EMP_137', 'CUST_233', 792.50, 'Credit Card'),
('SALE_234', '2024-12-17 10:15:00', 'STR_002', 'EMP_138', 'CUST_234', 795.00, 'Debit Card'),
('SALE_235', '2024-12-18 11:30:00', 'STR_003', 'EMP_139', 'CUST_235', 797.50, 'Online Payment');




CREATE OR REPLACE TABLE  RETAILDB_DEV.RAW_Sales.SaleDetails (
SaleDetailID VARCHAR(255) 
,SaleID VARCHAR(255) 
,ProductID VARCHAR(255) 
,Quantity INT NOT NULL
,UnitPrice DECIMAL(10,2) NOT NULL
,Subtotal DECIMAL(10,2) NOT NULL
,PRIMARY KEY (SaleDetailID,SaleID)
--,FOREIGN KEY (SaleID) REFERENCES Sales(SaleID)
--,FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

INSERT INTO RETAILDB_DEV.RAW_Sales.SaleDetails (SaleDetailID, SaleID, ProductID, Quantity, UnitPrice, Subtotal) VALUES
  -- SALE_051
  ('SD_102', 'SALE_051', 'PROD_036', 3, 19.99, 59.97),
  ('SD_103', 'SALE_051', 'PROD_037', 2, 24.99, 49.98),
  
  -- SALE_052
  ('SD_104', 'SALE_052', 'PROD_038', 2, 14.99, 29.98),
  ('SD_105', 'SALE_052', 'PROD_039', 3, 29.99, 89.97),
  
  -- SALE_053
  ('SD_106', 'SALE_053', 'PROD_040', 1, 19.99, 19.99),
  ('SD_107', 'SALE_053', 'PROD_041', 4, 34.99, 139.96),
  
  -- SALE_054
  ('SD_108', 'SALE_054', 'PROD_042', 2, 39.99, 79.98),
  ('SD_109', 'SALE_054', 'PROD_043', 1, 49.99, 49.99),
  
  -- SALE_055
  ('SD_110', 'SALE_055', 'PROD_044', 2, 19.99, 39.98),
  ('SD_111', 'SALE_055', 'PROD_045', 3, 24.99, 74.97),
  
  -- SALE_056
  ('SD_112', 'SALE_056', 'PROD_046', 4, 7.99, 31.96),
  ('SD_113', 'SALE_056', 'PROD_047', 2, 7.99, 15.98),
  
  -- SALE_057
  ('SD_114', 'SALE_057', 'PROD_048', 1, 14.99, 14.99),
  ('SD_115', 'SALE_057', 'PROD_049', 3, 14.99, 44.97),
  
  -- SALE_058
  ('SD_116', 'SALE_058', 'PROD_050', 2, 2.99, 5.98),
  ('SD_117', 'SALE_058', 'PROD_051', 4, 29.99, 119.96),
  
  -- SALE_059
  ('SD_118', 'SALE_059', 'PROD_052', 3, 19.99, 59.97),
  ('SD_119', 'SALE_059', 'PROD_053', 2, 12.99, 25.98),
  
  -- SALE_060
  ('SD_120', 'SALE_060', 'PROD_054', 1, 5.99, 5.99),
  ('SD_121', 'SALE_060', 'PROD_055', 1, 99.99, 99.99),
  
  -- SALE_061
  ('SD_122', 'SALE_061', 'PROD_056', 2, 99.99, 199.98),
  ('SD_123', 'SALE_061', 'PROD_057', 1, 399.99, 399.99),
  
  -- SALE_062
  ('SD_124', 'SALE_062', 'PROD_058', 1, 299.99, 299.99),
  ('SD_125', 'SALE_062', 'PROD_059', 2, 149.99, 299.98),
  
  -- SALE_063
  ('SD_126', 'SALE_063', 'PROD_060', 3, 349.99, 1049.97),
  ('SD_127', 'SALE_063', 'PROD_061', 1, 49.99, 49.99),
  
  -- SALE_064
  ('SD_128', 'SALE_064', 'PROD_062', 2, 29.99, 59.98),
  ('SD_129', 'SALE_064', 'PROD_063', 1, 39.99, 39.99),
  
  -- SALE_065
  ('SD_130', 'SALE_065', 'PROD_064', 4, 15.99, 63.96),
  ('SD_131', 'SALE_065', 'PROD_065', 3, 19.99, 59.97),
  
  -- SALE_066
  ('SD_132', 'SALE_066', 'PROD_066', 2, 9.99, 19.98),
  ('SD_133', 'SALE_066', 'PROD_067', 3, 12.99, 38.97),
  
  -- SALE_067
  ('SD_134', 'SALE_067', 'PROD_068', 1, 7.99, 7.99),
  ('SD_135', 'SALE_067', 'PROD_069', 2, 15.99, 31.98),
  
  -- SALE_068
  ('SD_136', 'SALE_068', 'PROD_070', 3, 29.99, 89.97),
  ('SD_137', 'SALE_068', 'PROD_071', 2, 29.99, 59.98),
  
  -- SALE_069
  ('SD_138', 'SALE_069', 'PROD_072', 2, 19.99, 39.98),
  ('SD_139', 'SALE_069', 'PROD_073', 4, 4.99, 19.96),
  
  -- SALE_070
  ('SD_140', 'SALE_070', 'PROD_074', 3, 8.99, 26.97),
  ('SD_141', 'SALE_070', 'PROD_075', 1, 6.99, 6.99);




CREATE OR REPLACE TABLE  RETAILDB_DEV.RAW_Sales.SaleDetails_Nov2024 (
SaleDetailID VARCHAR(255) 
,SaleID VARCHAR(255) 
,ProductID VARCHAR(255) 
,Quantity INT NOT NULL
,UnitPrice DECIMAL(10,2) NOT NULL
,Subtotal DECIMAL(10,2) NOT NULL
,PRIMARY KEY (SaleDetailID,SaleID)
--,FOREIGN KEY (SaleID) REFERENCES Sales(SaleID)
--,FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

INSERT INTO RETAILDB_DEV.RAW_Sales.SaleDetails_Nov2024 (SaleDetailID, SaleID, ProductID, Quantity, UnitPrice, Subtotal) VALUES
-- SALE_071: Total = 300.00; Detail1 = 300×0.40 = 120.00; Detail2 = 300×0.60 = 180.00; UnitPrices = 120/2 = 60.00 and 180/3 = 60.00; j = 1 => PROD_001 and PROD_011
('SD_156', 'SALE_071', 'PROD_001', 2, 60.00, 120.00),
('SD_157', 'SALE_071', 'PROD_011', 3, 60.00, 180.00),

-- SALE_072: Total = 303.00; Detail1 = 121.20; Detail2 = 181.80; UnitPrices = 60.60; j = 2 => PROD_002 and PROD_012
('SD_158', 'SALE_072', 'PROD_002', 2, 60.60, 121.20),
('SD_159', 'SALE_072', 'PROD_012', 3, 60.60, 181.80),

-- SALE_073: Total = 306.00; Detail1 = 122.40; Detail2 = 183.60; UnitPrices = 61.20; j = 3 => PROD_003 and PROD_013
('SD_160', 'SALE_073', 'PROD_003', 2, 61.20, 122.40),
('SD_161', 'SALE_073', 'PROD_013', 3, 61.20, 183.60),

-- SALE_074: Total = 309.00; Detail1 = 123.60; Detail2 = 185.40; UnitPrices = 61.80; j = 4 => PROD_004 and PROD_014
('SD_162', 'SALE_074', 'PROD_004', 2, 61.80, 123.60),
('SD_163', 'SALE_074', 'PROD_014', 3, 61.80, 185.40),

-- SALE_075: Total = 312.00; Detail1 = 124.80; Detail2 = 187.20; UnitPrices = 62.40; j = 5 => PROD_005 and PROD_015
('SD_164', 'SALE_075', 'PROD_005', 2, 62.40, 124.80),
('SD_165', 'SALE_075', 'PROD_015', 3, 62.40, 187.20),

-- SALE_076: Total = 315.00; Detail1 = 126.00; Detail2 = 189.00; UnitPrices = 63.00; j = 6 => PROD_006 and PROD_016
('SD_166', 'SALE_076', 'PROD_006', 2, 63.00, 126.00),
('SD_167', 'SALE_076', 'PROD_016', 3, 63.00, 189.00),

-- SALE_077: Total = 318.00; Detail1 = 127.20; Detail2 = 190.80; UnitPrices = 63.60; j = 7 => PROD_007 and PROD_017
('SD_168', 'SALE_077', 'PROD_007', 2, 63.60, 127.20),
('SD_169', 'SALE_077', 'PROD_017', 3, 63.60, 190.80),

-- SALE_078: Total = 321.00; Detail1 = 128.40; Detail2 = 192.60; UnitPrices = 64.20; j = 8 => PROD_008 and PROD_018
('SD_170', 'SALE_078', 'PROD_008', 2, 64.20, 128.40),
('SD_171', 'SALE_078', 'PROD_018', 3, 64.20, 192.60),

-- SALE_079: Total = 324.00; Detail1 = 129.60; Detail2 = 194.40; UnitPrices = 64.80; j = 9 => PROD_009 and PROD_019
('SD_172', 'SALE_079', 'PROD_009', 2, 64.80, 129.60),
('SD_173', 'SALE_079', 'PROD_019', 3, 64.80, 194.40),

-- SALE_080: Total = 327.00; Detail1 = 130.80; Detail2 = 196.20; UnitPrices = 65.40; j = 10 => PROD_010 and PROD_020
('SD_174', 'SALE_080', 'PROD_010', 2, 65.40, 130.80),
('SD_175', 'SALE_080', 'PROD_020', 3, 65.40, 196.20),

-- SALE_081: Total = 330.00; Detail1 = 132.00; Detail2 = 198.00; UnitPrices = 66.00; j = 1 => PROD_001 and PROD_011
('SD_176', 'SALE_081', 'PROD_001', 2, 66.00, 132.00),
('SD_177', 'SALE_081', 'PROD_011', 3, 66.00, 198.00),

-- SALE_082: Total = 333.00; Detail1 = 133.20; Detail2 = 199.80; UnitPrices = 66.60; j = 2 => PROD_002 and PROD_012
('SD_178', 'SALE_082', 'PROD_002', 2, 66.60, 133.20),
('SD_179', 'SALE_082', 'PROD_012', 3, 66.60, 199.80),

-- SALE_083: Total = 336.00; Detail1 = 134.40; Detail2 = 201.60; UnitPrices = 67.20; j = 3 => PROD_003 and PROD_013
('SD_180', 'SALE_083', 'PROD_003', 2, 67.20, 134.40),
('SD_181', 'SALE_083', 'PROD_013', 3, 67.20, 201.60),

-- SALE_084: Total = 339.00; Detail1 = 135.60; Detail2 = 203.40; UnitPrices = 67.80; j = 4 => PROD_004 and PROD_014
('SD_182', 'SALE_084', 'PROD_004', 2, 67.80, 135.60),
('SD_183', 'SALE_084', 'PROD_014', 3, 67.80, 203.40),

-- SALE_085: Total = 342.00; Detail1 = 136.80; Detail2 = 205.20; UnitPrices = 68.40; j = 5 => PROD_005 and PROD_015
('SD_184', 'SALE_085', 'PROD_005', 2, 68.40, 136.80),
('SD_185', 'SALE_085', 'PROD_015', 3, 68.40, 205.20),

-- SALE_086: Total = 345.00; Detail1 = 138.00; Detail2 = 207.00; UnitPrices = 69.00; j = 6 => PROD_006 and PROD_016
('SD_186', 'SALE_086', 'PROD_006', 2, 69.00, 138.00),
('SD_187', 'SALE_086', 'PROD_016', 3, 69.00, 207.00),

-- SALE_087: Total = 348.00; Detail1 = 139.20; Detail2 = 208.80; UnitPrices = 69.60; j = 7 => PROD_007 and PROD_017
('SD_188', 'SALE_087', 'PROD_007', 2, 69.60, 139.20),
('SD_189', 'SALE_087', 'PROD_017', 3, 69.60, 208.80),

-- SALE_088: Total = 351.00; Detail1 = 140.40; Detail2 = 210.60; UnitPrices = 70.20; j = 8 => PROD_008 and PROD_018
('SD_190', 'SALE_088', 'PROD_008', 2, 70.20, 140.40),
('SD_191', 'SALE_088', 'PROD_018', 3, 70.20, 210.60),

-- SALE_089: Total = 354.00; Detail1 = 141.60; Detail2 = 212.40; UnitPrices = 70.80; j = 9 => PROD_009 and PROD_019
('SD_192', 'SALE_089', 'PROD_009', 2, 70.80, 141.60),
('SD_193', 'SALE_089', 'PROD_019', 3, 70.80, 212.40),

-- SALE_090: Total = 357.00; Detail1 = 142.80; Detail2 = 214.20; UnitPrices = 71.40; j = 10 => PROD_010 and PROD_020
('SD_194', 'SALE_090', 'PROD_010', 2, 71.40, 142.80),
('SD_195', 'SALE_090', 'PROD_020', 3, 71.40, 214.20),

-- SALE_091: Total = 360.00; Detail1 = 144.00; Detail2 = 216.00; UnitPrices = 72.00; j = 1 => PROD_001 and PROD_011
('SD_196', 'SALE_091', 'PROD_001', 2, 72.00, 144.00),
('SD_197', 'SALE_091', 'PROD_011', 3, 72.00, 216.00),

-- SALE_092: Total = 363.00; Detail1 = 145.20; Detail2 = 217.80; UnitPrices = 72.60; j = 2 => PROD_002 and PROD_012
('SD_198', 'SALE_092', 'PROD_002', 2, 72.60, 145.20),
('SD_199', 'SALE_092', 'PROD_012', 3, 72.60, 217.80),

-- SALE_093: Total = 366.00; Detail1 = 146.40; Detail2 = 219.60; UnitPrices = 73.20; j = 3 => PROD_003 and PROD_013
('SD_200', 'SALE_093', 'PROD_003', 2, 73.20, 146.40),
('SD_201', 'SALE_093', 'PROD_013', 3, 73.20, 219.60),

-- SALE_094: Total = 369.00; Detail1 = 147.60; Detail2 = 221.40; UnitPrices = 73.80; j = 4 => PROD_004 and PROD_014
('SD_202', 'SALE_094', 'PROD_004', 2, 73.80, 147.60),
('SD_203', 'SALE_094', 'PROD_014', 3, 73.80, 221.40),

-- SALE_095: Total = 372.00; Detail1 = 148.80; Detail2 = 223.20; UnitPrices = 74.40; j = 5 => PROD_005 and PROD_015
('SD_204', 'SALE_095', 'PROD_005', 2, 74.40, 148.80),
('SD_205', 'SALE_095', 'PROD_015', 3, 74.40, 223.20),

-- SALE_096: Total = 375.00; Detail1 = 150.00; Detail2 = 225.00; UnitPrices = 75.00; j = 6 => PROD_006 and PROD_016
('SD_206', 'SALE_096', 'PROD_006', 2, 75.00, 150.00),
('SD_207', 'SALE_096', 'PROD_016', 3, 75.00, 225.00),

-- SALE_097: Total = 378.00; Detail1 = 151.20; Detail2 = 226.80; UnitPrices = 75.60; j = 7 => PROD_007 and PROD_017
('SD_208', 'SALE_097', 'PROD_007', 2, 75.60, 151.20),
('SD_209', 'SALE_097', 'PROD_017', 3, 75.60, 226.80),

-- SALE_098: Total = 381.00; Detail1 = 152.40; Detail2 = 228.60; UnitPrices = 76.20; j = 8 => PROD_008 and PROD_018
('SD_210', 'SALE_098', 'PROD_008', 2, 76.20, 152.40),
('SD_211', 'SALE_098', 'PROD_018', 3, 76.20, 228.60),

-- SALE_099: Total = 384.00; Detail1 = 153.60; Detail2 = 230.40; UnitPrices = 76.80; j = 9 => PROD_009 and PROD_019
('SD_212', 'SALE_099', 'PROD_009', 2, 76.80, 153.60),
('SD_213', 'SALE_099', 'PROD_019', 3, 76.80, 230.40),

-- SALE_100: Total = 387.00; Detail1 = 154.80; Detail2 = 232.20; UnitPrices = 77.40; j = 10 => PROD_010 and PROD_020
('SD_214', 'SALE_100', 'PROD_010', 2, 77.40, 154.80),
('SD_215', 'SALE_100', 'PROD_020', 3, 77.40, 232.20),

-- SALE_101: Total = 390.00; Detail1 = 156.00; Detail2 = 234.00; UnitPrices = 78.00; j = 1 => PROD_001 and PROD_011
('SD_216', 'SALE_101', 'PROD_001', 2, 78.00, 156.00),
('SD_217', 'SALE_101', 'PROD_011', 3, 78.00, 234.00),

-- SALE_102: Total = 393.00; Detail1 = 157.20; Detail2 = 235.80; UnitPrices = 78.60; j = 2 => PROD_002 and PROD_012
('SD_218', 'SALE_102', 'PROD_002', 2, 78.60, 157.20),
('SD_219', 'SALE_102', 'PROD_012', 3, 78.60, 235.80),

-- SALE_103: Total = 396.00; Detail1 = 158.40; Detail2 = 237.60; UnitPrices = 79.20; j = 3 => PROD_003 and PROD_013
('SD_220', 'SALE_103', 'PROD_003', 2, 79.20, 158.40),
('SD_221', 'SALE_103', 'PROD_013', 3, 79.20, 237.60),

-- SALE_104: Total = 399.00; Detail1 = 159.60; Detail2 = 239.40; UnitPrices = 79.80; j = 4 => PROD_004 and PROD_014
('SD_222', 'SALE_104', 'PROD_004', 2, 79.80, 159.60),
('SD_223', 'SALE_104', 'PROD_014', 3, 79.80, 239.40),

-- SALE_105: Total = 402.00; Detail1 = 160.80; Detail2 = 241.20; UnitPrices = 80.40; j = 5 => PROD_005 and PROD_015
('SD_224', 'SALE_105', 'PROD_005', 2, 80.40, 160.80),
('SD_225', 'SALE_105', 'PROD_015', 3, 80.40, 241.20),

-- SALE_106: Total = 405.00; Detail1 = 162.00; Detail2 = 243.00; UnitPrices = 81.00; j = 6 => PROD_006 and PROD_016
('SD_226', 'SALE_106', 'PROD_006', 2, 81.00, 162.00),
('SD_227', 'SALE_106', 'PROD_016', 3, 81.00, 243.00),

-- SALE_107: Total = 408.00; Detail1 = 163.20; Detail2 = 244.80; UnitPrices = 81.60; j = 7 => PROD_007 and PROD_017
('SD_228', 'SALE_107', 'PROD_007', 2, 81.60, 163.20),
('SD_229', 'SALE_107', 'PROD_017', 3, 81.60, 244.80),

-- SALE_108: Total = 411.00; Detail1 = 164.40; Detail2 = 246.60; UnitPrices = 82.20; j = 8 => PROD_008 and PROD_018
('SD_230', 'SALE_108', 'PROD_008', 2, 82.20, 164.40),
('SD_231', 'SALE_108', 'PROD_018', 3, 82.20, 246.60),

-- SALE_109: Total = 414.00; Detail1 = 165.60; Detail2 = 248.40; UnitPrices = 82.80; j = 9 => PROD_009 and PROD_019
('SD_232', 'SALE_109', 'PROD_009', 2, 82.80, 165.60),
('SD_233', 'SALE_109', 'PROD_019', 3, 82.80, 248.40),

-- SALE_110: Total = 417.00; Detail1 = 166.80; Detail2 = 250.20; UnitPrices = 83.40; j = 10 => PROD_010 and PROD_020
('SD_234', 'SALE_110', 'PROD_010', 2, 83.40, 166.80),
('SD_235', 'SALE_110', 'PROD_020', 3, 83.40, 250.20),

-- SALE_111: Total = 420.00; Detail1 = 168.00; Detail2 = 252.00; UnitPrices = 84.00; j = 1 => PROD_001 and PROD_011
('SD_236', 'SALE_111', 'PROD_001', 2, 84.00, 168.00),
('SD_237', 'SALE_111', 'PROD_011', 3, 84.00, 252.00),

-- SALE_112: Total = 423.00; Detail1 = 169.20; Detail2 = 253.80; UnitPrices = 84.60; j = 2 => PROD_002 and PROD_012
('SD_238', 'SALE_112', 'PROD_002', 2, 84.60, 169.20),
('SD_239', 'SALE_112', 'PROD_012', 3, 84.60, 253.80),

-- SALE_113: Total = 426.00; Detail1 = 170.40; Detail2 = 255.60; UnitPrices = 85.20; j = 3 => PROD_003 and PROD_013
('SD_240', 'SALE_113', 'PROD_003', 2, 85.20, 170.40),
('SD_241', 'SALE_113', 'PROD_013', 3, 85.20, 255.60),

-- SALE_114: Total = 429.00; Detail1 = 171.60; Detail2 = 257.40; UnitPrices = 85.80; j = 4 => PROD_004 and PROD_014
('SD_242', 'SALE_114', 'PROD_004', 2, 85.80, 171.60),
('SD_243', 'SALE_114', 'PROD_014', 3, 85.80, 257.40),

-- SALE_115: Total = 432.00; Detail1 = 172.80; Detail2 = 259.20; UnitPrices = 86.40; j = 5 => PROD_005 and PROD_015
('SD_244', 'SALE_115', 'PROD_005', 2, 86.40, 172.80),
('SD_245', 'SALE_115', 'PROD_015', 3, 86.40, 259.20),

-- SALE_116: Total = 435.00; Detail1 = 174.00; Detail2 = 261.00; UnitPrices = 87.00; j = 6 => PROD_006 and PROD_016
('SD_246', 'SALE_116', 'PROD_006', 2, 87.00, 174.00),
('SD_247', 'SALE_116', 'PROD_016', 3, 87.00, 261.00),

-- SALE_117: Total = 438.00; Detail1 = 175.20; Detail2 = 262.80; UnitPrices = 87.60; j = 7 => PROD_007 and PROD_017
('SD_248', 'SALE_117', 'PROD_007', 2, 87.60, 175.20),
('SD_249', 'SALE_117', 'PROD_017', 3, 87.60, 262.80),

-- SALE_118: Total = 441.00; Detail1 = 176.40; Detail2 = 264.60; UnitPrices = 88.20; j = 8 => PROD_008 and PROD_018
('SD_250', 'SALE_118', 'PROD_008', 2, 88.20, 176.40),
('SD_251', 'SALE_118', 'PROD_018', 3, 88.20, 264.60),

-- SALE_119: Total = 444.00; Detail1 = 177.60; Detail2 = 266.40; UnitPrices = 88.80; j = 9 => PROD_009 and PROD_019
('SD_252', 'SALE_119', 'PROD_009', 2, 88.80, 177.60),
('SD_253', 'SALE_119', 'PROD_019', 3, 88.80, 266.40),

-- SALE_120: Total = 447.00; Detail1 = 178.80; Detail2 = 268.20; UnitPrices = 89.40; j = 10 => PROD_010 and PROD_020
('SD_254', 'SALE_120', 'PROD_010', 2, 89.40, 178.80),
('SD_255', 'SALE_120', 'PROD_020', 3, 89.40, 268.20),

-- SALE_121: Total = 450.00; Detail1 = 180.00; Detail2 = 270.00; UnitPrices = 90.00; j = 1 => PROD_001 and PROD_011
('SD_256', 'SALE_121', 'PROD_001', 2, 90.00, 180.00),
('SD_257', 'SALE_121', 'PROD_011', 3, 90.00, 270.00),

-- SALE_122: Total = 453.00; Detail1 = 181.20; Detail2 = 271.80; UnitPrices = 90.60; j = 2 => PROD_002 and PROD_012
('SD_258', 'SALE_122', 'PROD_002', 2, 90.60, 181.20),
('SD_259', 'SALE_122', 'PROD_012', 3, 90.60, 271.80),

-- SALE_123: Total = 456.00; Detail1 = 182.40; Detail2 = 273.60; UnitPrices = 91.20; j = 3 => PROD_003 and PROD_013
('SD_260', 'SALE_123', 'PROD_003', 2, 91.20, 182.40),
('SD_261', 'SALE_123', 'PROD_013', 3, 91.20, 273.60),

-- SALE_124: Total = 459.00; Detail1 = 183.60; Detail2 = 275.40; UnitPrices = 91.80; j = 4 => PROD_004 and PROD_014
('SD_262', 'SALE_124', 'PROD_004', 2, 91.80, 183.60),
('SD_263', 'SALE_124', 'PROD_014', 3, 91.80, 275.40),

-- SALE_125: Total = 462.00; Detail1 = 184.80; Detail2 = 277.20; UnitPrices = 92.40; j = 5 => PROD_005 and PROD_015
('SD_264', 'SALE_125', 'PROD_005', 2, 92.40, 184.80),
('SD_265', 'SALE_125', 'PROD_015', 3, 92.40, 277.20),

-- SALE_126: Total = 465.00; Detail1 = 186.00; Detail2 = 279.00; UnitPrices = 93.00; j = 6 => PROD_006 and PROD_016
('SD_266', 'SALE_126', 'PROD_006', 2, 93.00, 186.00),
('SD_267', 'SALE_126', 'PROD_016', 3, 93.00, 279.00),

-- SALE_127: Total = 468.00; Detail1 = 187.20; Detail2 = 280.80; UnitPrices = 93.60; j = 7 => PROD_007 and PROD_017
('SD_268', 'SALE_127', 'PROD_007', 2, 93.60, 187.20),
('SD_269', 'SALE_127', 'PROD_017', 3, 93.60, 280.80),

-- SALE_128: Total = 471.00; Detail1 = 188.40; Detail2 = 282.60; UnitPrices = 94.20; j = 8 => PROD_008 and PROD_018
('SD_270', 'SALE_128', 'PROD_008', 2, 94.20, 188.40),
('SD_271', 'SALE_128', 'PROD_018', 3, 94.20, 282.60),

-- SALE_129: Total = 474.00; Detail1 = 189.60; Detail2 = 284.40; UnitPrices = 94.80; j = 9 => PROD_009 and PROD_019
('SD_272', 'SALE_129', 'PROD_009', 2, 94.80, 189.60),
('SD_273', 'SALE_129', 'PROD_019', 3, 94.80, 284.40),

-- SALE_130: Total = 477.00; Detail1 = 190.80; Detail2 = 286.20; UnitPrices = 95.40; j = 10 => PROD_010 and PROD_020
('SD_274', 'SALE_130', 'PROD_010', 2, 95.40, 190.80),
('SD_275', 'SALE_130', 'PROD_020', 3, 95.40, 286.20),

-- SALE_131: Total = 480.00; Detail1 = 192.00; Detail2 = 288.00; UnitPrices = 96.00; j = 1 => PROD_001 and PROD_011
('SD_276', 'SALE_131', 'PROD_001', 2, 96.00, 192.00),
('SD_277', 'SALE_131', 'PROD_011', 3, 96.00, 288.00),

-- SALE_132: Total = 483.00; Detail1 = 193.20; Detail2 = 289.80; UnitPrices = 96.60; j = 2 => PROD_002 and PROD_012
('SD_278', 'SALE_132', 'PROD_002', 2, 96.60, 193.20),
('SD_279', 'SALE_132', 'PROD_012', 3, 96.60, 289.80),

-- SALE_133: Total = 486.00; Detail1 = 194.40; Detail2 = 291.60; UnitPrices = 97.20; j = 3 => PROD_003 and PROD_013
('SD_280', 'SALE_133', 'PROD_003', 2, 97.20, 194.40),
('SD_281', 'SALE_133', 'PROD_013', 3, 97.20, 291.60),

-- SALE_134: Total = 489.00; Detail1 = 195.60; Detail2 = 293.40; UnitPrices = 97.80; j = 4 => PROD_004 and PROD_014
('SD_282', 'SALE_134', 'PROD_004', 2, 97.80, 195.60),
('SD_283', 'SALE_134', 'PROD_014', 3, 97.80, 293.40),

-- SALE_135: Total = 492.00; Detail1 = 196.80; Detail2 = 295.20; UnitPrices = 98.40; j = 5 => PROD_005 and PROD_015
('SD_284', 'SALE_135', 'PROD_005', 2, 98.40, 196.80),
('SD_285', 'SALE_135', 'PROD_015', 3, 98.40, 295.20),

-- SALE_136: Total = 495.00; Detail1 = 198.00; Detail2 = 297.00; UnitPrices = 99.00; j = 6 => PROD_006 and PROD_016
('SD_286', 'SALE_136', 'PROD_006', 2, 99.00, 198.00),
('SD_287', 'SALE_136', 'PROD_016', 3, 99.00, 297.00),

-- SALE_137: Total = 498.00; Detail1 = 199.20; Detail2 = 298.80; UnitPrices = 99.60; j = 7 => PROD_007 and PROD_017
('SD_288', 'SALE_137', 'PROD_007', 2, 99.60, 199.20),
('SD_289', 'SALE_137', 'PROD_017', 3, 99.60, 298.80),

-- SALE_138: Total = 501.00; Detail1 = 200.40; Detail2 = 300.60; UnitPrices = 100.20; j = 8 => PROD_008 and PROD_018
('SD_290', 'SALE_138', 'PROD_008', 2, 100.20, 200.40),
('SD_291', 'SALE_138', 'PROD_018', 3, 100.20, 300.60),

-- SALE_139: Total = 504.00; Detail1 = 201.60; Detail2 = 302.40; UnitPrices = 100.80; j = 9 => PROD_009 and PROD_019
('SD_292', 'SALE_139', 'PROD_009', 2, 100.80, 201.60),
('SD_293', 'SALE_139', 'PROD_019', 3, 100.80, 302.40),

-- SALE_140: Total = 507.00; Detail1 = 202.80; Detail2 = 304.20; UnitPrices = 101.40; j = 10 => PROD_010 and PROD_020
('SD_294', 'SALE_140', 'PROD_010', 2, 101.40, 202.80),
('SD_295', 'SALE_140', 'PROD_020', 3, 101.40, 304.20),

-- SALE_141: Total = 510.00; Detail1 = 204.00; Detail2 = 306.00; UnitPrices = 102.00; j = 1 => PROD_001 and PROD_011
('SD_296', 'SALE_141', 'PROD_001', 2, 102.00, 204.00),
('SD_297', 'SALE_141', 'PROD_011', 3, 102.00, 306.00),

-- SALE_142: Total = 513.00; Detail1 = 205.20; Detail2 = 307.80; UnitPrices = 102.60; j = 2 => PROD_002 and PROD_012
('SD_298', 'SALE_142', 'PROD_002', 2, 102.60, 205.20),
('SD_299', 'SALE_142', 'PROD_012', 3, 102.60, 307.80),

-- SALE_143: Total = 516.00; Detail1 = 206.40; Detail2 = 309.60; UnitPrices = 103.20; j = 3 => PROD_003 and PROD_013
('SD_300', 'SALE_143', 'PROD_003', 2, 103.20, 206.40),
('SD_301', 'SALE_143', 'PROD_013', 3, 103.20, 309.60),

-- SALE_144: Total = 519.00; Detail1 = 207.60; Detail2 = 311.40; UnitPrices = 103.80; j = 4 => PROD_004 and PROD_014
('SD_302', 'SALE_144', 'PROD_004', 2, 103.80, 207.60),
('SD_303', 'SALE_144', 'PROD_014', 3, 103.80, 311.40),

-- SALE_145: Total = 522.00; Detail1 = 208.80; Detail2 = 313.20; UnitPrices = 104.40; j = 5 => PROD_005 and PROD_015
('SD_304', 'SALE_145', 'PROD_005', 2, 104.40, 208.80),
('SD_305', 'SALE_145', 'PROD_015', 3, 104.40, 313.20),

-- SALE_146: Total = 525.00; Detail1 = 210.00; Detail2 = 315.00; UnitPrices = 105.00; j = 6 => PROD_006 and PROD_016
('SD_306', 'SALE_146', 'PROD_006', 2, 105.00, 210.00),
('SD_307', 'SALE_146', 'PROD_016', 3, 105.00, 315.00),

-- SALE_147: Total = 528.00; Detail1 = 211.20; Detail2 = 316.80; UnitPrices = 105.60; j = 7 => PROD_007 and PROD_017
('SD_308', 'SALE_147', 'PROD_007', 2, 105.60, 211.20),
('SD_309', 'SALE_147', 'PROD_017', 3, 105.60, 316.80),

-- SALE_148: Total = 531.00; Detail1 = 212.40; Detail2 = 318.60; UnitPrices = 106.20; j = 8 => PROD_008 and PROD_018
('SD_310', 'SALE_148', 'PROD_008', 2, 106.20, 212.40),
('SD_311', 'SALE_148', 'PROD_018', 3, 106.20, 318.60),

-- SALE_149: Total = 534.00; Detail1 = 213.60; Detail2 = 320.40; UnitPrices = 106.80; j = 9 => PROD_009 and PROD_019
('SD_312', 'SALE_149', 'PROD_009', 2, 106.80, 213.60),
('SD_313', 'SALE_149', 'PROD_019', 3, 106.80, 320.40),

-- SALE_150: Total = 537.00; Detail1 = 214.80; Detail2 = 322.20; UnitPrices = 107.40; j = 10 => PROD_010 and PROD_020
('SD_314', 'SALE_150', 'PROD_010', 2, 107.40, 214.80),
('SD_315', 'SALE_150', 'PROD_020', 3, 107.40, 322.20),

-- SALE_151: Total = 540.00; Detail1 = 216.00; Detail2 = 324.00; UnitPrices = 108.00; j = 1 => PROD_001 and PROD_011
('SD_316', 'SALE_151', 'PROD_001', 2, 108.00, 216.00),
('SD_317', 'SALE_151', 'PROD_011', 3, 108.00, 324.00),

-- SALE_152: Total = 543.00; Detail1 = 217.20; Detail2 = 325.80; UnitPrices = 108.60; j = 2 => PROD_002 and PROD_012
('SD_318', 'SALE_152', 'PROD_002', 2, 108.60, 217.20),
('SD_319', 'SALE_152', 'PROD_012', 3, 108.60, 325.80),

-- SALE_153: Total = 546.00; Detail1 = 218.40; Detail2 = 327.60; UnitPrices = 109.20; j = 3 => PROD_003 and PROD_013
('SD_320', 'SALE_153', 'PROD_003', 2, 109.20, 218.40),
('SD_321', 'SALE_153', 'PROD_013', 3, 109.20, 327.60),

-- SALE_154: Total = 549.00; Detail1 = 219.60; Detail2 = 329.40; UnitPrices = 109.80; j = 4 => PROD_004 and PROD_014
('SD_322', 'SALE_154', 'PROD_004', 2, 109.80, 219.60),
('SD_323', 'SALE_154', 'PROD_014', 3, 109.80, 329.40),

-- SALE_155: Total = 552.00; Detail1 = 220.80; Detail2 = 331.20; UnitPrices = 110.40; j = 5 => PROD_005 and PROD_015
('SD_324', 'SALE_155', 'PROD_005', 2, 110.40, 220.80),
('SD_325', 'SALE_155', 'PROD_015', 3, 110.40, 331.20);




CREATE OR REPLACE TABLE  RETAILDB_DEV.RAW_Sales.SaleDetails_Dec2024 (
SaleDetailID VARCHAR(255) 
,SaleID VARCHAR(255) 
,ProductID VARCHAR(255) 
,Quantity INT NOT NULL
,UnitPrice DECIMAL(10,2) NOT NULL
,Subtotal DECIMAL(10,2) NOT NULL
,PRIMARY KEY (SaleDetailID,SaleID)
--,FOREIGN KEY (SaleID) REFERENCES Sales(SaleID)
--,FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);



INSERT INTO RETAILDB_DEV.RAW_Sales.SaleDetails_Dec2024 (SaleDetailID, SaleID, ProductID, Quantity, UnitPrice, Subtotal) VALUES
-- SALE_156: Total = 600.00, UnitPrice = 600.00*0.20 = 120.00; j = 1 => PROD_001 and PROD_011
('SD_326', 'SALE_156', 'PROD_001', 2, 120.00, 240.00),
('SD_327', 'SALE_156', 'PROD_011', 3, 120.00, 360.00),

-- SALE_157: Total = 602.50, UnitPrice = 602.50*0.20 = 120.50; j = 2
('SD_328', 'SALE_157', 'PROD_002', 2, 120.50, 241.00),
('SD_329', 'SALE_157', 'PROD_012', 3, 120.50, 361.50),

-- SALE_158: Total = 605.00, UnitPrice = 121.00; j = 3
('SD_330', 'SALE_158', 'PROD_003', 2, 121.00, 242.00),
('SD_331', 'SALE_158', 'PROD_013', 3, 121.00, 363.00),

-- SALE_159: Total = 607.50, UnitPrice = 121.50; j = 4
('SD_332', 'SALE_159', 'PROD_004', 2, 121.50, 243.00),
('SD_333', 'SALE_159', 'PROD_014', 3, 121.50, 364.50),

-- SALE_160: Total = 610.00, UnitPrice = 122.00; j = 5
('SD_334', 'SALE_160', 'PROD_005', 2, 122.00, 244.00),
('SD_335', 'SALE_160', 'PROD_015', 3, 122.00, 366.00),

-- SALE_161: Total = 612.50, UnitPrice = 122.50; j = 6
('SD_336', 'SALE_161', 'PROD_006', 2, 122.50, 245.00),
('SD_337', 'SALE_161', 'PROD_016', 3, 122.50, 367.50),

-- SALE_162: Total = 615.00, UnitPrice = 123.00; j = 7
('SD_338', 'SALE_162', 'PROD_007', 2, 123.00, 246.00),
('SD_339', 'SALE_162', 'PROD_017', 3, 123.00, 369.00),

-- SALE_163: Total = 617.50, UnitPrice = 123.50; j = 8
('SD_340', 'SALE_163', 'PROD_008', 2, 123.50, 247.00),
('SD_341', 'SALE_163', 'PROD_018', 3, 123.50, 370.50),

-- SALE_164: Total = 620.00, UnitPrice = 124.00; j = 9
('SD_342', 'SALE_164', 'PROD_009', 2, 124.00, 248.00),
('SD_343', 'SALE_164', 'PROD_019', 3, 124.00, 372.00),

-- SALE_165: Total = 622.50, UnitPrice = 124.50; j = 10
('SD_344', 'SALE_165', 'PROD_010', 2, 124.50, 249.00),
('SD_345', 'SALE_165', 'PROD_020', 3, 124.50, 373.50),

-- SALE_166: Total = 625.00, UnitPrice = 125.00; j = 1
('SD_346', 'SALE_166', 'PROD_001', 2, 125.00, 250.00),
('SD_347', 'SALE_166', 'PROD_011', 3, 125.00, 375.00),

-- SALE_167: Total = 627.50, UnitPrice = 125.50; j = 2
('SD_348', 'SALE_167', 'PROD_002', 2, 125.50, 251.00),
('SD_349', 'SALE_167', 'PROD_012', 3, 125.50, 376.50),

-- SALE_168: Total = 630.00, UnitPrice = 126.00; j = 3
('SD_350', 'SALE_168', 'PROD_003', 2, 126.00, 252.00),
('SD_351', 'SALE_168', 'PROD_013', 3, 126.00, 378.00),

-- SALE_169: Total = 632.50, UnitPrice = 126.50; j = 4
('SD_352', 'SALE_169', 'PROD_004', 2, 126.50, 253.00),
('SD_353', 'SALE_169', 'PROD_014', 3, 126.50, 379.50),

-- SALE_170: Total = 635.00, UnitPrice = 127.00; j = 5
('SD_354', 'SALE_170', 'PROD_005', 2, 127.00, 254.00),
('SD_355', 'SALE_170', 'PROD_015', 3, 127.00, 381.00),

-- SALE_171: Total = 637.50, UnitPrice = 127.50; j = 6
('SD_356', 'SALE_171', 'PROD_006', 2, 127.50, 255.00),
('SD_357', 'SALE_171', 'PROD_016', 3, 127.50, 382.50),

-- SALE_172: Total = 640.00, UnitPrice = 128.00; j = 7
('SD_358', 'SALE_172', 'PROD_007', 2, 128.00, 256.00),
('SD_359', 'SALE_172', 'PROD_017', 3, 128.00, 384.00),

-- SALE_173: Total = 642.50, UnitPrice = 128.50; j = 8
('SD_360', 'SALE_173', 'PROD_008', 2, 128.50, 257.00),
('SD_361', 'SALE_173', 'PROD_018', 3, 128.50, 385.50),

-- SALE_174: Total = 645.00, UnitPrice = 129.00; j = 9
('SD_362', 'SALE_174', 'PROD_009', 2, 129.00, 258.00),
('SD_363', 'SALE_174', 'PROD_019', 3, 129.00, 387.00),

-- SALE_175: Total = 647.50, UnitPrice = 129.50; j = 10
('SD_364', 'SALE_175', 'PROD_010', 2, 129.50, 259.00),
('SD_365', 'SALE_175', 'PROD_020', 3, 129.50, 388.50),

-- SALE_176: Total = 650.00, UnitPrice = 130.00; j = 1
('SD_366', 'SALE_176', 'PROD_001', 2, 130.00, 260.00),
('SD_367', 'SALE_176', 'PROD_011', 3, 130.00, 390.00),

-- SALE_177: Total = 652.50, UnitPrice = 130.50; j = 2
('SD_368', 'SALE_177', 'PROD_002', 2, 130.50, 261.00),
('SD_369', 'SALE_177', 'PROD_012', 3, 130.50, 391.50),

-- SALE_178: Total = 655.00, UnitPrice = 131.00; j = 3
('SD_370', 'SALE_178', 'PROD_003', 2, 131.00, 262.00),
('SD_371', 'SALE_178', 'PROD_013', 3, 131.00, 393.00),

-- SALE_179: Total = 657.50, UnitPrice = 131.50; j = 4
('SD_372', 'SALE_179', 'PROD_004', 2, 131.50, 263.00),
('SD_373', 'SALE_179', 'PROD_014', 3, 131.50, 394.50),

-- SALE_180: Total = 660.00, UnitPrice = 132.00; j = 5
('SD_374', 'SALE_180', 'PROD_005', 2, 132.00, 264.00),
('SD_375', 'SALE_180', 'PROD_015', 3, 132.00, 396.00),

-- SALE_181: Total = 662.50, UnitPrice = 132.50; j = 6
('SD_376', 'SALE_181', 'PROD_006', 2, 132.50, 265.00),
('SD_377', 'SALE_181', 'PROD_016', 3, 132.50, 397.50),

-- SALE_182: Total = 665.00, UnitPrice = 133.00; j = 7
('SD_378', 'SALE_182', 'PROD_007', 2, 133.00, 266.00),
('SD_379', 'SALE_182', 'PROD_017', 3, 133.00, 399.00),

-- SALE_183: Total = 667.50, UnitPrice = 133.50; j = 8
('SD_380', 'SALE_183', 'PROD_008', 2, 133.50, 267.00),
('SD_381', 'SALE_183', 'PROD_018', 3, 133.50, 400.50),

-- SALE_184: Total = 670.00, UnitPrice = 134.00; j = 9
('SD_382', 'SALE_184', 'PROD_009', 2, 134.00, 268.00),
('SD_383', 'SALE_184', 'PROD_019', 3, 134.00, 402.00),

-- SALE_185: Total = 672.50, UnitPrice = 134.50; j = 10
('SD_384', 'SALE_185', 'PROD_010', 2, 134.50, 269.00),
('SD_385', 'SALE_185', 'PROD_020', 3, 134.50, 403.50),

-- SALE_186: Total = 675.00, UnitPrice = 135.00; j = 1
('SD_386', 'SALE_186', 'PROD_001', 2, 135.00, 270.00),
('SD_387', 'SALE_186', 'PROD_011', 3, 135.00, 405.00),

-- SALE_187: Total = 677.50, UnitPrice = 135.50; j = 2
('SD_388', 'SALE_187', 'PROD_002', 2, 135.50, 271.00),
('SD_389', 'SALE_187', 'PROD_012', 3, 135.50, 406.50),

-- SALE_188: Total = 680.00, UnitPrice = 136.00; j = 3
('SD_390', 'SALE_188', 'PROD_003', 2, 136.00, 272.00),
('SD_391', 'SALE_188', 'PROD_013', 3, 136.00, 408.00),

-- SALE_189: Total = 682.50, UnitPrice = 136.50; j = 4
('SD_392', 'SALE_189', 'PROD_004', 2, 136.50, 273.00),
('SD_393', 'SALE_189', 'PROD_014', 3, 136.50, 409.50),

-- SALE_190: Total = 685.00, UnitPrice = 137.00; j = 5
('SD_394', 'SALE_190', 'PROD_005', 2, 137.00, 274.00),
('SD_395', 'SALE_190', 'PROD_015', 3, 137.00, 411.00),

-- SALE_191: Total = 687.50, UnitPrice = 137.50; j = 6
('SD_396', 'SALE_191', 'PROD_006', 2, 137.50, 275.00),
('SD_397', 'SALE_191', 'PROD_016', 3, 137.50, 412.50),

-- SALE_192: Total = 690.00, UnitPrice = 138.00; j = 7
('SD_398', 'SALE_192', 'PROD_007', 2, 138.00, 276.00),
('SD_399', 'SALE_192', 'PROD_017', 3, 138.00, 414.00),

-- SALE_193: Total = 692.50, UnitPrice = 138.50; j = 8
('SD_400', 'SALE_193', 'PROD_008', 2, 138.50, 277.00),
('SD_401', 'SALE_193', 'PROD_018', 3, 138.50, 415.50),

-- SALE_194: Total = 695.00, UnitPrice = 139.00; j = 9
('SD_402', 'SALE_194', 'PROD_009', 2, 139.00, 278.00),
('SD_403', 'SALE_194', 'PROD_019', 3, 139.00, 417.00),

-- SALE_195: Total = 697.50, UnitPrice = 139.50; j = 10
('SD_404', 'SALE_195', 'PROD_010', 2, 139.50, 279.00),
('SD_405', 'SALE_195', 'PROD_020', 3, 139.50, 418.50),

-- SALE_196: Total = 700.00, UnitPrice = 140.00; j = 1
('SD_406', 'SALE_196', 'PROD_001', 2, 140.00, 280.00),
('SD_407', 'SALE_196', 'PROD_011', 3, 140.00, 420.00),

-- SALE_197: Total = 702.50, UnitPrice = 140.50; j = 2
('SD_408', 'SALE_197', 'PROD_002', 2, 140.50, 281.00),
('SD_409', 'SALE_197', 'PROD_012', 3, 140.50, 421.50),

-- SALE_198: Total = 705.00, UnitPrice = 141.00; j = 3
('SD_410', 'SALE_198', 'PROD_003', 2, 141.00, 282.00),
('SD_411', 'SALE_198', 'PROD_013', 3, 141.00, 423.00),

-- SALE_199: Total = 707.50, UnitPrice = 141.50; j = 4
('SD_412', 'SALE_199', 'PROD_004', 2, 141.50, 283.00),
('SD_413', 'SALE_199', 'PROD_014', 3, 141.50, 424.50),

-- SALE_200: Total = 710.00, UnitPrice = 142.00; j = 5
('SD_414', 'SALE_200', 'PROD_005', 2, 142.00, 284.00),
('SD_415', 'SALE_200', 'PROD_015', 3, 142.00, 426.00),

-- SALE_201: Total = 712.50, UnitPrice = 142.50; j = 6
('SD_416', 'SALE_201', 'PROD_006', 2, 142.50, 285.00),
('SD_417', 'SALE_201', 'PROD_016', 3, 142.50, 427.50),

-- SALE_202: Total = 715.00, UnitPrice = 143.00; j = 7
('SD_418', 'SALE_202', 'PROD_007', 2, 143.00, 286.00),
('SD_419', 'SALE_202', 'PROD_017', 3, 143.00, 429.00),

-- SALE_203: Total = 717.50, UnitPrice = 143.50; j = 8
('SD_420', 'SALE_203', 'PROD_008', 2, 143.50, 287.00),
('SD_421', 'SALE_203', 'PROD_018', 3, 143.50, 430.50),

-- SALE_204: Total = 720.00, UnitPrice = 144.00; j = 9
('SD_422', 'SALE_204', 'PROD_009', 2, 144.00, 288.00),
('SD_423', 'SALE_204', 'PROD_019', 3, 144.00, 432.00),

-- SALE_205: Total = 722.50, UnitPrice = 144.50; j = 10
('SD_424', 'SALE_205', 'PROD_010', 2, 144.50, 289.00),
('SD_425', 'SALE_205', 'PROD_020', 3, 144.50, 433.50),

-- SALE_206: Total = 725.00, UnitPrice = 145.00; j = 1
('SD_426', 'SALE_206', 'PROD_001', 2, 145.00, 290.00),
('SD_427', 'SALE_206', 'PROD_011', 3, 145.00, 435.00),

-- SALE_207: Total = 727.50, UnitPrice = 145.50; j = 2
('SD_428', 'SALE_207', 'PROD_002', 2, 145.50, 291.00),
('SD_429', 'SALE_207', 'PROD_012', 3, 145.50, 436.50),

-- SALE_208: Total = 730.00, UnitPrice = 146.00; j = 3
('SD_430', 'SALE_208', 'PROD_003', 2, 146.00, 292.00),
('SD_431', 'SALE_208', 'PROD_013', 3, 146.00, 438.00),

-- SALE_209: Total = 732.50, UnitPrice = 146.50; j = 4
('SD_432', 'SALE_209', 'PROD_004', 2, 146.50, 293.00),
('SD_433', 'SALE_209', 'PROD_014', 3, 146.50, 439.50),

-- SALE_210: Total = 735.00, UnitPrice = 147.00; j = 5
('SD_434', 'SALE_210', 'PROD_005', 2, 147.00, 294.00),
('SD_435', 'SALE_210', 'PROD_015', 3, 147.00, 441.00),

-- SALE_211: Total = 737.50, UnitPrice = 147.50; j = 6
('SD_436', 'SALE_211', 'PROD_006', 2, 147.50, 295.00),
('SD_437', 'SALE_211', 'PROD_016', 3, 147.50, 442.50),

-- SALE_212: Total = 740.00, UnitPrice = 148.00; j = 7
('SD_438', 'SALE_212', 'PROD_007', 2, 148.00, 296.00),
('SD_439', 'SALE_212', 'PROD_017', 3, 148.00, 444.00),

-- SALE_213: Total = 742.50, UnitPrice = 148.50; j = 8
('SD_440', 'SALE_213', 'PROD_008', 2, 148.50, 297.00),
('SD_441', 'SALE_213', 'PROD_018', 3, 148.50, 445.50),

-- SALE_214: Total = 745.00, UnitPrice = 149.00; j = 9
('SD_442', 'SALE_214', 'PROD_009', 2, 149.00, 298.00),
('SD_443', 'SALE_214', 'PROD_019', 3, 149.00, 447.00),

-- SALE_215: Total = 747.50, UnitPrice = 149.50; j = 10
('SD_444', 'SALE_215', 'PROD_010', 2, 149.50, 299.00),
('SD_445', 'SALE_215', 'PROD_020', 3, 149.50, 448.50),

-- SALE_216: Total = 750.00, UnitPrice = 150.00; j = 1
('SD_446', 'SALE_216', 'PROD_001', 2, 150.00, 300.00),
('SD_447', 'SALE_216', 'PROD_011', 3, 150.00, 450.00),

-- SALE_217: Total = 752.50, UnitPrice = 150.50; j = 2
('SD_448', 'SALE_217', 'PROD_002', 2, 150.50, 301.00),
('SD_449', 'SALE_217', 'PROD_012', 3, 150.50, 451.50),

-- SALE_218: Total = 755.00, UnitPrice = 151.00; j = 3
('SD_450', 'SALE_218', 'PROD_003', 2, 151.00, 302.00),
('SD_451', 'SALE_218', 'PROD_013', 3, 151.00, 453.00),

-- SALE_219: Total = 757.50, UnitPrice = 151.50; j = 4
('SD_452', 'SALE_219', 'PROD_004', 2, 151.50, 303.00),
('SD_453', 'SALE_219', 'PROD_014', 3, 151.50, 454.50),

-- SALE_220: Total = 760.00, UnitPrice = 152.00; j = 5
('SD_454', 'SALE_220', 'PROD_005', 2, 152.00, 304.00),
('SD_455', 'SALE_220', 'PROD_015', 3, 152.00, 456.00),

-- SALE_221: Total = 762.50, UnitPrice = 152.50; j = 6
('SD_456', 'SALE_221', 'PROD_006', 2, 152.50, 305.00),
('SD_457', 'SALE_221', 'PROD_016', 3, 152.50, 457.50),

-- SALE_222: Total = 765.00, UnitPrice = 153.00; j = 7
('SD_458', 'SALE_222', 'PROD_007', 2, 153.00, 306.00),
('SD_459', 'SALE_222', 'PROD_017', 3, 153.00, 459.00),

-- SALE_223: Total = 767.50, UnitPrice = 153.50; j = 8
('SD_460', 'SALE_223', 'PROD_008', 2, 153.50, 307.00),
('SD_461', 'SALE_223', 'PROD_018', 3, 153.50, 460.50),

-- SALE_224: Total = 770.00, UnitPrice = 154.00; j = 9
('SD_462', 'SALE_224', 'PROD_009', 2, 154.00, 308.00),
('SD_463', 'SALE_224', 'PROD_019', 3, 154.00, 462.00),

-- SALE_225: Total = 772.50, UnitPrice = 154.50; j = 10
('SD_464', 'SALE_225', 'PROD_010', 2, 154.50, 309.00),
('SD_465', 'SALE_225', 'PROD_020', 3, 154.50, 463.50),

-- SALE_226: Total = 775.00, UnitPrice = 155.00; j = 1
('SD_466', 'SALE_226', 'PROD_001', 2, 155.00, 310.00),
('SD_467', 'SALE_226', 'PROD_011', 3, 155.00, 465.00),

-- SALE_227: Total = 777.50, UnitPrice = 155.50; j = 2
('SD_468', 'SALE_227', 'PROD_002', 2, 155.50, 311.00),
('SD_469', 'SALE_227', 'PROD_012', 3, 155.50, 465.50),

-- SALE_228: Total = 780.00, UnitPrice = 156.00; j = 3
('SD_470', 'SALE_228', 'PROD_003', 2, 156.00, 312.00),
('SD_471', 'SALE_228', 'PROD_013', 3, 156.00, 468.00),

-- SALE_229: Total = 782.50, UnitPrice = 156.50; j = 4
('SD_472', 'SALE_229', 'PROD_004', 2, 156.50, 313.00),
('SD_473', 'SALE_229', 'PROD_014', 3, 156.50, 469.50),

-- SALE_230: Total = 785.00, UnitPrice = 157.00; j = 5
('SD_474', 'SALE_230', 'PROD_005', 2, 157.00, 314.00),
('SD_475', 'SALE_230', 'PROD_015', 3, 157.00, 471.00),

-- SALE_231: Total = 787.50, UnitPrice = 157.50; j = 6
('SD_476', 'SALE_231', 'PROD_006', 2, 157.50, 315.00),
('SD_477', 'SALE_231', 'PROD_016', 3, 157.50, 472.50),

-- SALE_232: Total = 790.00, UnitPrice = 158.00; j = 7
('SD_478', 'SALE_232', 'PROD_007', 2, 158.00, 316.00),
('SD_479', 'SALE_232', 'PROD_017', 3, 158.00, 474.00),

-- SALE_233: Total = 792.50, UnitPrice = 158.50; j = 8
('SD_480', 'SALE_233', 'PROD_008', 2, 158.50, 317.00),
('SD_481', 'SALE_233', 'PROD_018', 3, 158.50, 475.50),

-- SALE_234: Total = 795.00, UnitPrice = 159.00; j = 9
('SD_482', 'SALE_234', 'PROD_009', 2, 159.00, 318.00),
('SD_483', 'SALE_234', 'PROD_019', 3, 159.00, 477.00),

-- SALE_235: Total = 797.50, UnitPrice = 159.50; j = 10
('SD_484', 'SALE_235', 'PROD_010', 2, 159.50, 319.00),
('SD_485', 'SALE_235', 'PROD_020', 3, 159.50, 478.50);









CREATE OR REPLACE TABLE  RETAILDB_DEV.RAW_PRODUCT.Inventory (
InventoryID VARCHAR(255) PRIMARY KEY
,StoreID VARCHAR(255) 
,ProductID VARCHAR(255) 
,StockQuantity INT NOT NULL DEFAULT 0
,LastUpdated TIMESTAMP 
--DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
--,FOREIGN KEY (StoreID) REFERENCES Stores(StoreID)
--,FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);
INSERT INTO RETAILDB_DEV.RAW_PRODUCT.Inventory (InventoryID, StoreID, ProductID, StockQuantity, LastUpdated) VALUES
('INV_012', 'STR_004', 'PROD_090', 105, '2024-10-31 23:59:59'),
('INV_067', 'STR_001', 'PROD_089', 110, '2024-10-31 23:59:59'),
('INV_045', 'STR_007', 'PROD_088', 120, '2024-10-31 23:59:59'),
('INV_089', 'STR_003', 'PROD_087',  99, '2024-10-31 23:59:59'),
('INV_003',  'STR_005', 'PROD_086', 130, '2024-10-31 23:59:59'),
('INV_078', 'STR_002', 'PROD_085', 115, '2024-10-31 23:59:59'),
('INV_056', 'STR_006', 'PROD_084', 105, '2024-10-31 23:59:59'),
('INV_034', 'STR_004', 'PROD_083', 140, '2024-10-31 23:59:59'),
('INV_090', 'STR_001', 'PROD_082', 125, '2024-10-31 23:59:59'),
('INV_001', 'STR_007', 'PROD_081', 135, '2024-10-31 23:59:59'),
('INV_077', 'STR_003', 'PROD_080', 110, '2024-10-31 23:59:59'),
('INV_023', 'STR_005', 'PROD_079', 115, '2024-10-31 23:59:59'),
('INV_050', 'STR_002', 'PROD_078', 120, '2024-10-31 23:59:59'),
('INV_036', 'STR_006', 'PROD_077', 130, '2024-10-31 23:59:59'),
('INV_068', 'STR_004', 'PROD_076', 105, '2024-10-31 23:59:59'),
('INV_008', 'STR_001', 'PROD_075', 140, '2024-10-31 23:59:59'),
('INV_054', 'STR_007', 'PROD_074', 135, '2024-10-31 23:59:59'),
('INV_040', 'STR_003', 'PROD_073', 125, '2024-10-31 23:59:59'),
('INV_011', 'STR_005', 'PROD_072', 110, '2024-10-31 23:59:59'),
('INV_002', 'STR_002', 'PROD_071', 115, '2024-10-31 23:59:59'),
('INV_083', 'STR_006', 'PROD_070', 120, '2024-10-31 23:59:59'),
('INV_029', 'STR_004', 'PROD_069', 130, '2024-10-31 23:59:59'),
('INV_074', 'STR_001', 'PROD_068', 105, '2024-10-31 23:59:59'),
('INV_016', 'STR_007', 'PROD_067', 140, '2024-10-31 23:59:59'),
('INV_007', 'STR_003', 'PROD_066', 135, '2024-10-31 23:59:59'),
('INV_051', 'STR_005', 'PROD_065', 125, '2024-10-31 23:59:59'),
('INV_062', 'STR_002', 'PROD_064', 110, '2024-10-31 23:59:59'),
('INV_041', 'STR_006', 'PROD_063', 115, '2024-10-31 23:59:59'),
('INV_086', 'STR_004', 'PROD_062', 120, '2024-10-31 23:59:59'),
('INV_020', 'STR_001', 'PROD_061', 130, '2024-10-31 23:59:59'),
('INV_070', 'STR_007', 'PROD_060', 105, '2024-10-31 23:59:59'),
('INV_005', 'STR_003', 'PROD_059', 140, '2024-10-31 23:59:59'),
('INV_048', 'STR_005', 'PROD_058', 135, '2024-10-31 23:59:59'),
('INV_033', 'STR_002', 'PROD_057', 125, '2024-10-31 23:59:59'),
('INV_079', 'STR_006', 'PROD_056', 110, '2024-10-31 23:59:59'),
('INV_028', 'STR_004', 'PROD_055', 115, '2024-10-31 23:59:59'),
('INV_046', 'STR_001', 'PROD_054', 120, '2024-10-31 23:59:59'),
('INV_015', 'STR_007', 'PROD_053', 130, '2024-10-31 23:59:59'),
('INV_064', 'STR_003', 'PROD_052', 105, '2024-10-31 23:59:59'),
('INV_027', 'STR_005', 'PROD_051', 140, '2024-10-31 23:59:59'),
('INV_009', 'STR_002', 'PROD_050', 135, '2024-10-31 23:59:59'),
('INV_043', 'STR_006', 'PROD_049', 125, '2024-10-31 23:59:59'),
('INV_035', 'STR_004', 'PROD_048', 110, '2024-10-31 23:59:59'),
('INV_060', 'STR_001', 'PROD_047', 115, '2024-10-31 23:59:59'),
('INV_018', 'STR_007', 'PROD_046', 120, '2024-10-31 23:59:59'),
('INV_081', 'STR_003', 'PROD_045', 130, '2024-10-31 23:59:59'),
('INV_014', 'STR_005', 'PROD_044', 105, '2024-10-31 23:59:59'),
('INV_031', 'STR_002', 'PROD_043', 140, '2024-10-31 23:59:59'),
('INV_006', 'STR_006', 'PROD_042', 135, '2024-10-31 23:59:59'),
('INV_038', 'STR_004', 'PROD_041', 125, '2024-10-31 23:59:59'),
('INV_085', 'STR_001', 'PROD_040', 110, '2024-10-31 23:59:59'),
('INV_024', 'STR_007', 'PROD_039', 115, '2024-10-31 23:59:59'),
('INV_010', 'STR_003', 'PROD_038', 120, '2024-10-31 23:59:59'),
('INV_066', 'STR_005', 'PROD_037', 130, '2024-10-31 23:59:59'),
('INV_039', 'STR_002', 'PROD_036', 105, '2024-10-31 23:59:59'),
('INV_082', 'STR_006', 'PROD_035', 140, '2024-10-31 23:59:59'),
('INV_017', 'STR_004', 'PROD_034', 135, '2024-10-31 23:59:59'),
('INV_044', 'STR_001', 'PROD_033', 125, '2024-10-31 23:59:59'),
('INV_053', 'STR_007', 'PROD_032', 110, '2024-10-31 23:59:59'),
('INV_030', 'STR_003', 'PROD_031', 115, '2024-10-31 23:59:59'),
('INV_075', 'STR_005', 'PROD_030', 120, '2024-10-31 23:59:59'),
('INV_004', 'STR_002', 'PROD_029', 130, '2024-10-31 23:59:59'),
('INV_061', 'STR_006', 'PROD_028', 105, '2024-10-31 23:59:59'),
('INV_026', 'STR_004', 'PROD_027', 140, '2024-10-31 23:59:59'),
('INV_088', 'STR_001', 'PROD_026', 135, '2024-10-31 23:59:59'),
('INV_052', 'STR_007', 'PROD_025', 125, '2024-10-31 23:59:59'),
('INV_013', 'STR_003', 'PROD_024', 110, '2024-10-31 23:59:59'),
('INV_080', 'STR_005', 'PROD_023', 115, '2024-10-31 23:59:59'),
('INV_037', 'STR_002', 'PROD_022', 120, '2024-10-31 23:59:59'),
('INV_021', 'STR_006', 'PROD_021', 130, '2024-10-31 23:59:59'),
('INV_069', 'STR_004', 'PROD_020', 105, '2024-10-31 23:59:59'),
('INV_042', 'STR_001', 'PROD_019', 140, '2024-10-31 23:59:59'),
('INV_076', 'STR_007', 'PROD_018', 135, '2024-10-31 23:59:59'),
('INV_032', 'STR_003', 'PROD_017', 125, '2024-10-31 23:59:59'),
('INV_059', 'STR_005', 'PROD_016', 110, '2024-10-31 23:59:59'),
('INV_019', 'STR_002', 'PROD_015', 115, '2024-10-31 23:59:59'),
('INV_087', 'STR_006', 'PROD_014', 120, '2024-10-31 23:59:59'),
('INV_025', 'STR_004', 'PROD_013', 130, '2024-10-31 23:59:59'),
('INV_055', 'STR_001', 'PROD_012', 105, '2024-10-31 23:59:59'),
('INV_047', 'STR_007', 'PROD_011', 140, '2024-10-31 23:59:59'),
('INV_063', 'STR_003', 'PROD_010', 135, '2024-10-31 23:59:59'),
('INV_058', 'STR_005', 'PROD_009', 125, '2024-10-31 23:59:59'),
('INV_071', 'STR_002', 'PROD_008', 110, '2024-10-31 23:59:59'),
('INV_072', 'STR_006', 'PROD_007', 115, '2024-10-31 23:59:59'),
('INV_084', 'STR_004', 'PROD_006', 120, '2024-10-31 23:59:59'),
('INV_022', 'STR_001', 'PROD_005', 130, '2024-10-31 23:59:59'),
('INV_049', 'STR_007', 'PROD_004', 105, '2024-10-31 23:59:59'),
('INV_057', 'STR_003', 'PROD_003', 140, '2024-10-31 23:59:59'),
('INV_065', 'STR_005', 'PROD_002', 135, '2024-10-31 23:59:59'),
('INV_073', 'STR_002', 'PROD_001', 125, '2024-10-31 23:59:59');




CREATE OR REPLACE TABLE  RETAILDB_DEV.RAW_PRODUCT.Inventory_Nov2024 (
InventoryID VARCHAR(255)  PRIMARY KEY
,StoreID VARCHAR(255) 
,ProductID VARCHAR(255) 
,StockQuantity INT NOT NULL DEFAULT 0
,LastUpdated TIMESTAMP 
--DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
--,FOREIGN KEY (StoreID) REFERENCES Stores(StoreID)
--,FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

INSERT INTO RETAILDB_DEV.RAW_PRODUCT.Inventory (InventoryID, StoreID, ProductID, StockQuantity, LastUpdated) VALUES
('INV_001', 'STR_001', 'PROD_001', 101, '2024-11-30 23:59:59'),
('INV_002', 'STR_002', 'PROD_002', 102, '2024-11-30 23:59:59'),
('INV_003', 'STR_003', 'PROD_003', 103, '2024-11-30 23:59:59'),
('INV_004', 'STR_004', 'PROD_004', 104, '2024-11-30 23:59:59'),
('INV_005', 'STR_005', 'PROD_005', 105, '2024-11-30 23:59:59'),
('INV_006', 'STR_006', 'PROD_006', 106, '2024-11-30 23:59:59'),
('INV_007', 'STR_007', 'PROD_007', 107, '2024-11-30 23:59:59'),
('INV_008', 'STR_001', 'PROD_008', 108, '2024-11-30 23:59:59'),
('INV_009', 'STR_002', 'PROD_009', 109, '2024-11-30 23:59:59'),
('INV_010', 'STR_003', 'PROD_010', 110, '2024-11-30 23:59:59'),
('INV_011', 'STR_004', 'PROD_011', 111, '2024-11-30 23:59:59'),
('INV_012', 'STR_005', 'PROD_012', 112, '2024-11-30 23:59:59'),
('INV_013', 'STR_006', 'PROD_013', 113, '2024-11-30 23:59:59'),
('INV_014', 'STR_007', 'PROD_014', 114, '2024-11-30 23:59:59'),
('INV_015', 'STR_001', 'PROD_015', 115, '2024-11-30 23:59:59'),
('INV_016', 'STR_002', 'PROD_016', 116, '2024-11-30 23:59:59'),
('INV_017', 'STR_003', 'PROD_017', 117, '2024-11-30 23:59:59'),
('INV_018', 'STR_004', 'PROD_018', 118, '2024-11-30 23:59:59'),
('INV_019', 'STR_005', 'PROD_019', 119, '2024-11-30 23:59:59'),
('INV_020', 'STR_006', 'PROD_020', 120, '2024-11-30 23:59:59'),
('INV_021', 'STR_007', 'PROD_021', 121, '2024-11-30 23:59:59'),
('INV_022', 'STR_001', 'PROD_022', 122, '2024-11-30 23:59:59'),
('INV_023', 'STR_002', 'PROD_023', 123, '2024-11-30 23:59:59'),
('INV_024', 'STR_003', 'PROD_024', 124, '2024-11-30 23:59:59'),
('INV_025', 'STR_004', 'PROD_025', 125, '2024-11-30 23:59:59'),
('INV_026', 'STR_005', 'PROD_026', 126, '2024-11-30 23:59:59'),
('INV_027', 'STR_006', 'PROD_027', 127, '2024-11-30 23:59:59'),
('INV_028', 'STR_007', 'PROD_028', 128, '2024-11-30 23:59:59'),
('INV_029', 'STR_001', 'PROD_029', 129, '2024-11-30 23:59:59'),
('INV_030', 'STR_002', 'PROD_030', 130, '2024-11-30 23:59:59'),
('INV_031', 'STR_003', 'PROD_031', 131, '2024-11-30 23:59:59'),
('INV_032', 'STR_004', 'PROD_032', 132, '2024-11-30 23:59:59'),
('INV_033', 'STR_005', 'PROD_033', 133, '2024-11-30 23:59:59'),
('INV_034', 'STR_006', 'PROD_034', 134, '2024-11-30 23:59:59'),
('INV_035', 'STR_007', 'PROD_035', 135, '2024-11-30 23:59:59'),
('INV_036', 'STR_001', 'PROD_036', 136, '2024-11-30 23:59:59'),
('INV_037', 'STR_002', 'PROD_037', 137, '2024-11-30 23:59:59'),
('INV_038', 'STR_003', 'PROD_038', 138, '2024-11-30 23:59:59'),
('INV_039', 'STR_004', 'PROD_039', 139, '2024-11-30 23:59:59'),
('INV_040', 'STR_005', 'PROD_040', 140, '2024-11-30 23:59:59'),
('INV_041', 'STR_006', 'PROD_041', 141, '2024-11-30 23:59:59'),
('INV_042', 'STR_007', 'PROD_042', 142, '2024-11-30 23:59:59'),
('INV_043', 'STR_001', 'PROD_043', 143, '2024-11-30 23:59:59'),
('INV_044', 'STR_002', 'PROD_044', 144, '2024-11-30 23:59:59'),
('INV_045', 'STR_003', 'PROD_045', 145, '2024-11-30 23:59:59'),
('INV_046', 'STR_004', 'PROD_046', 146, '2024-11-30 23:59:59'),
('INV_047', 'STR_005', 'PROD_047', 147, '2024-11-30 23:59:59'),
('INV_048', 'STR_006', 'PROD_048', 148, '2024-11-30 23:59:59'),
('INV_049', 'STR_007', 'PROD_049', 149, '2024-11-30 23:59:59'),
('INV_050', 'STR_001', 'PROD_050', 150, '2024-11-30 23:59:59'),
('INV_051', 'STR_002', 'PROD_051', 101, '2024-11-30 23:59:59'),
('INV_052', 'STR_003', 'PROD_052', 102, '2024-11-30 23:59:59'),
('INV_053', 'STR_004', 'PROD_053', 103, '2024-11-30 23:59:59'),
('INV_054', 'STR_005', 'PROD_054', 104, '2024-11-30 23:59:59'),
('INV_055', 'STR_006', 'PROD_055', 105, '2024-11-30 23:59:59'),
('INV_056', 'STR_007', 'PROD_056', 106, '2024-11-30 23:59:59'),
('INV_057', 'STR_001', 'PROD_057', 107, '2024-11-30 23:59:59'),
('INV_058', 'STR_002', 'PROD_058', 108, '2024-11-30 23:59:59'),
('INV_059', 'STR_003', 'PROD_059', 109, '2024-11-30 23:59:59'),
('INV_060', 'STR_004', 'PROD_060', 110, '2024-11-30 23:59:59'),
('INV_061', 'STR_005', 'PROD_061', 111, '2024-11-30 23:59:59'),
('INV_062', 'STR_006', 'PROD_062', 112, '2024-11-30 23:59:59'),
('INV_063', 'STR_007', 'PROD_063', 113, '2024-11-30 23:59:59'),
('INV_064', 'STR_001', 'PROD_064', 114, '2024-11-30 23:59:59'),
('INV_065', 'STR_002', 'PROD_065', 115, '2024-11-30 23:59:59'),
('INV_066', 'STR_003', 'PROD_066', 116, '2024-11-30 23:59:59'),
('INV_067', 'STR_004', 'PROD_067', 117, '2024-11-30 23:59:59'),
('INV_068', 'STR_005', 'PROD_068', 118, '2024-11-30 23:59:59'),
('INV_069', 'STR_006', 'PROD_069', 119, '2024-11-30 23:59:59'),
('INV_070', 'STR_007', 'PROD_070', 120, '2024-11-30 23:59:59'),
('INV_071', 'STR_001', 'PROD_071', 121, '2024-11-30 23:59:59'),
('INV_072', 'STR_002', 'PROD_072', 122, '2024-11-30 23:59:59'),
('INV_073', 'STR_003', 'PROD_073', 123, '2024-11-30 23:59:59'),
('INV_074', 'STR_004', 'PROD_074', 124, '2024-11-30 23:59:59'),
('INV_075', 'STR_005', 'PROD_075', 125, '2024-11-30 23:59:59'),
('INV_076', 'STR_006', 'PROD_076', 126, '2024-11-30 23:59:59'),
('INV_077', 'STR_007', 'PROD_077', 127, '2024-11-30 23:59:59'),
('INV_078', 'STR_001', 'PROD_078', 128, '2024-11-30 23:59:59'),
('INV_079', 'STR_002', 'PROD_079', 129, '2024-11-30 23:59:59'),
('INV_080', 'STR_003', 'PROD_080', 130, '2024-11-30 23:59:59'),
('INV_081', 'STR_004', 'PROD_081', 131, '2024-11-30 23:59:59'),
('INV_082', 'STR_005', 'PROD_082', 132, '2024-11-30 23:59:59'),
('INV_083', 'STR_006', 'PROD_083', 133, '2024-11-30 23:59:59'),
('INV_084', 'STR_007', 'PROD_084', 134, '2024-11-30 23:59:59'),
('INV_085', 'STR_001', 'PROD_085', 135, '2024-11-30 23:59:59'),
('INV_086', 'STR_002', 'PROD_086', 136, '2024-11-30 23:59:59'),
('INV_087', 'STR_003', 'PROD_087', 137, '2024-11-30 23:59:59'),
('INV_088', 'STR_004', 'PROD_088', 138, '2024-11-30 23:59:59'),
('INV_089', 'STR_005', 'PROD_089', 139, '2024-11-30 23:59:59'),
('INV_090', 'STR_006', 'PROD_090', 140, '2024-11-30 23:59:59');





CREATE OR REPLACE TABLE  RETAILDB_DEV.RAW_PRODUCT.Inventory_Dec2024 (
InventoryID VARCHAR(255)  PRIMARY KEY
,StoreID VARCHAR(255) 
,ProductID VARCHAR(255) 
,StockQuantity INT NOT NULL DEFAULT 0
,LastUpdated TIMESTAMP 
--DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
--,FOREIGN KEY (StoreID) REFERENCES Stores(StoreID)
--,FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);


INSERT INTO RETAILDB_DEV.RAW_PRODUCT.Inventory_Dec2024 (InventoryID, StoreID, ProductID, StockQuantity, LastUpdated) VALUES
('INV_001', 'STR_001', 'PROD_001', 101, '2024-12-31 23:59:59'),
('INV_002', 'STR_002', 'PROD_002', 102, '2024-12-31 23:59:59'),
('INV_003', 'STR_003', 'PROD_003', 103, '2024-12-31 23:59:59'),
('INV_004', 'STR_004', 'PROD_004', 104, '2024-12-31 23:59:59'),
('INV_005', 'STR_005', 'PROD_005', 105, '2024-12-31 23:59:59'),
('INV_006', 'STR_006', 'PROD_006', 106, '2024-12-31 23:59:59'),
('INV_007', 'STR_007', 'PROD_007', 107, '2024-12-31 23:59:59'),
('INV_008', 'STR_001', 'PROD_008', 108, '2024-12-31 23:59:59'),
('INV_009', 'STR_002', 'PROD_009', 109, '2024-12-31 23:59:59'),
('INV_010', 'STR_003', 'PROD_010', 110, '2024-12-31 23:59:59'),
('INV_011', 'STR_004', 'PROD_011', 111, '2024-12-31 23:59:59'),
('INV_012', 'STR_005', 'PROD_012', 112, '2024-12-31 23:59:59'),
('INV_013', 'STR_006', 'PROD_013', 113, '2024-12-31 23:59:59'),
('INV_014', 'STR_007', 'PROD_014', 114, '2024-12-31 23:59:59'),
('INV_015', 'STR_001', 'PROD_015', 115, '2024-12-31 23:59:59'),
('INV_016', 'STR_002', 'PROD_016', 116, '2024-12-31 23:59:59'),
('INV_017', 'STR_003', 'PROD_017', 117, '2024-12-31 23:59:59'),
('INV_018', 'STR_004', 'PROD_018', 118, '2024-12-31 23:59:59'),
('INV_019', 'STR_005', 'PROD_019', 119, '2024-12-31 23:59:59'),
('INV_020', 'STR_006', 'PROD_020', 120, '2024-12-31 23:59:59'),
('INV_021', 'STR_007', 'PROD_021', 121, '2024-12-31 23:59:59'),
('INV_022', 'STR_001', 'PROD_022', 122, '2024-12-31 23:59:59'),
('INV_023', 'STR_002', 'PROD_023', 123, '2024-12-31 23:59:59'),
('INV_024', 'STR_003', 'PROD_024', 124, '2024-12-31 23:59:59'),
('INV_025', 'STR_004', 'PROD_025', 125, '2024-12-31 23:59:59'),
('INV_026', 'STR_005', 'PROD_026', 126, '2024-12-31 23:59:59'),
('INV_027', 'STR_006', 'PROD_027', 127, '2024-12-31 23:59:59'),
('INV_028', 'STR_007', 'PROD_028', 128, '2024-12-31 23:59:59'),
('INV_029', 'STR_001', 'PROD_029', 129, '2024-12-31 23:59:59'),
('INV_030', 'STR_002', 'PROD_030', 130, '2024-12-31 23:59:59'),
('INV_031', 'STR_003', 'PROD_031', 131, '2024-12-31 23:59:59'),
('INV_032', 'STR_004', 'PROD_032', 132, '2024-12-31 23:59:59'),
('INV_033', 'STR_005', 'PROD_033', 133, '2024-12-31 23:59:59'),
('INV_034', 'STR_006', 'PROD_034', 134, '2024-12-31 23:59:59'),
('INV_035', 'STR_007', 'PROD_035', 135, '2024-12-31 23:59:59'),
('INV_036', 'STR_001', 'PROD_036', 136, '2024-12-31 23:59:59'),
('INV_037', 'STR_002', 'PROD_037', 137, '2024-12-31 23:59:59'),
('INV_038', 'STR_003', 'PROD_038', 138, '2024-12-31 23:59:59'),
('INV_039', 'STR_004', 'PROD_039', 139, '2024-12-31 23:59:59'),
('INV_040', 'STR_005', 'PROD_040', 140, '2024-12-31 23:59:59'),
('INV_041', 'STR_006', 'PROD_041', 141, '2024-12-31 23:59:59'),
('INV_042', 'STR_007', 'PROD_042', 142, '2024-12-31 23:59:59'),
('INV_043', 'STR_001', 'PROD_043', 143, '2024-12-31 23:59:59'),
('INV_044', 'STR_002', 'PROD_044', 144, '2024-12-31 23:59:59'),
('INV_045', 'STR_003', 'PROD_045', 145, '2024-12-31 23:59:59'),
('INV_046', 'STR_004', 'PROD_046', 146, '2024-12-31 23:59:59'),
('INV_047', 'STR_005', 'PROD_047', 147, '2024-12-31 23:59:59'),
('INV_048', 'STR_006', 'PROD_048', 148, '2024-12-31 23:59:59'),
('INV_049', 'STR_007', 'PROD_049', 149, '2024-12-31 23:59:59'),
('INV_050', 'STR_001', 'PROD_050', 150, '2024-12-31 23:59:59'),
('INV_051', 'STR_002', 'PROD_051', 101, '2024-12-31 23:59:59'),
('INV_052', 'STR_003', 'PROD_052', 102, '2024-12-31 23:59:59'),
('INV_053', 'STR_004', 'PROD_053', 103, '2024-12-31 23:59:59'),
('INV_054', 'STR_005', 'PROD_054', 104, '2024-12-31 23:59:59'),
('INV_055', 'STR_006', 'PROD_055', 105, '2024-12-31 23:59:59'),
('INV_056', 'STR_007', 'PROD_056', 106, '2024-12-31 23:59:59'),
('INV_057', 'STR_001', 'PROD_057', 107, '2024-12-31 23:59:59'),
('INV_058', 'STR_002', 'PROD_058', 108, '2024-12-31 23:59:59'),
('INV_059', 'STR_003', 'PROD_059', 109, '2024-12-31 23:59:59'),
('INV_060', 'STR_004', 'PROD_060', 110, '2024-12-31 23:59:59'),
('INV_061', 'STR_005', 'PROD_061', 111, '2024-12-31 23:59:59'),
('INV_062', 'STR_006', 'PROD_062', 112, '2024-12-31 23:59:59'),
('INV_063', 'STR_007', 'PROD_063', 113, '2024-12-31 23:59:59'),
('INV_064', 'STR_001', 'PROD_064', 114, '2024-12-31 23:59:59'),
('INV_065', 'STR_002', 'PROD_065', 115, '2024-12-31 23:59:59'),
('INV_066', 'STR_003', 'PROD_066', 116, '2024-12-31 23:59:59'),
('INV_067', 'STR_004', 'PROD_067', 117, '2024-12-31 23:59:59'),
('INV_068', 'STR_005', 'PROD_068', 118, '2024-12-31 23:59:59'),
('INV_069', 'STR_006', 'PROD_069', 119, '2024-12-31 23:59:59'),
('INV_070', 'STR_007', 'PROD_070', 120, '2024-12-31 23:59:59'),
('INV_071', 'STR_001', 'PROD_071', 121, '2024-12-31 23:59:59'),
('INV_072', 'STR_002', 'PROD_072', 122, '2024-12-31 23:59:59'),
('INV_073', 'STR_003', 'PROD_073', 123, '2024-12-31 23:59:59'),
('INV_074', 'STR_004', 'PROD_074', 124, '2024-12-31 23:59:59'),
('INV_075', 'STR_005', 'PROD_075', 125, '2024-12-31 23:59:59'),
('INV_076', 'STR_006', 'PROD_076', 126, '2024-12-31 23:59:59'),
('INV_077', 'STR_007', 'PROD_077', 127, '2024-12-31 23:59:59'),
('INV_078', 'STR_001', 'PROD_078', 128, '2024-12-31 23:59:59'),
('INV_079', 'STR_002', 'PROD_079', 129, '2024-12-31 23:59:59'),
('INV_080', 'STR_003', 'PROD_080', 130, '2024-12-31 23:59:59'),
('INV_081', 'STR_004', 'PROD_081', 131, '2024-12-31 23:59:59'),
('INV_082', 'STR_005', 'PROD_082', 132, '2024-12-31 23:59:59'),
('INV_083', 'STR_006', 'PROD_083', 133, '2024-12-31 23:59:59'),
('INV_084', 'STR_007', 'PROD_084', 134, '2024-12-31 23:59:59'),
('INV_085', 'STR_001', 'PROD_085', 135, '2024-12-31 23:59:59'),
('INV_086', 'STR_002', 'PROD_086', 136, '2024-12-31 23:59:59'),
('INV_087', 'STR_003', 'PROD_087', 137, '2024-12-31 23:59:59'),
('INV_088', 'STR_004', 'PROD_088', 138, '2024-12-31 23:59:59'),
('INV_089', 'STR_005', 'PROD_089', 139, '2024-12-31 23:59:59'),
('INV_090', 'STR_006', 'PROD_090', 140, '2024-12-31 23:59:59');







CREATE OR REPLACE TABLE  RETAILDB_DEV.RAW_Procurement.PurchaseOrders (
PurchaseOrderID VARCHAR(255) PRIMARY KEY
,SupplierID VARCHAR(255)
,OrderDate DATE 
,Status VARCHAR(255) --ENUM('Pending', 'Completed', 'Canceled') DEFAULT 'Pending'
--,FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID)
);


-- October 2024 PurchaseOrders (PO_001 to PO_090)
INSERT INTO  RETAILDB_DEV.RAW_Procurement.PurchaseOrders (PurchaseOrderID, SupplierID, OrderDate, Status) VALUES
('PO_001', 'SUP_001', '2024-10-01', 'Completed'),
('PO_002', 'SUP_002', '2024-10-02', 'Completed'),
('PO_003', 'SUP_003', '2024-10-03', 'Completed'),
('PO_004', 'SUP_004', '2024-10-04', 'Completed'),
('PO_005', 'SUP_005', '2024-10-05', 'Completed'),
('PO_006', 'SUP_006', '2024-10-06', 'Completed'),
('PO_007', 'SUP_007', '2024-10-07', 'Completed'),
('PO_008', 'SUP_008', '2024-10-08', 'Completed'),
('PO_009', 'SUP_009', '2024-10-09', 'Completed'),
('PO_010', 'SUP_010', '2024-10-10', 'Completed'),
('PO_011', 'SUP_001', '2024-10-11', 'Completed'),
('PO_012', 'SUP_002', '2024-10-12', 'Completed'),
('PO_013', 'SUP_003', '2024-10-13', 'Completed'),
('PO_014', 'SUP_004', '2024-10-14', 'Completed'),
('PO_015', 'SUP_005', '2024-10-15', 'Completed'),
('PO_016', 'SUP_006', '2024-10-16', 'Completed'),
('PO_017', 'SUP_007', '2024-10-17', 'Completed'),
('PO_018', 'SUP_008', '2024-10-18', 'Completed'),
('PO_019', 'SUP_009', '2024-10-19', 'Completed'),
('PO_020', 'SUP_010', '2024-10-20', 'Completed'),
('PO_021', 'SUP_001', '2024-10-21', 'Completed'),
('PO_022', 'SUP_002', '2024-10-22', 'Completed'),
('PO_023', 'SUP_003', '2024-10-23', 'Completed'),
('PO_024', 'SUP_004', '2024-10-24', 'Completed'),
('PO_025', 'SUP_005', '2024-10-25', 'Completed'),
('PO_026', 'SUP_006', '2024-10-26', 'Completed'),
('PO_027', 'SUP_007', '2024-10-27', 'Completed'),
('PO_028', 'SUP_008', '2024-10-28', 'Completed'),
('PO_029', 'SUP_009', '2024-10-29', 'Completed'),
('PO_030', 'SUP_010', '2024-10-30', 'Completed'),
('PO_031', 'SUP_001', '2024-10-01', 'Completed'),
('PO_032', 'SUP_002', '2024-10-02', 'Completed'),
('PO_033', 'SUP_003', '2024-10-03', 'Completed'),
('PO_034', 'SUP_004', '2024-10-04', 'Completed'),
('PO_035', 'SUP_005', '2024-10-05', 'Completed'),
('PO_036', 'SUP_006', '2024-10-06', 'Completed'),
('PO_037', 'SUP_007', '2024-10-07', 'Completed'),
('PO_038', 'SUP_008', '2024-10-08', 'Completed'),
('PO_039', 'SUP_009', '2024-10-09', 'Completed'),
('PO_040', 'SUP_010', '2024-10-10', 'Completed'),
('PO_041', 'SUP_001', '2024-10-11', 'Completed'),
('PO_042', 'SUP_002', '2024-10-12', 'Completed'),
('PO_043', 'SUP_003', '2024-10-13', 'Completed'),
('PO_044', 'SUP_004', '2024-10-14', 'Completed'),
('PO_045', 'SUP_005', '2024-10-15', 'Completed'),
('PO_046', 'SUP_006', '2024-10-16', 'Completed'),
('PO_047', 'SUP_007', '2024-10-17', 'Completed'),
('PO_048', 'SUP_008', '2024-10-18', 'Completed'),
('PO_049', 'SUP_009', '2024-10-19', 'Completed'),
('PO_050', 'SUP_010', '2024-10-20', 'Completed'),
('PO_051', 'SUP_001', '2024-10-21', 'Completed'),
('PO_052', 'SUP_002', '2024-10-22', 'Completed'),
('PO_053', 'SUP_003', '2024-10-23', 'Completed'),
('PO_054', 'SUP_004', '2024-10-24', 'Completed'),
('PO_055', 'SUP_005', '2024-10-25', 'Completed'),
('PO_056', 'SUP_006', '2024-10-26', 'Completed'),
('PO_057', 'SUP_007', '2024-10-27', 'Completed'),
('PO_058', 'SUP_008', '2024-10-28', 'Completed'),
('PO_059', 'SUP_009', '2024-10-29', 'Completed'),
('PO_060', 'SUP_010', '2024-10-30', 'Completed'),
('PO_061', 'SUP_001', '2024-10-01', 'Completed'),
('PO_062', 'SUP_002', '2024-10-02', 'Completed'),
('PO_063', 'SUP_003', '2024-10-03', 'Completed'),
('PO_064', 'SUP_004', '2024-10-04', 'Completed'),
('PO_065', 'SUP_005', '2024-10-05', 'Completed'),
('PO_066', 'SUP_006', '2024-10-06', 'Completed'),
('PO_067', 'SUP_007', '2024-10-07', 'Completed'),
('PO_068', 'SUP_008', '2024-10-08', 'Completed'),
('PO_069', 'SUP_009', '2024-10-09', 'Completed'),
('PO_070', 'SUP_010', '2024-10-10', 'Completed'),
('PO_071', 'SUP_001', '2024-10-11', 'Completed'),
('PO_072', 'SUP_002', '2024-10-12', 'Completed'),
('PO_073', 'SUP_003', '2024-10-13', 'Completed'),
('PO_074', 'SUP_004', '2024-10-14', 'Completed'),
('PO_075', 'SUP_005', '2024-10-15', 'Completed'),
('PO_076', 'SUP_006', '2024-10-16', 'Completed'),
('PO_077', 'SUP_007', '2024-10-17', 'Completed'),
('PO_078', 'SUP_008', '2024-10-18', 'Completed'),
('PO_079', 'SUP_009', '2024-10-19', 'Completed'),
('PO_080', 'SUP_010', '2024-10-20', 'Completed'),
('PO_081', 'SUP_001', '2024-10-21', 'Completed'),
('PO_082', 'SUP_002', '2024-10-22', 'Completed'),
('PO_083', 'SUP_003', '2024-10-23', 'Completed'),
('PO_084', 'SUP_004', '2024-10-24', 'Completed'),
('PO_085', 'SUP_005', '2024-10-25', 'Completed'),
('PO_086', 'SUP_006', '2024-10-26', 'Completed'),
('PO_087', 'SUP_007', '2024-10-27', 'Completed'),
('PO_088', 'SUP_008', '2024-10-28', 'Completed'),
('PO_089', 'SUP_009', '2024-10-29', 'Completed'),
('PO_090', 'SUP_010', '2024-10-30', 'Completed');



CREATE OR REPLACE TABLE RETAILDB_DEV.RAW_Procurement.PurchaseOrders_Nov2024 (
PurchaseOrderID VARCHAR(255) PRIMARY KEY
,SupplierID VARCHAR(255)
,OrderDate DATE NOT NULL DEFAULT CURRENT_DATE
,Status VARCHAR(255) --ENUM('Pending', 'Completed', 'Canceled') DEFAULT 'Pending'
--,FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID)
);

INSERT INTO RETAILDB_DEV.RAW_Procurement.PurchaseOrders_Nov2024 (PurchaseOrderID, SupplierID, OrderDate, Status) VALUES
-- November 2024 PurchaseOrders (PO_091 to PO_180)
('PO_091', 'SUP_001', '2024-11-01', 'Completed'),
('PO_092', 'SUP_002', '2024-11-02', 'Completed'),
('PO_093', 'SUP_003', '2024-11-03', 'Completed'),
('PO_094', 'SUP_004', '2024-11-04', 'Completed'),
('PO_095', 'SUP_005', '2024-11-05', 'Completed'),
('PO_096', 'SUP_006', '2024-11-06', 'Completed'),
('PO_097', 'SUP_007', '2024-11-07', 'Completed'),
('PO_098', 'SUP_008', '2024-11-08', 'Completed'),
('PO_099', 'SUP_009', '2024-11-09', 'Completed'),
('PO_100', 'SUP_010', '2024-11-10', 'Completed'),
('PO_101', 'SUP_001', '2024-11-11', 'Completed'),
('PO_102', 'SUP_002', '2024-11-12', 'Completed'),
('PO_103', 'SUP_003', '2024-11-13', 'Completed'),
('PO_104', 'SUP_004', '2024-11-14', 'Completed'),
('PO_105', 'SUP_005', '2024-11-15', 'Completed'),
('PO_106', 'SUP_006', '2024-11-16', 'Completed'),
('PO_107', 'SUP_007', '2024-11-17', 'Completed'),
('PO_108', 'SUP_008', '2024-11-18', 'Completed'),
('PO_109', 'SUP_009', '2024-11-19', 'Completed'),
('PO_110', 'SUP_010', '2024-11-20', 'Completed'),
('PO_111', 'SUP_001', '2024-11-21', 'Completed'),
('PO_112', 'SUP_002', '2024-11-22', 'Completed'),
('PO_113', 'SUP_003', '2024-11-23', 'Completed'),
('PO_114', 'SUP_004', '2024-11-24', 'Completed'),
('PO_115', 'SUP_005', '2024-11-25', 'Completed'),
('PO_116', 'SUP_006', '2024-11-26', 'Completed'),
('PO_117', 'SUP_007', '2024-11-27', 'Completed'),
('PO_118', 'SUP_008', '2024-11-28', 'Completed'),
('PO_119', 'SUP_009', '2024-11-29', 'Completed'),
('PO_120', 'SUP_010', '2024-11-30', 'Completed'),
('PO_121', 'SUP_001', '2024-11-01', 'Completed'),
('PO_122', 'SUP_002', '2024-11-02', 'Completed'),
('PO_123', 'SUP_003', '2024-11-03', 'Completed'),
('PO_124', 'SUP_004', '2024-11-04', 'Completed'),
('PO_125', 'SUP_005', '2024-11-05', 'Completed'),
('PO_126', 'SUP_006', '2024-11-06', 'Completed'),
('PO_127', 'SUP_007', '2024-11-07', 'Completed'),
('PO_128', 'SUP_008', '2024-11-08', 'Completed'),
('PO_129', 'SUP_009', '2024-11-09', 'Completed'),
('PO_130', 'SUP_010', '2024-11-10', 'Completed'),
('PO_131', 'SUP_001', '2024-11-11', 'Completed'),
('PO_132', 'SUP_002', '2024-11-12', 'Completed'),
('PO_133', 'SUP_003', '2024-11-13', 'Completed'),
('PO_134', 'SUP_004', '2024-11-14', 'Completed'),
('PO_135', 'SUP_005', '2024-11-15', 'Completed'),
('PO_136', 'SUP_006', '2024-11-16', 'Completed'),
('PO_137', 'SUP_007', '2024-11-17', 'Completed'),
('PO_138', 'SUP_008', '2024-11-18', 'Completed'),
('PO_139', 'SUP_009', '2024-11-19', 'Completed'),
('PO_140', 'SUP_010', '2024-11-20', 'Completed'),
('PO_141', 'SUP_001', '2024-11-21', 'Completed'),
('PO_142', 'SUP_002', '2024-11-22', 'Completed'),
('PO_143', 'SUP_003', '2024-11-23', 'Completed'),
('PO_144', 'SUP_004', '2024-11-24', 'Completed'),
('PO_145', 'SUP_005', '2024-11-25', 'Completed'),
('PO_146', 'SUP_006', '2024-11-26', 'Completed'),
('PO_147', 'SUP_007', '2024-11-27', 'Completed'),
('PO_148', 'SUP_008', '2024-11-28', 'Completed'),
('PO_149', 'SUP_009', '2024-11-29', 'Completed'),
('PO_150', 'SUP_010', '2024-11-30', 'Completed'),
('PO_151', 'SUP_001', '2024-11-01', 'Completed'),
('PO_152', 'SUP_002', '2024-11-02', 'Completed'),
('PO_153', 'SUP_003', '2024-11-03', 'Completed'),
('PO_154', 'SUP_004', '2024-11-04', 'Completed'),
('PO_155', 'SUP_005', '2024-11-05', 'Completed'),
('PO_156', 'SUP_006', '2024-11-06', 'Completed'),
('PO_157', 'SUP_007', '2024-11-07', 'Completed'),
('PO_158', 'SUP_008', '2024-11-08', 'Completed'),
('PO_159', 'SUP_009', '2024-11-09', 'Completed'),
('PO_160', 'SUP_010', '2024-11-10', 'Completed'),
('PO_161', 'SUP_001', '2024-11-11', 'Completed'),
('PO_162', 'SUP_002', '2024-11-12', 'Completed'),
('PO_163', 'SUP_003', '2024-11-13', 'Completed'),
('PO_164', 'SUP_004', '2024-11-14', 'Completed'),
('PO_165', 'SUP_005', '2024-11-15', 'Completed'),
('PO_166', 'SUP_006', '2024-11-16', 'Completed'),
('PO_167', 'SUP_007', '2024-11-17', 'Completed'),
('PO_168', 'SUP_008', '2024-11-18', 'Completed'),
('PO_169', 'SUP_009', '2024-11-19', 'Completed'),
('PO_170', 'SUP_010', '2024-11-20', 'Completed'),
('PO_171', 'SUP_001', '2024-11-21', 'Completed'),
('PO_172', 'SUP_002', '2024-11-22', 'Completed'),
('PO_173', 'SUP_003', '2024-11-23', 'Completed'),
('PO_174', 'SUP_004', '2024-11-24', 'Completed'),
('PO_175', 'SUP_005', '2024-11-25', 'Completed'),
('PO_176', 'SUP_006', '2024-11-26', 'Completed'),
('PO_177', 'SUP_007', '2024-11-27', 'Completed'),
('PO_178', 'SUP_008', '2024-11-28', 'Completed'),
('PO_179', 'SUP_009', '2024-11-29', 'Completed'),
('PO_180', 'SUP_010', '2024-11-30', 'Completed');




CREATE OR REPLACE TABLE   RETAILDB_DEV.RAW_Procurement.PurchaseOrders_Dec2024 (
PurchaseOrderID VARCHAR(255) PRIMARY KEY
,SupplierID VARCHAR(255)
,OrderDate DATE NOT NULL DEFAULT CURRENT_DATE
,Status VARCHAR(255) --ENUM('Pending', 'Completed', 'Canceled') DEFAULT 'Pending'
--,FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID)
);

INSERT INTO  RETAILDB_DEV.RAW_Procurement.PurchaseOrders_Dec2024 (PurchaseOrderID, SupplierID, OrderDate, Status) VALUES
-- December 2024 PurchaseOrders (PO_181 to PO_270)
('PO_181', 'SUP_001', '2024-12-01', 'Completed'),
('PO_182', 'SUP_002', '2024-12-02', 'Completed'),
('PO_183', 'SUP_003', '2024-12-03', 'Completed'),
('PO_184', 'SUP_004', '2024-12-04', 'Completed'),
('PO_185', 'SUP_005', '2024-12-05', 'Completed'),
('PO_186', 'SUP_006', '2024-12-06', 'Completed'),
('PO_187', 'SUP_007', '2024-12-07', 'Completed'),
('PO_188', 'SUP_008', '2024-12-08', 'Completed'),
('PO_189', 'SUP_009', '2024-12-09', 'Completed'),
('PO_190', 'SUP_010', '2024-12-10', 'Completed'),
('PO_191', 'SUP_001', '2024-12-11', 'Completed'),
('PO_192', 'SUP_002', '2024-12-12', 'Completed'),
('PO_193', 'SUP_003', '2024-12-13', 'Completed'),
('PO_194', 'SUP_004', '2024-12-14', 'Completed'),
('PO_195', 'SUP_005', '2024-12-15', 'Completed'),
('PO_196', 'SUP_006', '2024-12-16', 'Completed'),
('PO_197', 'SUP_007', '2024-12-17', 'Completed'),
('PO_198', 'SUP_008', '2024-12-18', 'Completed'),
('PO_199', 'SUP_009', '2024-12-19', 'Completed'),
('PO_200', 'SUP_010', '2024-12-20', 'Completed'),
('PO_201', 'SUP_001', '2024-12-21', 'Completed'),
('PO_202', 'SUP_002', '2024-12-22', 'Completed'),
('PO_203', 'SUP_003', '2024-12-23', 'Completed'),
('PO_204', 'SUP_004', '2024-12-24', 'Completed'),
('PO_205', 'SUP_005', '2024-12-25', 'Completed'),
('PO_206', 'SUP_006', '2024-12-26', 'Completed'),
('PO_207', 'SUP_007', '2024-12-27', 'Completed'),
('PO_208', 'SUP_008', '2024-12-28', 'Completed'),
('PO_209', 'SUP_009', '2024-12-29', 'Completed'),
('PO_210', 'SUP_010', '2024-12-30', 'Completed'),
('PO_211', 'SUP_001', '2024-12-31', 'Completed'),
('PO_212', 'SUP_002', '2024-12-01', 'Completed'),
('PO_213', 'SUP_003', '2024-12-02', 'Completed'),
('PO_214', 'SUP_004', '2024-12-03', 'Completed'),
('PO_215', 'SUP_005', '2024-12-04', 'Completed'),
('PO_216', 'SUP_006', '2024-12-05', 'Completed'),
('PO_217', 'SUP_007', '2024-12-06', 'Completed'),
('PO_218', 'SUP_008', '2024-12-07', 'Completed'),
('PO_219', 'SUP_009', '2024-12-08', 'Completed'),
('PO_220', 'SUP_010', '2024-12-09', 'Completed'),
('PO_221', 'SUP_001', '2024-12-10', 'Completed'),
('PO_222', 'SUP_002', '2024-12-11', 'Completed'),
('PO_223', 'SUP_003', '2024-12-12', 'Completed'),
('PO_224', 'SUP_004', '2024-12-13', 'Completed'),
('PO_225', 'SUP_005', '2024-12-14', 'Completed'),
('PO_226', 'SUP_006', '2024-12-15', 'Completed'),
('PO_227', 'SUP_007', '2024-12-16', 'Completed'),
('PO_228', 'SUP_008', '2024-12-17', 'Completed'),
('PO_229', 'SUP_009', '2024-12-18', 'Completed'),
('PO_230', 'SUP_010', '2024-12-19', 'Completed'),
('PO_231', 'SUP_001', '2024-12-20', 'Completed'),
('PO_232', 'SUP_002', '2024-12-21', 'Completed'),
('PO_233', 'SUP_003', '2024-12-22', 'Completed'),
('PO_234', 'SUP_004', '2024-12-23', 'Completed'),
('PO_235', 'SUP_005', '2024-12-24', 'Completed'),
('PO_236', 'SUP_006', '2024-12-25', 'Completed'),
('PO_237', 'SUP_007', '2024-12-26', 'Completed'),
('PO_238', 'SUP_008', '2024-12-27', 'Completed'),
('PO_239', 'SUP_009', '2024-12-28', 'Completed'),
('PO_240', 'SUP_010', '2024-12-29', 'Completed'),
('PO_241', 'SUP_001', '2024-12-30', 'Completed'),
('PO_242', 'SUP_002', '2024-12-31', 'Completed'),
('PO_243', 'SUP_003', '2024-12-01', 'Completed'),
('PO_244', 'SUP_004', '2024-12-02', 'Completed'),
('PO_245', 'SUP_005', '2024-12-03', 'Completed'),
('PO_246', 'SUP_006', '2024-12-04', 'Completed'),
('PO_247', 'SUP_007', '2024-12-05', 'Completed'),
('PO_248', 'SUP_008', '2024-12-06', 'Completed'),
('PO_249', 'SUP_009', '2024-12-07', 'Completed'),
('PO_250', 'SUP_010', '2024-12-08', 'Completed'),
('PO_251', 'SUP_001', '2024-12-09', 'Completed'),
('PO_252', 'SUP_002', '2024-12-10', 'Completed'),
('PO_253', 'SUP_003', '2024-12-11', 'Completed'),
('PO_254', 'SUP_004', '2024-12-12', 'Completed'),
('PO_255', 'SUP_005', '2024-12-13', 'Completed'),
('PO_256', 'SUP_006', '2024-12-14', 'Completed'),
('PO_257', 'SUP_007', '2024-12-15', 'Completed'),
('PO_258', 'SUP_008', '2024-12-16', 'Completed'),
('PO_259', 'SUP_009', '2024-12-17', 'Completed'),
('PO_260', 'SUP_010', '2024-12-18', 'Completed'),
('PO_261', 'SUP_001', '2024-12-19', 'Completed'),
('PO_262', 'SUP_002', '2024-12-20', 'Completed'),
('PO_263', 'SUP_003', '2024-12-21', 'Completed'),
('PO_264', 'SUP_004', '2024-12-22', 'Completed'),
('PO_265', 'SUP_005', '2024-12-23', 'Completed'),
('PO_266', 'SUP_006', '2024-12-24', 'Completed'),
('PO_267', 'SUP_007', '2024-12-25', 'Completed'),
('PO_268', 'SUP_008', '2024-12-26', 'Completed'),
('PO_269', 'SUP_009', '2024-12-27', 'Completed'),
('PO_270', 'SUP_010', '2024-12-28', 'Completed');






CREATE OR REPLACE TABLE  RETAILDB_DEV.RAW_Procurement.PurchaseOrderDetails (
OrderDetailID VARCHAR(255) PRIMARY KEY
,PurchaseOrderID VARCHAR(255) 
,ProductID VARCHAR(255) 
,QuantityOrdered INT NOT NULL
,UnitCost DECIMAL(10,2) NOT NULL
,TotalCost DECIMAL(10,2) NOT NULL
--,FOREIGN KEY (PurchaseOrderID) REFERENCES PurchaseOrders(PurchaseOrderID)
--,FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

INSERT INTO  RETAILDB_DEV.RAW_Procurement.PurchaseOrderDetails (OrderDetailID, PurchaseOrderID, ProductID, QuantityOrdered, UnitCost, TotalCost) VALUES
-- October 2024 (i = 1 to 90)
('POD_001', 'PO_001', 'PROD_001', 21, 16.00, 336.00),
('POD_002', 'PO_002', 'PROD_002', 22, 17.00, 374.00),
('POD_003', 'PO_003', 'PROD_003', 23, 18.00, 414.00),
('POD_004', 'PO_004', 'PROD_004', 24, 19.00, 456.00),
('POD_005', 'PO_005', 'PROD_005', 25, 20.00, 500.00),
('POD_006', 'PO_006', 'PROD_006', 26, 21.00, 546.00),
('POD_007', 'PO_007', 'PROD_007', 27, 22.00, 594.00),
('POD_008', 'PO_008', 'PROD_008', 28, 23.00, 644.00),
('POD_009', 'PO_009', 'PROD_009', 29, 24.00, 696.00),
('POD_010', 'PO_010', 'PROD_010', 30, 25.00, 750.00),
('POD_011', 'PO_011', 'PROD_011', 31, 26.00, 806.00),
('POD_012', 'PO_012', 'PROD_012', 32, 27.00, 864.00),
('POD_013', 'PO_013', 'PROD_013', 33, 28.00, 924.00),
('POD_014', 'PO_014', 'PROD_014', 34, 29.00, 986.00),
('POD_015', 'PO_015', 'PROD_015', 35, 30.00, 1050.00),
('POD_016', 'PO_016', 'PROD_016', 36, 31.00, 1116.00),
('POD_017', 'PO_017', 'PROD_017', 37, 32.00, 1184.00),
('POD_018', 'PO_018', 'PROD_018', 38, 33.00, 1254.00),
('POD_019', 'PO_019', 'PROD_019', 39, 34.00, 1326.00),
('POD_020', 'PO_020', 'PROD_020', 40, 35.00, 1400.00),
('POD_021', 'PO_021', 'PROD_021', 41, 36.00, 1476.00),
('POD_022', 'PO_022', 'PROD_022', 42, 37.00, 1554.00),
('POD_023', 'PO_023', 'PROD_023', 43, 38.00, 1634.00),
('POD_024', 'PO_024', 'PROD_024', 44, 39.00, 1716.00),
('POD_025', 'PO_025', 'PROD_025', 45, 40.00, 1800.00),
('POD_026', 'PO_026', 'PROD_026', 46, 41.00, 1886.00),
('POD_027', 'PO_027', 'PROD_027', 47, 42.00, 1974.00),
('POD_028', 'PO_028', 'PROD_028', 48, 43.00, 2064.00),
('POD_029', 'PO_029', 'PROD_029', 49, 44.00, 2156.00),
('POD_030', 'PO_030', 'PROD_030', 50, 45.00, 2250.00),
('POD_031', 'PO_031', 'PROD_031', 51, 16.00, 816.00),
('POD_032', 'PO_032', 'PROD_032', 52, 17.00, 884.00),
('POD_033', 'PO_033', 'PROD_033', 53, 18.00, 954.00),
('POD_034', 'PO_034', 'PROD_034', 54, 19.00, 1026.00),
('POD_035', 'PO_035', 'PROD_035', 55, 20.00, 1100.00),
('POD_036', 'PO_036', 'PROD_036', 56, 21.00, 1176.00),
('POD_037', 'PO_037', 'PROD_037', 57, 22.00, 1254.00),
('POD_038', 'PO_038', 'PROD_038', 58, 23.00, 1334.00),
('POD_039', 'PO_039', 'PROD_039', 59, 24.00, 1416.00),
('POD_040', 'PO_040', 'PROD_040', 60, 25.00, 1500.00),
('POD_041', 'PO_041', 'PROD_041', 61, 26.00, 1586.00),
('POD_042', 'PO_042', 'PROD_042', 62, 27.00, 1674.00),
('POD_043', 'PO_043', 'PROD_043', 63, 28.00, 1764.00),
('POD_044', 'PO_044', 'PROD_044', 64, 29.00, 1856.00),
('POD_045', 'PO_045', 'PROD_045', 65, 30.00, 1950.00),
('POD_046', 'PO_046', 'PROD_046', 66, 31.00, 2046.00),
('POD_047', 'PO_047', 'PROD_047', 67, 32.00, 2144.00),
('POD_048', 'PO_048', 'PROD_048', 68, 33.00, 2244.00),
('POD_049', 'PO_049', 'PROD_049', 69, 34.00, 2346.00),
('POD_050', 'PO_050', 'PROD_050', 20, 35.00, 700.00),
('POD_051', 'PO_051', 'PROD_051', 21, 36.00, 756.00),
('POD_052', 'PO_052', 'PROD_052', 22, 37.00, 814.00),
('POD_053', 'PO_053', 'PROD_053', 23, 38.00, 874.00),
('POD_054', 'PO_054', 'PROD_054', 24, 39.00, 936.00),
('POD_055', 'PO_055', 'PROD_055', 25, 40.00, 1000.00),
('POD_056', 'PO_056', 'PROD_056', 26, 41.00, 1066.00),
('POD_057', 'PO_057', 'PROD_057', 27, 42.00, 1134.00),
('POD_058', 'PO_058', 'PROD_058', 28, 43.00, 1204.00),
('POD_059', 'PO_059', 'PROD_059', 29, 44.00, 1276.00),
('POD_060', 'PO_060', 'PROD_060', 30, 45.00, 1350.00),
('POD_061', 'PO_061', 'PROD_061', 31, 16.00, 496.00),
('POD_062', 'PO_062', 'PROD_062', 32, 17.00, 544.00),
('POD_063', 'PO_063', 'PROD_063', 33, 18.00, 594.00),
('POD_064', 'PO_064', 'PROD_064', 34, 19.00, 646.00),
('POD_065', 'PO_065', 'PROD_065', 35, 20.00, 700.00),
('POD_066', 'PO_066', 'PROD_066', 36, 21.00, 756.00),
('POD_067', 'PO_067', 'PROD_067', 37, 22.00, 814.00),
('POD_068', 'PO_068', 'PROD_068', 38, 23.00, 874.00),
('POD_069', 'PO_069', 'PROD_069', 39, 24.00, 936.00),
('POD_070', 'PO_070', 'PROD_070', 40, 25.00, 1000.00),
('POD_071', 'PO_071', 'PROD_071', 41, 26.00, 1066.00),
('POD_072', 'PO_072', 'PROD_072', 42, 27.00, 1134.00),
('POD_073', 'PO_073', 'PROD_073', 43, 28.00, 1204.00),
('POD_074', 'PO_074', 'PROD_074', 44, 29.00, 1276.00),
('POD_075', 'PO_075', 'PROD_075', 45, 30.00, 1350.00),
('POD_076', 'PO_076', 'PROD_076', 46, 31.00, 1426.00),
('POD_077', 'PO_077', 'PROD_077', 47, 32.00, 1504.00),
('POD_078', 'PO_078', 'PROD_078', 48, 33.00, 1584.00),
('POD_079', 'PO_079', 'PROD_079', 49, 34.00, 1666.00),
('POD_080', 'PO_080', 'PROD_080', 50, 35.00, 1750.00),
('POD_081', 'PO_081', 'PROD_081', 51, 36.00, 1836.00),
('POD_082', 'PO_082', 'PROD_082', 52, 37.00, 1924.00),
('POD_083', 'PO_083', 'PROD_083', 53, 38.00, 2014.00),
('POD_084', 'PO_084', 'PROD_084', 54, 39.00, 2106.00),
('POD_085', 'PO_085', 'PROD_085', 55, 40.00, 2200.00),
('POD_086', 'PO_086', 'PROD_086', 56, 41.00, 2296.00),
('POD_087', 'PO_087', 'PROD_087', 57, 42.00, 2394.00),
('POD_088', 'PO_088', 'PROD_088', 58, 43.00, 2494.00),
('POD_089', 'PO_089', 'PROD_089', 59, 44.00, 2596.00),
('POD_090', 'PO_090', 'PROD_090', 60, 15.00, 900.00);



CREATE OR REPLACE TABLE  RETAILDB_DEV.RAW_Procurement.PurchaseOrderDetails_Nov2024 (
OrderDetailID VARCHAR(255) PRIMARY KEY
,PurchaseOrderID VARCHAR(255) 
,ProductID VARCHAR(255) 
,QuantityOrdered INT NOT NULL
,UnitCost DECIMAL(10,2) NOT NULL
,TotalCost DECIMAL(10,2) NOT NULL
--,FOREIGN KEY (PurchaseOrderID) REFERENCES PurchaseOrders(PurchaseOrderID)
--,FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

INSERT INTO RETAILDB_DEV.RAW_Procurement.PurchaseOrderDetails_Nov2024 (OrderDetailID, PurchaseOrderID, ProductID, QuantityOrdered, UnitCost, TotalCost) VALUES
-- November 2024 (j = 1 to 90)
('POD_091', 'PO_091', 'PROD_001', 21, 16.00, 336.00),
('POD_092', 'PO_092', 'PROD_002', 22, 17.00, 374.00),
('POD_093', 'PO_093', 'PROD_003', 23, 18.00, 414.00),
('POD_094', 'PO_094', 'PROD_004', 24, 19.00, 456.00),
('POD_095', 'PO_095', 'PROD_005', 25, 20.00, 500.00),
('POD_096', 'PO_096', 'PROD_006', 26, 21.00, 546.00),
('POD_097', 'PO_097', 'PROD_007', 27, 22.00, 594.00),
('POD_098', 'PO_098', 'PROD_008', 28, 23.00, 644.00),
('POD_099', 'PO_099', 'PROD_009', 29, 24.00, 696.00),
('POD_100', 'PO_100', 'PROD_010', 30, 25.00, 750.00),
('POD_101', 'PO_101', 'PROD_011', 31, 26.00, 806.00),
('POD_102', 'PO_102', 'PROD_012', 32, 27.00, 864.00),
('POD_103', 'PO_103', 'PROD_013', 33, 28.00, 924.00),
('POD_104', 'PO_104', 'PROD_014', 34, 29.00, 986.00),
('POD_105', 'PO_105', 'PROD_015', 35, 30.00, 1050.00),
('POD_106', 'PO_106', 'PROD_016', 36, 31.00, 1116.00),
('POD_107', 'PO_107', 'PROD_017', 37, 32.00, 1184.00),
('POD_108', 'PO_108', 'PROD_018', 38, 33.00, 1254.00),
('POD_109', 'PO_109', 'PROD_019', 39, 34.00, 1326.00),
('POD_110', 'PO_110', 'PROD_020', 40, 35.00, 1400.00),
('POD_111', 'PO_111', 'PROD_021', 41, 36.00, 1476.00),
('POD_112', 'PO_112', 'PROD_022', 42, 37.00, 1554.00),
('POD_113', 'PO_113', 'PROD_023', 43, 38.00, 1634.00),
('POD_114', 'PO_114', 'PROD_024', 44, 39.00, 1716.00),
('POD_115', 'PO_115', 'PROD_025', 45, 40.00, 1800.00),
('POD_116', 'PO_116', 'PROD_026', 46, 41.00, 1886.00),
('POD_117', 'PO_117', 'PROD_027', 47, 42.00, 1974.00),
('POD_118', 'PO_118', 'PROD_028', 48, 43.00, 2064.00),
('POD_119', 'PO_119', 'PROD_029', 49, 44.00, 2156.00),
('POD_120', 'PO_120', 'PROD_030', 50, 45.00, 2250.00),
('POD_121', 'PO_121', 'PROD_031', 51, 16.00, 816.00),
('POD_122', 'PO_122', 'PROD_032', 52, 17.00, 884.00),
('POD_123', 'PO_123', 'PROD_033', 53, 18.00, 954.00),
('POD_124', 'PO_124', 'PROD_034', 54, 19.00, 1026.00),
('POD_125', 'PO_125', 'PROD_035', 55, 20.00, 1100.00),
('POD_126', 'PO_126', 'PROD_036', 56, 21.00, 1176.00),
('POD_127', 'PO_127', 'PROD_037', 57, 22.00, 1254.00),
('POD_128', 'PO_128', 'PROD_038', 58, 23.00, 1334.00),
('POD_129', 'PO_129', 'PROD_039', 59, 24.00, 1416.00),
('POD_130', 'PO_130', 'PROD_040', 60, 25.00, 1500.00),
('POD_131', 'PO_131', 'PROD_041', 61, 26.00, 1586.00),
('POD_132', 'PO_132', 'PROD_042', 62, 27.00, 1674.00),
('POD_133', 'PO_133', 'PROD_043', 63, 28.00, 1764.00),
('POD_134', 'PO_134', 'PROD_044', 64, 29.00, 1856.00),
('POD_135', 'PO_135', 'PROD_045', 65, 30.00, 1950.00),
('POD_136', 'PO_136', 'PROD_046', 66, 31.00, 2046.00),
('POD_137', 'PO_137', 'PROD_047', 67, 32.00, 2144.00),
('POD_138', 'PO_138', 'PROD_048', 68, 33.00, 2244.00),
('POD_139', 'PO_139', 'PROD_049', 69, 34.00, 2346.00),
('POD_140', 'PO_140', 'PROD_050', 20, 35.00, 700.00),
('POD_141', 'PO_141', 'PROD_051', 21, 36.00, 756.00),
('POD_142', 'PO_142', 'PROD_052', 22, 37.00, 814.00),
('POD_143', 'PO_143', 'PROD_053', 23, 38.00, 874.00),
('POD_144', 'PO_144', 'PROD_054', 24, 39.00, 936.00),
('POD_145', 'PO_145', 'PROD_055', 25, 40.00, 1000.00),
('POD_146', 'PO_146', 'PROD_056', 26, 41.00, 1066.00),
('POD_147', 'PO_147', 'PROD_057', 27, 42.00, 1134.00),
('POD_148', 'PO_148', 'PROD_058', 28, 43.00, 1204.00),
('POD_149', 'PO_149', 'PROD_059', 29, 44.00, 1276.00),
('POD_150', 'PO_150', 'PROD_060', 30, 45.00, 1350.00),
('POD_151', 'PO_151', 'PROD_061', 31, 16.00, 496.00),
('POD_152', 'PO_152', 'PROD_062', 32, 17.00, 544.00),
('POD_153', 'PO_153', 'PROD_063', 33, 18.00, 594.00),
('POD_154', 'PO_154', 'PROD_064', 34, 19.00, 646.00),
('POD_155', 'PO_155', 'PROD_065', 35, 20.00, 700.00),
('POD_156', 'PO_156', 'PROD_066', 36, 21.00, 756.00),
('POD_157', 'PO_157', 'PROD_067', 37, 22.00, 814.00),
('POD_158', 'PO_158', 'PROD_068', 38, 23.00, 874.00),
('POD_159', 'PO_159', 'PROD_069', 39, 24.00, 936.00),
('POD_160', 'PO_160', 'PROD_070', 40, 25.00, 1000.00),
('POD_161', 'PO_161', 'PROD_071', 41, 26.00, 1066.00),
('POD_162', 'PO_162', 'PROD_072', 42, 27.00, 1134.00),
('POD_163', 'PO_163', 'PROD_073', 43, 28.00, 1204.00),
('POD_164', 'PO_164', 'PROD_074', 44, 29.00, 1276.00),
('POD_165', 'PO_165', 'PROD_075', 45, 30.00, 1350.00),
('POD_166', 'PO_166', 'PROD_076', 46, 31.00, 1426.00),
('POD_167', 'PO_167', 'PROD_077', 47, 32.00, 1504.00),
('POD_168', 'PO_168', 'PROD_078', 48, 33.00, 1584.00),
('POD_169', 'PO_169', 'PROD_079', 49, 34.00, 1666.00),
('POD_170', 'PO_170', 'PROD_080', 50, 35.00, 1750.00),
('POD_171', 'PO_171', 'PROD_081', 51, 36.00, 1836.00),
('POD_172', 'PO_172', 'PROD_082', 52, 37.00, 1924.00),
('POD_173', 'PO_173', 'PROD_083', 53, 38.00, 2014.00),
('POD_174', 'PO_174', 'PROD_084', 54, 39.00, 2106.00),
('POD_175', 'PO_175', 'PROD_085', 55, 40.00, 2200.00),
('POD_176', 'PO_176', 'PROD_086', 56, 41.00, 2296.00),
('POD_177', 'PO_177', 'PROD_087', 57, 42.00, 2394.00),
('POD_178', 'PO_178', 'PROD_088', 58, 43.00, 2494.00),
('POD_179', 'PO_179', 'PROD_089', 59, 44.00, 2596.00),
('POD_180', 'PO_180', 'PROD_090', 60, 15.00, 900.00);



CREATE OR REPLACE TABLE  RETAILDB_DEV.RAW_Procurement.PurchaseOrderDetails_Dec2024 (
OrderDetailID VARCHAR(255) PRIMARY KEY
,PurchaseOrderID VARCHAR(255) 
,ProductID VARCHAR(255) 
,QuantityOrdered INT NOT NULL
,UnitCost DECIMAL(10,2) NOT NULL
,TotalCost DECIMAL(10,2) NOT NULL
--,FOREIGN KEY (PurchaseOrderID) REFERENCES PurchaseOrders(PurchaseOrderID)
--,FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);



INSERT INTO RETAILDB_DEV.RAW_Procurement.PurchaseOrderDetails_Dec2024 (OrderDetailID, PurchaseOrderID, ProductID, QuantityOrdered, UnitCost, TotalCost) VALUES
-- December 2024 (k = 1 to 90)
('POD_181', 'PO_181', 'PROD_001', 21, 16.00, 336.00),
('POD_182', 'PO_182', 'PROD_002', 22, 17.00, 374.00),
('POD_183', 'PO_183', 'PROD_003', 23, 18.00, 414.00),
('POD_184', 'PO_184', 'PROD_004', 24, 19.00, 456.00),
('POD_185', 'PO_185', 'PROD_005', 25, 20.00, 500.00),
('POD_186', 'PO_186', 'PROD_006', 26, 21.00, 546.00),
('POD_187', 'PO_187', 'PROD_007', 27, 22.00, 594.00),
('POD_188', 'PO_188', 'PROD_008', 28, 23.00, 644.00),
('POD_189', 'PO_189', 'PROD_009', 29, 24.00, 696.00),
('POD_190', 'PO_190', 'PROD_010', 30, 25.00, 750.00),
('POD_191', 'PO_191', 'PROD_011', 31, 26.00, 806.00),
('POD_192', 'PO_192', 'PROD_012', 32, 27.00, 864.00),
('POD_193', 'PO_193', 'PROD_013', 33, 28.00, 924.00),
('POD_194', 'PO_194', 'PROD_014', 34, 29.00, 986.00),
('POD_195', 'PO_195', 'PROD_015', 35, 30.00, 1050.00),
('POD_196', 'PO_196', 'PROD_016', 36, 31.00, 1116.00),
('POD_197', 'PO_197', 'PROD_017', 37, 32.00, 1184.00),
('POD_198', 'PO_198', 'PROD_018', 38, 33.00, 1254.00),
('POD_199', 'PO_199', 'PROD_019', 39, 34.00, 1326.00),
('POD_200', 'PO_200', 'PROD_020', 40, 35.00, 1400.00),
('POD_201', 'PO_201', 'PROD_021', 41, 36.00, 1476.00),
('POD_202', 'PO_202', 'PROD_022', 42, 37.00, 1554.00),
('POD_203', 'PO_203', 'PROD_023', 43, 38.00, 1634.00),
('POD_204', 'PO_204', 'PROD_024', 44, 39.00, 1716.00),
('POD_205', 'PO_205', 'PROD_025', 45, 40.00, 1800.00),
('POD_206', 'PO_206', 'PROD_026', 46, 41.00, 1886.00),
('POD_207', 'PO_207', 'PROD_027', 47, 42.00, 1974.00),
('POD_208', 'PO_208', 'PROD_028', 48, 43.00, 2064.00),
('POD_209', 'PO_209', 'PROD_029', 49, 44.00, 2156.00),
('POD_210', 'PO_210', 'PROD_030', 50, 45.00, 2250.00),
('POD_211', 'PO_211', 'PROD_031', 51, 16.00, 816.00),
('POD_212', 'PO_212', 'PROD_032', 52, 17.00, 884.00),
('POD_213', 'PO_213', 'PROD_033', 53, 18.00, 954.00),
('POD_214', 'PO_214', 'PROD_034', 54, 19.00, 1026.00),
('POD_215', 'PO_215', 'PROD_035', 55, 20.00, 1100.00),
('POD_216', 'PO_216', 'PROD_036', 56, 21.00, 1176.00),
('POD_217', 'PO_217', 'PROD_037', 57, 22.00, 1254.00),
('POD_218', 'PO_218', 'PROD_038', 58, 23.00, 1334.00),
('POD_219', 'PO_219', 'PROD_039', 59, 24.00, 1416.00),
('POD_220', 'PO_220', 'PROD_040', 60, 25.00, 1500.00),
('POD_221', 'PO_221', 'PROD_041', 61, 26.00, 1586.00),
('POD_222', 'PO_222', 'PROD_042', 62, 27.00, 1674.00),
('POD_223', 'PO_223', 'PROD_043', 63, 28.00, 1764.00),
('POD_224', 'PO_224', 'PROD_044', 64, 29.00, 1856.00),
('POD_225', 'PO_225', 'PROD_045', 65, 30.00, 1950.00),
('POD_226', 'PO_226', 'PROD_046', 66, 31.00, 2046.00),
('POD_227', 'PO_227', 'PROD_047', 67, 32.00, 2144.00),
('POD_228', 'PO_228', 'PROD_048', 68, 33.00, 2244.00),
('POD_229', 'PO_229', 'PROD_049', 69, 34.00, 2346.00),
('POD_230', 'PO_230', 'PROD_050', 20, 35.00, 700.00),
('POD_231', 'PO_231', 'PROD_051', 21, 36.00, 756.00),
('POD_232', 'PO_232', 'PROD_052', 22, 37.00, 814.00),
('POD_233', 'PO_233', 'PROD_053', 23, 38.00, 874.00),
('POD_234', 'PO_234', 'PROD_054', 24, 39.00, 936.00),
('POD_235', 'PO_235', 'PROD_055', 25, 40.00, 1000.00),
('POD_236', 'PO_236', 'PROD_056', 26, 41.00, 1066.00),
('POD_237', 'PO_237', 'PROD_057', 27, 42.00, 1134.00),
('POD_238', 'PO_238', 'PROD_058', 28, 43.00, 1204.00),
('POD_239', 'PO_239', 'PROD_059', 29, 44.00, 1276.00),
('POD_240', 'PO_240', 'PROD_060', 30, 45.00, 1350.00),
('POD_241', 'PO_241', 'PROD_061', 31, 16.00, 496.00),
('POD_242', 'PO_242', 'PROD_062', 32, 17.00, 544.00),
('POD_243', 'PO_243', 'PROD_063', 33, 18.00, 594.00),
('POD_244', 'PO_244', 'PROD_064', 34, 19.00, 646.00),
('POD_245', 'PO_245', 'PROD_065', 35, 20.00, 700.00),
('POD_246', 'PO_246', 'PROD_066', 36, 21.00, 756.00),
('POD_247', 'PO_247', 'PROD_067', 37, 22.00, 814.00),
('POD_248', 'PO_248', 'PROD_068', 38, 23.00, 874.00),
('POD_249', 'PO_249', 'PROD_069', 39, 24.00, 936.00),
('POD_250', 'PO_250', 'PROD_070', 40, 25.00, 1000.00),
('POD_251', 'PO_251', 'PROD_071', 41, 26.00, 1066.00),
('POD_252', 'PO_252', 'PROD_072', 42, 27.00, 1134.00),
('POD_253', 'PO_253', 'PROD_073', 43, 28.00, 1204.00),
('POD_254', 'PO_254', 'PROD_074', 44, 29.00, 1276.00),
('POD_255', 'PO_255', 'PROD_075', 45, 30.00, 1350.00),
('POD_256', 'PO_256', 'PROD_076', 46, 31.00, 1426.00),
('POD_257', 'PO_257', 'PROD_077', 47, 32.00, 1504.00),
('POD_258', 'PO_258', 'PROD_078', 48, 33.00, 1584.00),
('POD_259', 'PO_259', 'PROD_079', 49, 34.00, 1666.00),
('POD_260', 'PO_260', 'PROD_080', 50, 35.00, 1750.00),
('POD_261', 'PO_261', 'PROD_081', 51, 36.00, 1836.00),
('POD_262', 'PO_262', 'PROD_082', 52, 37.00, 1924.00),
('POD_263', 'PO_263', 'PROD_083', 53, 38.00, 2014.00),
('POD_264', 'PO_264', 'PROD_084', 54, 39.00, 2106.00),
('POD_265', 'PO_265', 'PROD_085', 55, 40.00, 2200.00),
('POD_266', 'PO_266', 'PROD_086', 56, 41.00, 2296.00),
('POD_267', 'PO_267', 'PROD_087', 57, 42.00, 2394.00),
('POD_268', 'PO_268', 'PROD_088', 58, 43.00, 2494.00),
('POD_269', 'PO_269', 'PROD_089', 59, 44.00, 2596.00),
('POD_270', 'PO_270', 'PROD_090', 60, 15.00, 900.00);

