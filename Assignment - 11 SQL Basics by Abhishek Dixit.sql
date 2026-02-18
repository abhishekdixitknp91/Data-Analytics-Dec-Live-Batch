-- Q1. Create a New Database and Table for Employees
-- Task: Create a new database named company_db and Create a table named employees with the following columns:
Create Database Company_db;
 Use Company_db;
Create Table employees (
employee_id INT Primary Key, first_name VARCHAR(50),
last_name VARCHAR(50), department VARCHAR(50),
salary INT, hire_date Date );
desc employees;
Select * from employees;
-- Q2. Insert Data into Employees Table
-- Task: Insert the following sample records into the employees table
insert into employees values(101,'Amit','Sharma','HR',50000,'2020-01-15');
insert into employees values(102,'Riya','Kapoor','Sales',75000,'2019-03-22');
insert into employees values(103,'Raj','Mehta','IT',90000,'2018-07-11');
insert into employees values(104,'Neha','Verma','IT',85000,'2021-09-01');
insert into employees values(105,'Arjun','Singh','Finance',60000,'2022-02-10');
Select * from employees;
-- Q3. Display All Employee Records Sorted by Salary (Lowest to Highest)
Select * from employees order by Salary asc;
-- Q4. Show Employees Sorted by Department (A–Z) and Salary (High → Low)
Select * from employees order by department asc ,salary desc;
-- Q5. List All Employees in the IT Department, Ordered by Hire Date (Newest First)
select * from employees where department = 'IT' order by hire_date desc;
-- Q6. Create and Populate a Sales Table
-- Task: Create a table  sales to track sales data:
Create table sales(
sale_id int auto_increment primary key,
customer_name varchar(30),
amount int,
sales_date date);
desc sales;
insert into sales(customer_name,amount,sales_date) values('Aditi',1500,'2024-08-01');
insert into sales(customer_name,amount,sales_date) values('Rohan',2200,'2024-08-03');
insert into sales(customer_name,amount,sales_date) values('Aditi',3500,'2024-09-05');
insert into sales(customer_name,amount,sales_date) values('Meena',2700,'2024-09-15');
insert into sales(customer_name,amount,sales_date) values('Rohan',4500,'2024-09-25');
select*from sales;

-- Q7. Display All Sales Records Sorted by Amount (Highest → Lowest)
select* from sales order by amount desc;
-- Q8. Show All Sales Made by Customer “Aditi”
select * from sales where customer_name ='Aditi';