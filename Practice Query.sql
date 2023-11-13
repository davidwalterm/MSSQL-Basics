SELECT * FROM Customers;

SELECT CustomerName, City FROM Customers;

SELECT * FROM Customers;

SELECT DISTINCT Country FROM Customers;

SELECT * FROM Customers WHERE Country='Mexico';

SELECT * FROM Customers WHERE CustomerID=1;

SELECT * FROM Customers WHERE Country='Germany' AND City='Berlin';

SELECT * FROM Customers WHERE City='Berlin' OR City='Munchen';

SELECT * FROM Customers WHERE NOT Country='Germany';

SELECT * FROM Customers WHERE Country='Germany' AND (City='Berlin' OR City='Munchen');

SELECT * FROM Customers WHERE ORDER BY Country;

SELECT * FROM Customers ORDER BY Country DESC;

SELECT * FROM Customers ORDER BY Country, CustomerName;

SELECT CustomerName, ContactName, Address FROM Customers WHERE Address IS NULL;

SELECT CustomerName, ContactName, Address FROM Customers WHERE Address IS NOT NULL;

SELECT TOP 3 * FROM Customers;

SELECT * FROM Customers LIMIT 3;

SELECT TOP 50 PERCENT * FROM Customers;

SELECT TOP 3 * FROM Customers WHERE Country='Germany';

SELECT MIN(Price) FROM Products;

SELECT MAX(Price) FROM Products;

SELECT COUNT(*) FROM Products;

SELECT AVG(Price) FROM Products;

SELECT SUM(Quantity) FROM OrderDetails;

SELECT * FROM Customers WHERE CustomerName LIKE 'a%';

SELECT * FROM Customers WHERE CustomerName LIKE '%a';

SELECT * FROM Customers WHERE CustomerName LIKE '%or%';

SELECT * FROM Customers WHERE CustomerName LIKE '_r%';

SELECT * FROM Customers WHERE CustomerName LIKE 'a%o';

SELECT * FROM Customers WHERE CustomerName NOT LIKE 'a%';

SELECT * FROM Customers WHERE City LIKE 'ber%';

SELECT * FROM Customers WHERE City LIKE '_ondon';

SELECT * FROM Customers WHERE CustomerName LIKE '[bsp]%';

SELECT * FROM Customers WHERE City LIKE '[!bsp]%';

SELECT * FROM Customers WHERE Country IN ('Germany', 'France', 'UK');

SELECT * FROM Customers WHERE CustomerID NOT IN (SELECT CustomerID FROM Orders);

SELECT * FROM Products WHERE Price BETWEEN 10 AND 20;

SELECT * FROM Products WHERE Price NOT BETWEEN 10 AND 20;

SELECT * FROM Products WHERE Price BETWEEN 10 AND 20 AND CategoryID IN (1,2,3);

SELECT * FROM Products WHERE ProductName BETWEEN 'Carnarvon Tigers' AND 'Mozzarella di Giovanni' ORDER BY ProductName;

SELECT * FROM Products WHERE ProductName NOT BETWEEN 'Carnavorn Tigers' AND 'Mozzarella di Giovanni' ORDER BY ProductName;

SELECT CustomerID AS ID, CustomerName AS Customer FROM Customers;

SELECT CustomerName AS Customer, ContactName AS [Contact Person] FROM Customers;

SELECT o.OrderID, o.OrderDate, c.CustomerName FROM Customer AS c, Orders AS o WHERE c.CustomerName='Around the Horn' AND c.CustomerID =o.CustomerID

SELECT Orders.OrderID, Customers.CustomerName FROM Orders INNER JOIN Customer ON Orders.CustomerID = Customers.CustomerID;

SELECT Customers.CustomerName, Orders.OrderID FROM Customers LEFT JOIN Orders ON Customers.CustomerID=Orders.CustomerID ORDER BY Customers.CustomerName;

SELECT Orders.OrderID, Employees.LastName, Employees.FirstName FROM Orders RIGHT JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID ORDER BY Orders.OrderID;

SELECT A.CustomerName AS CustomerName1, B.CustomerName AS CustomerName2, A.City FROM Customers A, Customers B WHERE A.CustomerID <> B.CustomerID AND A.City = B.City ORDER BY A.City;

SELECT City FROM Customers UNION SELECT City FROM Suppliers ORDER BY City;

SELECT City FROM Customers UNION ALL SELECT City FROM Suppliers ORDER BY City;

