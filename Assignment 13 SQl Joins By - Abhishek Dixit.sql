use company_db;
-- Table 1
Create Table Customers(
CustomerID INT PRIMARY KEY,
CustomerName varchar(30),
City varchar(30)
);

Insert into Customers Values(1,'John Smith','New York');
Insert into Customers Values(2,'Mary Johnson','Chicago');
Insert into Customers Values(3,'Peter Adams','Los Angeles');
Insert into Customers Values(4,'Nancy Miler','Houston');
Insert into Customers Values(5,'Robert White','Miami');

select * from Customers;
-- Table 2
Create Table Orders(
OrdersID int PRIMARY KEY,
CustomerID INT ,
OrderDate date,
Amount Int
);

insert into Orders values(101,1,'2024-10-01',250);
insert into Orders values(102,2,'2024-10-05',300);
insert into Orders values(103,1,'2024-10-07',150);
insert into Orders values(104,3,'2024-10-10',450);
insert into Orders values(105,6,'2024-10-12',400);

select * from Orders ;

-- Table 3
Create Table Payments(
PaymentID varchar(30) PRIMARY KEY ,
CustomerID INT,
PaymentDate date,
Amount Int
);

insert into Payments values('P001',1,'2024-10-02',250);
insert into Payments values('P002',2,'2024-10-06',300);
insert into Payments values('P003',3,'2024-10-11',450);
insert into Payments values('P004',4,'2024-10-15',200);
select * from Payments;

-- Table 4
CREATE Table Employee(
EmployeeID int PRIMARY KEY ,
EmployeeName Varchar(30),
ManagerID int);

Insert Into Employee(EmployeeID,EmployeeName) values(1,'Alex Green');
Insert Into Employee(EmployeeID,EmployeeName,ManagerID) values(2,'Brain Lee',1);
Insert Into Employee(EmployeeID,EmployeeName,ManagerID) values(3,'Carol Ray',1);
Insert Into Employee(EmployeeID,EmployeeName,ManagerID) values(4,'David Kim',2);
Insert Into Employee(EmployeeID,EmployeeName,ManagerID) values(5,'Eva Smith',2);

select * from Employee;
-- Solution 
-- Question 1: Retrieve all customers who have placed at least one order
-- Using INNER JOIN
SELECT DISTINCT c.CustomerID, c.CustomerName, c.City
FROM Customers c
INNER JOIN Orders o 
ON c.CustomerID = o.CustomerID;

-- Question 2: Retrieve all customers and their orders, including customers who have not placed any orders
-- Using LEFT JOIN
SELECT c.CustomerID, c.CustomerName, c.City, o.OrdersID, o.OrderDate, o.Amount
FROM Customers c
LEFT JOIN Orders o
ON c.CustomerID = o.CustomerID;

-- Question 3: Retrieve all orders and their corresponding customers, including orders placed by unknown customers
-- Using RIGHT JOIN 
SELECT c.CustomerID, c.CustomerName, c.City,
 o.OrdersID, o.OrderDate, o.Amount
FROM Customers c
RIGHT JOIN Orders o 
ON c.CustomerID = o.CustomerID;

-- Question 4: Display all customers and orders, whether matched or not
-- Using FULL OUTER JOIN (MySQL doesn't support FULL OUTER JOIN directly, so use UNION)
SELECT c.CustomerID, c.CustomerName, c.City,
o.OrdersID, o.OrderDate, o.Amount
FROM Customers c
LEFT JOIN Orders o
ON c.CustomerID = o.CustomerID
UNION
SELECT c.CustomerID, c.CustomerName, c.City,
o.OrdersID, o.OrderDate, o.Amount
FROM Customers c
RIGHT JOIN Orders o
ON c.CustomerID = o.CustomerID;


-- Question 5: Find customers who have not placed any orders
-- Using LEFT JOIN with NULL check
SELECT c.CustomerID, c.CustomerName, c.City
FROM Customers c
LEFT JOIN Orders o
ON c.CustomerID = o.CustomerID
WHERE o.OrdersID IS NULL;


-- Question 6: Retrieve customers who made payments but did not place any orders
SELECT c.CustomerID, c.CustomerName, c.City
FROM Customers c
INNER JOIN Payments p
ON c.CustomerID = p.CustomerID
LEFT JOIN Orders o
ON c.CustomerID = o.CustomerID
WHERE o.OrdersID IS NULL;

-- Question 7: Generate a list of all possible combinations between Customers and Orders
-- Using CROSS JOIN
SELECT c.CustomerID, c.CustomerName, c.City,
o.OrdersID, o.OrderDate, o.Amount
FROM Customers c
CROSS JOIN Orders o;


-- Question 8: Show all customers along with order and payment amounts in one table
SELECT 
    c.CustomerID, 
    c.CustomerName, 
    c.City,
    o.OrdersID,
    o.OrderDate,
    o.Amount AS Order_Amount,
    p.PaymentID,
    p.PaymentDate,
    p.Amount AS Payment_Amount
FROM Customers c
LEFT JOIN Orders o 
ON c.CustomerID = o.CustomerID
LEFT JOIN Payments p 
ON c.CustomerID = p.CustomerID;


-- Question 9: Retrieve all customers who have both placed orders and made payments
-- Using INNER JOIN on both tables
SELECT DISTINCT c.CustomerID, c.CustomerName, c.City
FROM Customers c
INNER JOIN Orders o 
ON c.CustomerID = o.CustomerID
INNER JOIN Payments p 
ON c.CustomerID = p.CustomerID;