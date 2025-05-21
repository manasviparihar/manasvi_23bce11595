show databases;
create database vit;
use vit;
create table home(
	name varchar(8),
    mob int
);

CREATE TABLE Worker (
	WORKER_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	FIRST_NAME CHAR(25),
	LAST_NAME CHAR(25),
	SALARY INT(15),
	JOINING_DATE DATETIME,
	DEPARTMENT CHAR(25)
);
use vit;
INSERT INTO Worker 
	(WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
		(001, 'Monika', 'Arora', 100000, '14-02-20 09.00.00', 'HR'),
		(002, 'Niharika', 'Verma', 80000, '14-06-11 09.00.00', 'Admin'),
		(003, 'Vishal', 'Singhal', 300000, '14-02-20 09.00.00', 'HR'),
		(004, 'Amitabh', 'Singh', 500000, '14-02-20 09.00.00', 'Admin'),
		(005, 'Vivek', 'Bhati', 500000, '14-06-11 09.00.00', 'Admin'),
		(006, 'Vipul', 'Diwan', 200000, '14-06-11 09.00.00', 'Account'),
		(007, 'Satish', 'Kumar', 75000, '14-01-20 09.00.00', 'Account'),
		(008, 'Geetika', 'Chauhan', 90000, '14-04-11 09.00.00', 'Admin');
        
select*from worker;
delete from worker where salary<=200000;

truncate table worker;

create table cse(
id int,
name varchar(15));

start transaction;
insert into cse values (1001,'jayant');
savepoint a11;

insert into cse values (1002,'praveen');
savepoint a12;
select*from cse;

rollback to a12;

select * from cse;
rollback to a11;

use vit;
INSERT INTO Worker 
	(WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
		(001, 'Monika', 'Arora', 100000, '14-02-20 09.00.00', 'HR'),
		(002, 'Niharika', 'Verma', 80000, '14-06-11 09.00.00', 'Admin'),
		(003, 'Vishal', 'Singhal', 300000, '14-02-20 09.00.00', 'HR'),
		(004, 'Amitabh', 'Singh', 500000, '14-02-20 09.00.00', 'Admin'),
		(005, 'Vivek', 'Bhati', 500000, '14-06-11 09.00.00', 'Admin'),
		(006, 'Vipul', 'Diwan', 200000, '14-06-11 09.00.00', 'Account'),
		(007, 'Satish', 'Kumar', 75000, '14-01-20 09.00.00', 'Account'),
		(008, 'Geetika', 'Chauhan', 90000, '14-04-11 09.00.00', 'Admin');
        
select*from worker;

select  FIRST_NAME from worker;
select  FIRST_NAME as employee from worker;
desc worker;

select*from worker where salary >=300000;
select*from worker where salary <=300000;
select*from worker where DEPARTMENT='HR';
SELECT *FROM Worker WHERE SALARY > 200000 AND DEPARTMENt ='HR';
SELECT FIRST_NAME FROM Worker WHERE SALARY >= 200000 AND SALARY<= 400000 AND DEPARTMENT ='HR' OR DEPARTMENT ='ADMIN';
SELECT WORKER_ID,FIRST_NAME FROM Worker WHERE WORKER_ID IN (1,2,3,5);

SELECT MAX(SALARY) AS max_salary FROM WORKER WHERE DEPARTMENT IN ('HR','ADMIN') AND WORKER_ID % 2 = 0;

use vit;
SELECT min(SALARY) AS min_salary FROM WORKER;
SELECT count(WORKER_ID) AS total_count FROM WORKER;
SELECT avg(SALARY) AS avg_salary FROM WORKER;

CREATE TABLE Employee (
	EMPLOYEE_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	FIRST_NAME CHAR(25),
	LAST_NAME CHAR(25),
	SALARY INT(15),
	JOINING_DATE DATETIME,
	DEPARTMENT CHAR(25)
);

INSERT INTO Employee 
	(EMPLOYEE_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
		(001, 'Anjali', 'Mehra', 95000, '2020-03-15 09:00:00', 'Finance'),
		(002, 'Rohit', 'Sharma', 120000, '2019-07-21 09:00:00', 'IT'),
		(003, 'Sneha', 'Patel', 110000, '2021-01-10 09:00:00', 'Marketing'),
		(004, 'Karan', 'Yadav', 135000, '2018-11-05 09:00:00', 'Operations'),
		(005, 'Pooja', 'Reddy', 98000, '2022-06-25 09:00:00', 'HR'),
		(006, 'Suresh', 'Nair', 150000, '2020-09-14 09:00:00', 'IT'),
		(007, 'Divya', 'Joshi', 102000, '2021-04-30 09:00:00', 'Finance'),
		(008, 'Aakash', 'Mishra', 88000, '2019-12-19 09:00:00', 'HR');


select department from worker 
union all select department from Employee ;

select FIRST_NAME from worker where department ='hr'
union all select FIRST_NAME from Employee  where department ='hr' ;

select department from worker 
union all select department from worker ;

-- Show all databases in the system
SHOW DATABASES;

-- Create a new database named 'vit'
CREATE DATABASE vit;

-- Switch to the 'vit' database
USE vit;

-- Create a simple 'home' table to store name and mobile number
CREATE TABLE home(
	name VARCHAR(8),
    mob INT
);

-- Create a 'Worker' table with essential employee information
CREATE TABLE Worker (
	WORKER_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	FIRST_NAME CHAR(25),
	LAST_NAME CHAR(25),
	SALARY INT(15),
	JOINING_DATE DATETIME,
	DEPARTMENT CHAR(25)
);

-- Ensure we are in the correct database
USE vit;

-- Insert multiple rows into 'Worker' table
INSERT INTO Worker 
	(WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
		(001, 'Monika', 'Arora', 100000, '14-02-20 09.00.00', 'HR'),
		(002, 'Niharika', 'Verma', 80000, '14-06-11 09.00.00', 'Admin'),
		(003, 'Vishal', 'Singhal', 300000, '14-02-20 09.00.00', 'HR'),
		(004, 'Amitabh', 'Singh', 500000, '14-02-20 09.00.00', 'Admin'),
		(005, 'Vivek', 'Bhati', 500000, '14-06-11 09.00.00', 'Admin'),
		(006, 'Vipul', 'Diwan', 200000, '14-06-11 09.00.00', 'Account'),
		(007, 'Satish', 'Kumar', 75000, '14-01-20 09.00.00', 'Account'),
		(008, 'Geetika', 'Chauhan', 90000, '14-04-11 09.00.00', 'Admin');

-- View all records from the 'Worker' table
SELECT * FROM Worker;

-- Delete workers with salary less than or equal to 200000
DELETE FROM Worker WHERE SALARY <= 200000;

-- Remove all data from 'Worker' table but keep its structure
TRUNCATE TABLE Worker;

-- Create 'cse' table with ID and name
CREATE TABLE cse(
    id INT,
    name VARCHAR(15)
);

-- Begin a transaction block for safe data handling
START TRANSACTION;

-- Insert a row and set a savepoint
INSERT INTO cse VALUES (1001, 'jayant');
SAVEPOINT a11;

-- Insert another row and set a new savepoint
INSERT INTO cse VALUES (1002, 'praveen');
SAVEPOINT a12;

-- Check current data in 'cse'
SELECT * FROM cse;

-- Rollback to savepoint a12 (no effect as it's the last action)
ROLLBACK TO a12;

-- Check state after rollback to a12
SELECT * FROM cse;

-- Rollback further to savepoint a11
ROLLBACK TO a11;

-- Reinsert workers after previous truncation
USE vit;
INSERT INTO Worker 
	(WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
		(001, 'Monika', 'Arora', 100000, '14-02-20 09.00.00', 'HR'),
		(002, 'Niharika', 'Verma', 80000, '14-06-11 09.00.00', 'Admin'),
		(003, 'Vishal', 'Singhal', 300000, '14-02-20 09.00.00', 'HR'),
		(004, 'Amitabh', 'Singh', 500000, '14-02-20 09.00.00', 'Admin'),
		(005, 'Vivek', 'Bhati', 500000, '14-06-11 09.00.00', 'Admin'),
		(006, 'Vipul', 'Diwan', 200000, '14-06-11 09.00.00', 'Account'),
		(007, 'Satish', 'Kumar', 75000, '14-01-20 09.00.00', 'Account'),
		(008, 'Geetika', 'Chauhan', 90000, '14-04-11 09.00.00', 'Admin');

-- Fetch all worker records
SELECT * FROM Worker;

-- View only first names
SELECT FIRST_NAME FROM Worker;

-- Rename output column
SELECT FIRST_NAME AS employee FROM Worker;

-- Describe table structure
DESC Worker;

-- Filter workers by high salary
SELECT * FROM Worker WHERE SALARY >= 300000;

-- Filter workers by low salary
SELECT * FROM Worker WHERE SALARY <= 300000;

-- Get all workers in HR department
SELECT * FROM Worker WHERE DEPARTMENT = 'HR';

-- Combined condition with AND
SELECT * FROM Worker WHERE SALARY > 200000 AND DEPARTMENT = 'HR';

-- Combine complex filters using AND/OR
SELECT FIRST_NAME FROM Worker WHERE SALARY BETWEEN 200000 AND 400000 AND DEPARTMENT = 'HR' OR DEPARTMENT = 'ADMIN';

-- Select specific workers using IN
SELECT WORKER_ID, FIRST_NAME FROM Worker WHERE WORKER_ID IN (1, 2, 3, 5);

-- Get max salary among even ID workers in HR/Admin
SELECT MAX(SALARY) AS max_salary FROM Worker WHERE DEPARTMENT IN ('HR', 'ADMIN') AND WORKER_ID % 2 = 0;

-- Minimum salary
SELECT MIN(SALARY) AS min_salary FROM Worker;

-- Total number of workers
SELECT COUNT(WORKER_ID) AS total_count FROM Worker;

-- Average salary
SELECT AVG(SALARY) AS avg_salary FROM Worker;

-- Create another employee table
CREATE TABLE Employee (
	EMPLOYEE_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	FIRST_NAME CHAR(25),
	LAST_NAME CHAR(25),
	SALARY INT(15),
	JOINING_DATE DATETIME,
	DEPARTMENT CHAR(25)
);

-- Insert employees into new table
INSERT INTO Employee 
	(EMPLOYEE_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
		(001, 'Anjali', 'Mehra', 95000, '2020-03-15 09:00:00', 'Finance'),
		(002, 'Rohit', 'Sharma', 120000, '2019-07-21 09:00:00', 'IT'),
		(003, 'Sneha', 'Patel', 110000, '2021-01-10 09:00:00', 'Marketing'),
		(004, 'Karan', 'Yadav', 135000, '2018-11-05 09:00:00', 'Operations'),
		(005, 'Pooja', 'Reddy', 98000, '2022-06-25 09:00:00', 'HR'),
		(006, 'Suresh', 'Nair', 150000, '2020-09-14 09:00:00', 'IT'),
		(007, 'Divya', 'Joshi', 102000, '2021-04-30 09:00:00', 'Finance'),
		(008, 'Aakash', 'Mishra', 88000, '2019-12-19 09:00:00', 'HR');

-- Combine departments from Worker and Employee tables
SELECT DEPARTMENT FROM Worker 
UNION ALL 
SELECT DEPARTMENT FROM Employee;

-- Combine first names of HR employees
SELECT FIRST_NAME FROM Worker WHERE DEPARTMENT = 'HR'
UNION ALL
SELECT FIRST_NAME FROM Employee WHERE DEPARTMENT = 'HR';

-- Self-union to duplicate departments
SELECT DEPARTMENT FROM Worker 
UNION ALL
SELECT DEPARTMENT FROM Worker;

-- Classify workers based on salary
SELECT FIRST_NAME, SALARY,
CASE
	WHEN SALARY > 300000 THEN 'rich'
    WHEN SALARY <= 300000 AND SALARY > 100000 THEN 'middle class'
    WHEN SALARY <= 100000 THEN 'poor'
    ELSE 'nothing'
END AS status_check
FROM Worker;

-- Sort by salary ascending (less than 200000)
SELECT FIRST_NAME, SALARY FROM Worker WHERE SALARY < 200000 ORDER BY SALARY ASC;

-- Sort by salary descending (less than 200000)
SELECT * FROM Worker WHERE SALARY < 200000 ORDER BY SALARY DESC;

-- Order by multiple fields
SELECT FIRST_NAME, LAST_NAME FROM Worker ORDER BY FIRST_NAME ASC, LAST_NAME DESC;

-- Rename first_name as name
SELECT FIRST_NAME AS name FROM Worker;

-- Use pattern matching with LIKE
SELECT * FROM Worker WHERE FIRST_NAME LIKE '_i%l';
SELECT * FROM Worker WHERE LAST_NAME LIKE '_e__a%';
SELECT * FROM Worker WHERE FIRST_NAME LIKE 'a_a';

-- Filter names using various LIKE patterns
SELECT * FROM Worker;
SELECT * FROM Worker WHERE FIRST_NAME LIKE 'm%';
SELECT * FROM Worker WHERE FIRST_NAME LIKE '%bh';
SELECT * FROM Worker WHERE SALARY LIKE '2%';
SELECT * FROM Worker WHERE SALARY LIKE '_0000';

-- Create a view for HR department
CREATE VIEW admin_team AS SELECT * FROM Worker WHERE DEPARTMENT = 'HR';
SELECT * FROM admin_team;

-- Create a view for high earners
CREATE VIEW rich_guy AS SELECT * FROM Worker WHERE SALARY > 300000;
SELECT * FROM rich_guy;