SELECT City, Country FROM Customers WHERE Country='Germany' UNION SELECT City, Country FROM Suppliers WHERE Country='Germany' ORDER BY City;

SELECT City, Country FROM Customers WHERE Country='Germany' UNION ALL SELECT City, Country FROM Suppliers WHERE Country='Germany' ORDER BY City;

SELECT COUNT(CustomerID), Country FROM Customers GROUP BY Country;

SELECT COUNT(CustomerID), Country FROM Customers GROUP BY Country ORDER BY COUNT(CustomerID) DESC;

SELECT Shippers.ShipperName, COUNT(Orders.OrderID) AS NumberOfOrders FROM Orders LEFT JOIN Shippers ON Orders.ShipperID = Shippers.ShipperID GROUP BY ShipperName;

SELECT COUNT(CustomerID), Country FROM Customers GROUP BY Country HAVING COUNT(CustomerID) > 5;

SELECT COUNT(CustomerID), Country FROM Customers GROUP BY Country HAVING COUNT(CustomerID) > 5 ORDER BY COUNT(CustomerID) DESC;

SELECT SupplierName FROM Suppliers WHERE EXISTS (SELECT ProductName FROM Products WHERE Products.SuppliersID = Suppliers.suplierID AND Price < 20);

SELECT ProductName FROM Products WHERE ProductID = ANY (SELECT ProductID FROM OrderDetails WHERE Quantity = 10)

SELECT ALL ProductName FROM Products WHERE TRUE;

SELECT OrderID, Quantity, 
CASE 
WHEN Quantity > 30 THEN 'The quantity is greater than 30'
WHEN Quantity = 30 THEN 'The quantity is 30'
ELSE 'The quantity is under 30'
END AS QuantityText
FROM OrderDetails;

SELECT CustomerName, City, Country FROM Customers
ORDER BY (CASE WHEN City IS NULL THEN Country ELSE City END);

--SELECT ALL:
SELECT * FROM Customers;

SELECT * FROM Customers --WHERE City='Berlin';

/*Select all the columns 
of all the records 
in the Customers table:*/
SELECT * FROM Customers;

CREATE DATABASE databasename;

DROP DATABASE databasename;

BACKUP DATABASE databasename TO DISK = 'filepath';

CREATE TABLE table_name (
	column1 datatype,
	column2 datatype,
	columnt3 datatype,
	...
);

CREAT TABLE Persons (
	PersonID int,
	LastName varchar(255),
	FirstName varchar(255),
	Address varchar(255),
	City varchar(255)
);

CREATE TABLE TestTable AS
SELECT customername, contactname
FROM customers;

--delete table
DROP TABLE tablename;

DROP TABLE Shippers;

--empty table
TRUNCATE TABLE table_name;


--alter table
ALTER TABLE Customers
ADD Email varchar(255);

ALTER TABLE Customers
DROP COLUMN Email;

ALTER TABLE table_name
RENAME COLUMN old_name to new_name;

ALTER TABLE Persons
ALTER COLUMN DateOfBirth year;

ALTER TABLE Persons
DROP COLUMN DateOfBirth;

CREATE TABLE Persons (
	ID int NOT NULL,
	LastName varchar(255) NOT NULL,
	FirstName varchar(255) NOT NULL,
	Age int
);

ALTER TABLE Persons
ALTER COLUMNS Age int NOT NULL;

CREATE TABLE Persons(
	ID int NOT NULL UNIQUE,
	LastName varchar(255) NOT NULL,
	FirstName varchar(255),
	Age int
);

CREATE TABLE Persons(
	ID int NOT NULL,
	LastName varchar(255) NOT NULL,
	FirstName varchar(255),
	Age int,
	CONSTRAINT UC_Person UNIQUE (ID, LastName)
);

ALTER TABLE Persons
ADD UNIQUE (ID);

ALTER TABLE Persons
ADD CONSTRAINT UC_Person UNIQUE (ID, LastName);

ALTER TABLE Persons
DROP CONSTRAINT UC_Person;

CREATE TABLE Persons (
	ID int NOT NULL PRIMARY KEY,
	LastName varchar(255) NOT NULL,
	FirstName varchar(255),
	Age int
);

CREATE TABLE Persons (
	ID int NOT NULL,
	LastName varchar(255) NOT NULL,
	FirstName varchar(255),
	Age int,
	CONSTRAINT PK_Person PRIMARY KEY (ID, LastName)
);

