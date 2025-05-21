-- Create a new database named 'school'
CREATE DATABASE school;

-- Use the 'school' database for all subsequent operations
USE school;

-- Create 'Students' table with student_id as the primary key
CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    name VARCHAR(100)
);

-- Create 'Library_Issues' table to record book issues, linked to 'Students' via foreign key
CREATE TABLE Library_Issues (
    issue_id INT PRIMARY KEY,
    student_id INT,
    book_title VARCHAR(100),
    FOREIGN KEY (student_id) REFERENCES Students(student_id)
);

-- Insert sample student records into 'Students' table
INSERT INTO Students (student_id, name) VALUES
(101, 'Rahul'),
(102, 'Nikita'),
(103, 'Ayesha');

-- Insert sample book issue records into 'Library_Issues' table
INSERT INTO Library_Issues (issue_id, student_id, book_title) VALUES
(1, 101, 'C Programming'),
(2, 102, 'Data Structures'),
(3, 101, 'Discrete Math');

-- Attempt to insert an issue with a non-existent student_id (this will fail due to foreign key constraint)
INSERT INTO Library_issues VALUES
(4, 105, 'Ethics and Values');


-- Create a new database named 'store'
CREATE DATABASE store;

-- Use the 'store' database for subsequent commands
USE store;

-- Create 'category' table to store product categories
CREATE TABLE category (
    c_id INT PRIMARY KEY,
    c_name VARCHAR(40),
    c_details VARCHAR(25)
);

-- Insert sample data into 'category' table
INSERT INTO category VALUES
(101, 'electronics', 'abcdefgh'),
(102, 'furnitures', 'abcdefggsdfgdsbdsh');

-- Display all records from 'category' table
SELECT * FROM category;

-- Drop 'products' table if it exists (cleanup or reset)
DROP TABLE products;

-- Create 'products' table with foreign key to 'category'
CREATE TABLE products (
    p_id INT PRIMARY KEY,
    p_name VARCHAR(25),
    p_details VARCHAR(35),
    c_id INT,
    FOREIGN KEY (c_id) REFERENCES category(c_id)
);

-- Delete category with c_id=101 (will fail if referenced by products due to foreign key)
DELETE FROM category WHERE c_id=101;

-- Drop 'category' table completely
DROP TABLE category;

-- Insert records into 'products' table
INSERT INTO products VALUES
(1, 'TV', 'Smart LED 42 inch', 101),
(2, 'TV', 'Smart LED 42 inch', 101),
(3, 'Sofa', 'Leather 3-seater recliner', 102);

-- Display all products
SELECT * FROM products;

-- Delete category 101 again (likely fails if still referenced)
DELETE FROM category WHERE c_id=101;

-- Update 'products' to change category from 101 to 103
UPDATE products SET c_id=103 WHERE c_id=101;

-- Update 'category' to change c_id from 101 to 104
UPDATE category SET c_id=104 WHERE c_id=101;

-- Create 'cust_details' table with unique customer id and default country as 'India'
CREATE TABLE cust_details (
    first_name VARCHAR(40) NOT NULL,
    middle_name VARCHAR(40) NOT NULL,
    last_name VARCHAR(40) NOT NULL,
    c_id INT UNIQUE,
    c_country VARCHAR(35) DEFAULT 'India'
);

-- Insert a customer record into 'cust_details'
INSERT INTO cust_details (first_name, middle_name, last_name, c_id) VALUES
('Shalu', ' ', 'Kumari', 101);

-- Display all customer details
SELECT * FROM cust_details;

-- Add primary key constraint on c_id column
ALTER TABLE cust_details ADD PRIMARY KEY (c_id);

-- Show the create statement for 'cust_details' table (structure overview)
SHOW CREATE TABLE cust_details;

-- Remove primary key from 'cust_details' table
ALTER TABLE cust_details DROP PRIMARY KEY;

-- Drop the unique index on c_id column
ALTER TABLE cust_details DROP INDEX c_id;

-- Show indexes on 'cust_details' to verify removal
SHOW INDEX FROM cust_details;

-- Create 'orders' table linked to 'cust_details' with cascading updates and deletes
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    order_date DATE,
    c_id INT,
    FOREIGN KEY (c_id)
        REFERENCES cust_details(c_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- Drop the 'orders' table (cleanup)
DROP TABLE orders;
