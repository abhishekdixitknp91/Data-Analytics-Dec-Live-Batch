Use Company_db;
Create Table Employees (
EmpID INT Primary Key, EmpName VARCHAR(50),
Department VARCHAR(50), City varchar(20),
Salary INT, HireDate Date );

Select * from Employees;

insert into Employees values(101,'Rahul Mehta','Sales','Delhi',55000,'2020-04-12');
insert into Employees values(102,'Priya Sharma','HR','Mumbai',62000,'2019-09-25');
insert into Employees values(103,'Aman Singh','IT','Bengaluru',72000,'2021-03-10');
insert into Employees values(104,'Neha Patel','Sales','Delhi',48000,'2022-01-14');
insert into Employees values(105,'Karan Joshi','Marketing','Pune',45000,'2018-07-22');
insert into Employees values(106,'Divya Nair','IT','Chennai',81000,'2019-12-11');
insert into Employees values(107,'Raj Kumar','HR','Delhi',60000,'2020-05-28');
insert into Employees values(108,'Simran Kaur','Finance','Mumbai',58000,'2021-08-03');
insert into Employees values(109,'Arjun Reddy','IT','Hyderabad',70000,'2022-02-18');
insert into Employees values(110,'Anjali Das','Sales','Kolkata',51000,'2023-01-15');
Drop table Employees;

-- Question 1 : Show employees working in either the ‘IT’ or ‘HR’ departments.
SELECT * FROM Employees where Department in ('IT','HR');

-- Question 2 : Retrieve employees whose department is in ‘Sales’, ‘IT’, or ‘Finance’
SELECT * FROM Employees WHERE Department in ('Sales', 'IT', 'Finance');

-- Question 3 : Display employees whose salary is between ₹50,000 and ₹70,000
SELECT * FROM Employees WHERE Salary between 50000 and 70000;

-- Question 4 : List employees whose names start with the letter ‘A’.
SELECT * FROM Employees WHERE EmpName LIKE 'A%';

-- Question 5 : Find employees whose names contain the substring ‘an’
SELECT * FROM Employees WHERE EmpName LIKE '%an%';

-- Question 6 : Show employees who are from ‘Delhi’ or ‘Mumbai’ and earn more than ₹55,000
SELECT EmpName , Salary  FROM Employees WHERE City in('Delhi','Mumbai') and Salary > 55000;

-- Question 7 : Display all employees except those from the ‘HR’ department.
SELECT * FROM Employees WHERE Department not in('HR'); 

-- Question 8 : Get all employees hired between 2019 and 2022, ordered by HireDate (oldest first).
SELECT * FROM Employees WHERE HireDate between '2019-01-01' and '2022-12-31' order by HireDate;