ALTER TABLE Persons
ADD PRIMARY KEY (ID);

ALTER TABLE Persons
ADD CONSTRAINT PK_Person PRIMARY KEY (ID, LastName);

ALTER TABLE Persons
DROP CONSTRAINT PK_Person;

CREATE TABLE Orders (
	OrderID int NOT NULL PRIMARY KEY,
	OrderNumber int NOT NULL,
	PersonID int FOREIGN KEY REFERENCES Persons(PersonID)
);

CREATE TABLE Orders (
	OrderID int NOT NULL,
	OrderNumber int NOT NULL,
	PersonID int,
	PRIMARY KEY (OrderID),
	CONSTRAINT FK_PersonOrder FOREIGN KEY (PersonID)
	REFERENCES Persons(PersonID)
);

ALTER TABLE Orders
ADD FOREIGN KEY (PersonID) REFERENCES Persons(PersonID);

ALTER TABLE Orders
ADD CONSTRAINT FK_PersonOrder
FOREIGN KEY (PersonID) REFERENCES Persons(PersonID);

ALTER TABLE Orders
DROP CONSTRAINT FK_PersonOrder;

CREATE TABLE Persons(
	ID int NOT NULL,
	LastName varchar(255) NOT NULL,
	FirstName varchar(255),
	Age int CHECK (Age>=18)
);

CREATE TABLE Persons(
	ID int NOT NULL,
	LastName varchar(255) NOT NULL,
	FirstName varchar(255),
	Age int,
	City varchar(255),
	CONSTRAINT CHK_Person CHECK (Age>=18 AND City='Sandnes')
);

ALTER TABLE Persons
ADD CHECK (Age>=18);

ALTER TABLE Persons
ADD CONSTRAINT CHK_PersonAge CHECK (Age>=18 AND City ='Sandnes')

ALTER TABLE Persons
DROP CONSTRAINT CHK_PersonAge;

CREATE TABLE Persons(
	ID int NOT NULL,
	LastName varchar(255) NOT NULL,
	FirstName varchar(255),
	Age int,
	City varchar(255) DEFAULT 'Sandnes'
);

CREATE TABLE Orders(
	ID int NOT NULL,
	OrderNumber int NOT NULL,
	OrderName date DEFAULT GETDATE()
);

ALTER TABLE Persons
ADD CONSTRAINT df_City
DEFAULT 'Sandnes' FOR City;

ALTER TABLE Persons
ALTER COLUMN City DROP DEFAULT;

CREATE INDEX idx_lastname
ON Persons (LastName)

CREATE INDEX idx_pname
ON Persons (LastName, FirstName)

DROP INDEX Persons.idx_lastname

CREATE TABLE Persons (
	PersonID int IDENTITY(1,1) PRIMARY KEY,
	LastName varchar(255) NOT NULL,
	FirstName varchar(255),
	Age int
);

INSERT INTO Persons (FirstName, LastName)
VALUES ('Lars', 'Monsen');

SELECT * FROM Orders WHERE OrderDate='2008-11-11'

SELECT * FROM Orders WHERE OrderDate LIKE '2008-11-11%'

CREATE VIEW [Brazil Customers] AS 
SELECT CustomerName, ContactName
FROM Customers
WHERE Country = 'Brazil';

SELECT * FROM [Brazil Customers];

CREATE VIEW [Products Above Average Price] AS 
SELECT ProductName, Price
FROM Products,
WHERE Price > (SELECT AVG(Price) FROM Products);

SELECT * FROM [Products Above Average Price];

CREATE OR REPLACE VIEW [Brazil Customers] AS
SELECT CustomerName, ContactName, City
FROM Customers
WHERE Country = 'Brazil';

DROP VIEW [Brazil Customers];

CREATE PROCEDURE SelectAllCustomers
AS
SELECT * FROM Customers
GO;

EXEC SelectAllCustomers;

CREATE PROCEDURE SelectAllFromCustomers @City nvarchar(30)
AS
SELECT * FROM Customers WHERE City = @City
GO;

EXEC SelectAllCustomers @City = 'London';

CREATE PROCEDURE SelectAllCustomers @City nvarchar(30), @PostalCode nvarchar(10)
AS
SELECT * FROM Customers WHERE City = @City AND PostalCode = @PostalCode
GO;

EXEC SelectAllCustomers @City = 'London'; @PostalCode = 'WA1 1DP';
