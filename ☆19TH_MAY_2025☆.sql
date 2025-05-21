-- Show all existing databases
SHOW DATABASES;

-- Switch to the 'vit' database
USE vit;

-- Show all tables in 'vit'
SHOW TABLES;

-- Describe structure of vit_bhopal table
DESC vit_bhopal;

-- Remove 's_country' column from vit_bhopal table
ALTER TABLE vit_bhopal DROP COLUMN s_country;

-- Create new table 'vit_ap' if it doesn't exist
CREATE TABLE IF NOT EXISTS vit_ap (
    full_name VARCHAR(100),
    reg_no VARCHAR(20),
    school VARCHAR(100),
    graduation_year INT
);

-- Insert student records into vit_ap table
INSERT INTO vit_ap (full_name, reg_no, school, graduation_year) VALUES
('Ananya Reddy', '21BCE1001', 'School of Computer Science and Engineering', 2025),
('Ravi Teja', '21ECE1002', 'School of Electronics Engineering', 2025),
('Sneha Kumari', '21MEC1003', 'School of Mechanical Engineering', 2025),
('Karthik Rao', '21CIV1004', 'School of Civil Engineering', 2025),
('Meena Iyer', '21EEE1005', 'School of Electrical Engineering', 2025),
('Siddharth Jain', '21BCE1006', 'School of Computer Science and Engineering', 2025),
('Pooja Sharma', '21ECE1007', 'School of Electronics Engineering', 2025),
('Arjun Das', '21MEC1008', 'School of Mechanical Engineering', 2025),
('Divya Patel', '21CIV1009', 'School of Civil Engineering', 2025),
('Rahul Verma', '21EEE1010', 'School of Electrical Engineering', 2025);

-- Create 'vit_bhopal' table if it doesn't exist
CREATE TABLE IF NOT EXISTS vit_bhopal (
    full_name VARCHAR(100),
    reg_no VARCHAR(20),
    school VARCHAR(100),
    graduation_year INT
);

-- Insert student records into vit_bhopal table
INSERT INTO vit_bhopal (full_name, reg_no, school, graduation_year) VALUES
('Aarti Mehra', '21BCE1101', 'School of Computer Science and Engineering', 2025),
('Manish Kumar', '21ECE1102', 'School of Electronics Engineering', 2025),
('Neha Gupta', '21MEC1103', 'School of Mechanical Engineering', 2025),
('Vikram Singh', '21CIV1104', 'School of Civil Engineering', 2025),
('Tanvi Nair', '21EEE1105', 'School of Electrical Engineering', 2025),
('Abhinav Joshi', '21BCE1106', 'School of Computer Science and Engineering', 2025),
('Ritika Roy', '21ECE1107', 'School of Electronics Engineering', 2025),
('Karan Thakur', '21MEC1108', 'School of Mechanical Engineering', 2025),
('Priya Yadav', '21CIV1109', 'School of Civil Engineering', 2025),
('Aman Kapoor', '21EEE1110', 'School of Electrical Engineering', 2025);

-- Display all records from vit_ap table
SELECT * FROM vit_ap;

-- Display all records from vit_bhopal table
SELECT * FROM vit_bhopal;

-- Create Worker1 table with auto-incrementing primary key
CREATE TABLE IF NOT EXISTS Worker1 (
    WORKER_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    FIRST_NAME CHAR(25),
    LAST_NAME CHAR(25),
    SALARY INT,
    JOINING_DATE DATETIME,
    DEPARTMENT CHAR(25)
);

-- Insert workers' data (let AUTO_INCREMENT handle WORKER_ID)
INSERT INTO Worker1(FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
('Monika', 'Arora', 100000, '2020-02-14 09:00:00', 'HR'),
('Niharika', 'Verma', 80000, '2011-06-14 09:00:00', 'Admin'),
('Vishal', 'Singhal', 300000, '2020-02-14 09:00:00', 'HR'),
('Amitabh', 'Singh', 500000, '2020-02-14 09:00:00', 'Admin'),
('Vivek', 'Bhati', 500000, '2011-06-14 09:00:00', 'Admin'),
('Vipul', 'Diwan', 200000, '2011-06-14 09:00:00', 'Account'),
('Satish', 'Kumar', 75000, '2020-01-14 09:00:00', 'Account'),
('Geetika', 'Chauhan', 90000, '2011-04-14 09:00:00', 'Admin');

-- View all data from Worker1 table
SELECT * FROM Worker1;

-- Remove workers from 'Account' department
DELETE FROM Worker1 WHERE DEPARTMENT = 'Account';

-- Drop table named 'worker' if exists
DROP TABLE IF EXISTS worker;

-- Delete a specific student from vit_bhopal
DELETE FROM vit_bhopal WHERE full_name = 'Aarti Mehra';

-- Remove all records from Worker1 (reset table)
TRUNCATE TABLE Worker1;

-- Select workers with salary greater than 75,000
SELECT * FROM Worker1 WHERE SALARY > 75000;

-- Select first names of HR workers earning 10,000 or more
SELECT FIRST_NAME FROM Worker1 WHERE DEPARTMENT = 'HR' AND SALARY >= 10000;

-- Select first names and departments where salary > 200,000 in HR
SELECT FIRST_NAME, DEPARTMENT FROM Worker1 WHERE SALARY > 200000 AND DEPARTMENT = 'HR';

-- Select workers with salary under 200,000 in HR or in Admin department
SELECT * FROM Worker1 WHERE (SALARY < 200000 AND DEPARTMENT = 'HR') OR DEPARTMENT = 'Admin';

-- Select workers with salary between 100,000 and 300,000 in Admin or Account
SELECT * FROM Worker1 WHERE SALARY > 100000 AND SALARY < 300000 AND (DEPARTMENT = 'Admin' OR DEPARTMENT = 'Account');

-- Select workers not in HR or Admin departments
SELECT * FROM Worker1 WHERE DEPARTMENT NOT IN ('HR', 'Admin');

-- Find max salary of workers with even IDs in HR or Admin
SELECT * FROM Worker1 WHERE MOD(WORKER_ID, 2) = 0 AND DEPARTMENT IN ('Admin', 'HR') AND SALARY = (
    SELECT MAX(SALARY) FROM Worker1 WHERE MOD(WORKER_ID, 2) = 0 AND DEPARTMENT IN ('Admin', 'HR')
);

-- Create database vitbhopal if not exists and switch to it
CREATE DATABASE IF NOT EXISTS vitbhopal;
USE vitbhopal;

-- Create table for transaction demo
CREATE TABLE IF NOT EXISTS cse (
    id INT,
    name VARCHAR(40)
);

-- Start transaction block
START TRANSACTION;

-- Insert first record and set savepoint a11
INSERT INTO cse VALUES (101, 'Arnav');
SAVEPOINT a11;

-- Insert second record and set savepoint a12
INSERT INTO cse VALUES (102, 'Nikita');
SAVEPOINT a12;

-- Delete record with id 101
DELETE FROM cse WHERE id = 101;

-- View current cse table data
SELECT * FROM cse;

-- Rollback to savepoint a12 (undo delete)
ROLLBACK TO a12;

-- Delete all records from cse
DELETE FROM cse;

-- Insert two new records with savepoints
INSERT INTO cse VALUES (103, 'Nikhil');
SAVEPOINT a13;
INSERT INTO cse VALUES (104, 'Smriti');
SAVEPOINT a14;

-- Delete one record and view remaining
DELETE FROM cse WHERE id = 103;
SELECT * FROM cse;

-- Rollback to savepoint a14 (undo delete)
ROLLBACK TO a14;

-- Commit all changes made in transaction
COMMIT;
