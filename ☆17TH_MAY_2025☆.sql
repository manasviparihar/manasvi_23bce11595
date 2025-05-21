-- Use the 'vit' database
USE vit;

-- Create table 'vit_bhopal' to store student details with reg_no as PRIMARY KEY
CREATE TABLE vit_bhopal (
    full_name VARCHAR(100),
    reg_no VARCHAR(20) PRIMARY KEY,
    school VARCHAR(100),
    graduation_year INT
);

-- Insert initial batch of student records into 'vit_bhopal'
INSERT INTO vit_bhopal (full_name, reg_no, school, graduation_year) VALUES
('Ananya Sharma', '21BCE1001', 'School of Computer Science', 2025),
('Rohan Mehta', '21EEE1002', 'School of Electrical Engineering', 2025),
('Sneha Reddy', '21MEC1003', 'School of Mechanical Engineering', 2025),
('Aditya Verma', '20BCE1004', 'School of Computer Science', 2024);

-- Insert additional student records into 'vit_bhopal'
INSERT INTO vit_bhopal (full_name, reg_no, school, graduation_year) VALUES
('Priya Nair', '21CSE1005', 'School of Computer Science', 2025),
('Karthik Iyer', '21ECE1006', 'School of Electronics Engineering', 2025),
('Megha Rao', '20BBA1007', 'School of Business', 2024),
('Arjun Das', '22CIV1008', 'School of Civil Engineering', 2026),
('Divya Kapoor', '21BIO1009', 'School of Bio Sciences', 2025);

-- Retrieve all records from 'vit_bhopal' to verify inserts
SELECT * FROM vit_bhopal;

-- Add a new column 'phone' to the table to store contact numbers
ALTER TABLE vit_bhopal ADD (phone VARCHAR(10));

-- Display the structure of 'vit_bhopal' table including the new column
DESC vit_bhopal;

-- Remove the 'phone' column from the table as it's no longer needed
ALTER TABLE vit_bhopal DROP COLUMN phone;

-- Add a new column 's_country' with a default value 'India'
ALTER TABLE vit_bhopal ADD (s_country VARCHAR(10) DEFAULT 'India');

-- Update the full_name of a specific student in the table
UPDATE vit_bhopal SET full_name = 'Manasvi Parihar' WHERE full_name = 'Megha Rao';
