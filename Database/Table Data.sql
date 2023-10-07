
use hrms;
-- Insert sample values into Organization table
INSERT INTO `Organization` (`Name`, `Main_Branch`, `Start_Date`)
VALUES
  ( 'ABC Company', 'BR001', '2023-01-01'),
  ('XYZ Inc.', 'BR002', '2023-02-15'),
  ( 'ABC Company', 'BR001', '2023-01-01'),
  ( 'XYZ Inc.', 'BR002', '2023-02-15'),
  ( 'LMN Corporation', 'BR003', '2023-03-10'),
  ( 'PQR Ltd.', 'BR004', '2023-04-20');

-- Insert sample values into Dependent_Information table


-- Insert sample values into Branch table
INSERT INTO `Branch` (`Branch_Name`, `Address`, `Currency`)
VALUES
  ( 'Main Branch', '123 Main Street, City1', 'USD'),
  ('Downtown Branch', '456 Elm Street, City1', 'USD'),
  ( 'City Center Branch', '789 Oak Avenue, City2', 'EUR'),
  ( 'Westside Branch', '101 Pine Road, City2', 'EUR'),
  ( 'East End Branch', '234 Maple Lane, City3', 'GBP'),
  ( 'Northside Branch', '567 Cedar Drive, City3', 'GBP'),
  ( 'South Bank Branch', '890 Birch Street, City4', 'USD'),
  ( 'Riverside Branch', '112 Willow Avenue, City4', 'USD'),
  ( 'Hilltop Branch', '345 Redwood Road, City5', 'EUR'),
  ( 'Harbor View Branch', '678 Spruce Lane, City5', 'EUR'),
  ( 'Beachside Branch', '901 Sycamore Street, City6', 'GBP'),
  ( 'Lakefront Branch', '234 Pine Drive, City6', 'GBP'),
  ( 'Central Park Branch', '567 Birch Avenue, City7', 'USD'),
  ( 'Greenwood Branch', '890 Elm Road, City7', 'USD'),
  ( 'Valley Branch', '123 Cedar Lane, City8', 'EUR'),
  ('Mountain View Branch', '456 Oak Street, City8', 'EUR'),
  ( 'Sunset Branch', '789 Redwood Avenue, City9', 'GBP'),
  ( 'Skyline Branch', '101 Maple Road, City9', 'GBP'),
  ( 'Riverside Branch', '234 Pine Lane, City10', 'USD'),
  ( 'Hillside Branch', '567 Willow Drive, City10', 'USD');


-- Insert sample values into Department table
INSERT INTO `Department` ( `Dept_Name`, `Budget`)
VALUES
  ( 'Human Resources', 100000.00),
  ( 'Finance', 150000.00),
  ( 'Marketing', 120000.00),
  ( 'Information Technology', 200000.00),
  ( 'Sales', 130000.00),
  ( 'Research and Development', 180000.00),
  ( 'Customer Support', 110000.00),
  ( 'Production', 160000.00),
  ( 'Quality Assurance', 90000.00),
  ( 'Supply Chain', 140000.00),
  ( 'Legal', 95000.00),
  ( 'Public Relations', 110000.00),
  ( 'Design', 75000.00),
  ( 'Facilities Management', 80000.00),
  ( 'Health and Safety', 70000.00),
  ( 'Training and Development', 85000.00),
  ( 'Engineering', 190000.00),
  ( 'Accounting', 120000.00),
  ( 'Customer Relations', 105000.00),
  ( 'Purchasing', 135000.00);

-- Insert sample values into Employment_Status table
INSERT INTO `Employment_Status` (`Status`)
VALUES
  ('Intern(Full-time)'),
  ('Intern(Part-time)'),
  ('Contract(full-time)'),
  ('Contract(part-time)'),
  ('Permanent'),
  ('Freelance');
  
-- Insert sample values into Pay_Grade table
INSERT INTO `Pay_Grade` (`Pay_Grade`, `Basic_Salary`)
VALUES
  ('Level1', 50000.00),
  ('Level2', 45000.00),
  ('Level3', 40000.00),
  ('Level4', 35000.00),
  ('Level5', 30000.00),
  ('Level6', 25000.00),
  ('Level7', 20000.00),
  ('Level8', 15000.00),
  ('Level9', 12000.00),
  ('Level10', 10000.00);

-- Insert sample values into Leave_Limit table
INSERT INTO `Leave_Limit` (`Pay_Grade_ID`, `Annual`, `Casual`, `No_Pay`, `Maternity_Leave`)
VALUES
  (1, 20, 10, 5, 12),
  (2, 25, 15, 7, 14),
  (3, 18, 8, 4, 11),
  (4, 22, 12, 6, 13),
  (5, 15, 7, 3, 10);

INSERT INTO `Dependent_Information` (`First_Name`, `Last_Name`, `Age`, `Relation`, `Gender`)
VALUES
  ( 'Michael', 'Johnson', 18, 'Child', 'Male'),
  ('Emily', 'Davis', 22, 'Child', 'Female'),
  ('Daniel', 'Brown', 12, 'Child', 'Male'),
  ( 'Olivia', 'Lee', 19, 'Child', 'Female'),
  ('William', 'Martinez', 16, 'Child', 'Male'),
  ( 'Sophia', 'Garcia', 27, 'Child', 'Female'),
  ('Ethan', 'Thomas', 21, 'Child', 'Male'),
  ( 'Ava', 'White', 32, 'Child', 'Female'),
  ( 'Noah', 'Harris', 14, 'Child', 'Male'),
  ('Isabella', 'Martin', 23, 'Child', 'Female'),
  ( 'Liam', 'Smith', 10, 'Child', 'Male'),
  ( 'Emma', 'Wilson', 8, 'Child', 'Female'),
  ( 'Henry', 'Johnson', 15, 'Child', 'Male'),
  ( 'Oliver', 'Davis', 20, 'Child', 'Male'),
  ( 'Sophia', 'Martinez', 17, 'Child', 'Female'),
  ( 'Noah', 'Brown', 12, 'Child', 'Male'),
  ( 'Ava', 'Lee', 9, 'Child', 'Female'),
  ( 'William', 'Garcia', 14, 'Child', 'Male'),
  ( 'Isabella', 'Thomas', 22, 'Child', 'Female'),
  ( 'Mia', 'White', 18, 'Child', 'Female');


-- Insert sample values into Employee_Data table
INSERT INTO `Employee_Data` (`First_Name`, `Last_Name`, `Gender`, `Marital_Status`, `Birthday`, `Email`, `Employment_Status`, `Job_Title`, `Pay_Grade_ID`, `Branch_ID`, `Dept_ID`, `Dependent_ID`)
VALUES
  ( 'John', 'Doe', 'Male', 'Married', '1990-05-15', 'john.doe@gmail.com', 1, 'Software Engineer', 1, 'BR001', 'DEPT001', 'DEP0001'),
  ( 'Jane', 'Smith', 'Female', 'Unmarried', '1988-08-21', 'jane.smith@gmail.com', 2, 'Software Engineer', 2, 'BR001', 'DEPT002', 'DEP0002'),
  ( 'Michael', 'Johnson', 'Male', 'Married', '1995-03-10', 'michael.johnson@gmail.com', 1, 'Accountant', 2, 'BR002', 'DEPT002', 'DEP0001'),
  ( 'Emily', 'Davis', 'Female', 'Unmarried', '1992-11-25', 'emily.davis@gmail.com', 1, 'Software Engineer', 1, 'BR001', 'DEPT001', 'DEP0001'),
  ( 'David', 'Wilson', 'Male', 'Married', '1987-09-28', 'david.wilson@gmail.com', 3, 'HR Manager', 3, 'BR003', 'DEPT003', 'DEP0003'),
  ( 'Sarah', 'Anderson', 'Female', 'Unmarried', '1993-12-07', 'sarah.anderson@gmail.com', 3, 'Accountant', 3, 'BR003', 'DEPT003', 'DEP0004'),
  ( 'Daniel', 'Brown', 'Male', 'Married', '1995-07-14', 'daniel.brown@gmail.com', 4, 'Software Engineer', 4, 'BR004', 'DEPT004', 'DEP0005'),
  ( 'Olivia', 'Lee', 'Female', 'Unmarried', '1998-02-18', 'olivia.lee@gmail.com', 4, 'QA Engineer', 4, 'BR004', 'DEPT004', 'DEP0006'),
  ( 'William', 'Martinez', 'Male', 'Married', '1994-04-03', 'william.martinez@gmail.com', 5, 'HR Manager', 5, 'BR005', 'DEPT005', 'DEP0007'),
  ( 'Sophia', 'Garcia', 'Female', 'Unmarried', '1996-06-20', 'sophia.garcia@gmail.com', 5, 'Accountant', 5, 'BR005', 'DEPT005', 'DEP0008'),
  ( 'Ethan', 'Thomas', 'Male', 'Married', '1999-01-12', 'ethan.thomas@gmail.com', 6, 'Software Engineer', 6, 'BR006', 'DEPT006', 'DEP0009'),
  ( 'Ava', 'White', 'Female', 'Unmarried', '1991-04-05', 'ava.white@gmail.com', 6, 'QA Engineer', 6, 'BR006', 'DEPT006', 'DEP0010'),
  ( 'Noah', 'Harris', 'Male', 'Married', '1997-08-09', 'noah.harris@gmail.com', 1, 'HR Manager', 7, 'BR007', 'DEPT007', 'DEP0011'),
  ( 'Isabella', 'Martin', 'Female', 'Unmarried', '1990-03-17', 'isabella.martin@gmail.com', 2, 'Accountant', 7, 'BR007', 'DEPT007', 'DEP0012'),
 ( 'James', 'Clark', 'Male', 'Married', '1985-06-30', 'james.clark@gmail.com', 3, 'Software Engineer', 8, 'BR008', 'DEPT008', 'DEP0013'),
 ( 'Mia', 'Lewis', 'Female', 'Unmarried', '1989-10-11', 'mia.lewis@gmail.com', 4, 'QA Engineer', 8, 'BR008', 'DEPT008', 'DEP0014'),
  ( 'Liam', 'Walker', 'Male', 'Married', '1996-12-25', 'liam.walker@gmail.com', 5, 'HR Manager', 9, 'BR009', 'DEPT009', 'DEP0015'),
  ( 'Avery', 'Hall', 'Female', 'Unmarried', '1993-02-14', 'avery.hall@gmail.com',6, 'Accountant', 9, 'BR009', 'DEPT009', 'DEP0016'),
  ( 'Benjamin', 'Adams', 'Male', 'Married', '1992-04-27', 'benjamin.adams@gmail.com', 4, 'Software Engineer', 10, 'BR010', 'DEPT007', 'DEP0017');

-- Insert sample values into Contact_Number_Details table
INSERT INTO `Contact_Number_Details` (`Employee_ID`, `Contact_Number`)
VALUES
  ('EMP0001', '0724567890'),
  ('EMP0002', '0776543210'),
  ('EMP0003', '0711234567'), 
  ('EMP0004', '0112345678'), 
  ('EMP0005', '0779876543'), 
  ('EMP0006', '0813456789'); 


-- Insert sample values into Employee_Account table
INSERT INTO `Employee_Account` (`User_ID`, `Employee_ID`, `Password`, `Profile_Picture`)
VALUES
  ('john.doe', 'EMP0001', 'password123', 'profile_pic1.jpg'),
  ('jane.smith', 'EMP0002', 'secret456', 'profile_pic2.jpg'),
  ('arachchi.p', 'EMP0003', 'password123', 'profile_pic1.jpg'),
  ('harih.smith', 'EMP0004', 'secret456', 'profile_pic2.jpg'),
  ('michael.johnson', 'EMP0005', 'confidential789', 'profile_pic3.jpg'),
  ('emily.davis', 'EMP0006', 'topsecret123', 'profile_pic4.jpg'),
  ('daniel.brown', 'EMP0007', 'securepassword', 'profile_pic5.jpg');


-- Insert sample values into Supervisor table
INSERT INTO `Supervisor` (`Supervisor_ID`, `Subordinate_ID`)
VALUES
  ('EMP0001', 'EMP0003'),
  ('EMP0002', 'EMP0004'),
  ('EMP0003', 'EMP0001'),
  ('EMP0001', 'EMP0002'),
  ('EMP0001', 'EMP0005'),
  ('EMP0001', 'EMP0006'),
  ('EMP0001', 'EMP0007'),
  ('EMP0001', 'EMP0008'),
  ('EMP0001', 'EMP0009'),
  ('EMP0001', 'EMP0010'),
  ('EMP0001', 'EMP0011'),
  ('EMP0001', 'EMP0012'),
  ('EMP0001', 'EMP0013'),
  ('EMP0001', 'EMP0014');


-- Insert sample values into Custom_Attribute_Definition table
INSERT INTO `Custom_Attribute_Definition` (`Attribute_Name`)
VALUES
('Age'),
('Gender'),
('Occupation'),
('Marital Status'),
('Education Level'),
('Income'),
('Hobbies'),
('Address'),
('Nationality');

-- Insert sample values into Employee_Custom_Attribute table
INSERT INTO `Employee_Custom_Attribute` (`Attribute_ID`, `Employee_ID`, `Value`)
VALUES
  (1, 'EMP0001', 'Leadership Skills'),
  (2, 'EMP0001', 'Financial Literacy'),
  (3, 'EMP0002', 'Communication Skills'),
  (4, 'EMP0002', 'Problem-Solving Abilities'),
  (5, 'EMP0003', 'Project Management Skills'),
  (4, 'EMP0003', 'Networking Skills');


-- Insert sample values into Employee_Leave_Count table
INSERT INTO `Employee_Leave_Count` (`Employee_ID`, `Annual`, `Casual`, `No_Pay`, `Maternity_Leave`)
VALUES
  ('EMP0001', 15, 5, 2, 8),
  ('EMP0002', 18, 7, 3, 10),
('EMP0003', 12, 4, 1, 6),
('EMP0004', 14, 6, 2, 7),
  ('EMP0005', 17, 7, 3, 9),
  ('EMP0006', 20, 8, 4, 12);

-- Insert sample values into Leave_Request table
INSERT INTO `Leave_Request` (`Employee_ID`, `Start_Date`, `No_of_Days`, `Type`, `Status`)
VALUES
  ('EMP0001', '2023-10-10', 5, 'Annual', 'Pending'),
  ('EMP0002', '2023-11-15', 3, 'Casual', 'Approved'),
  ('EMP0003', '2023-09-20', 2, 'Annual', 'Pending'),
  ('EMP0004', '2023-10-05', 7, 'Casual', 'Approved'),
  ('EMP0005', '2023-11-01', 1, 'Annual', 'Pending'),
  ('EMP0006', '2023-12-10', 4, 'Casual', 'Pending'),
  ('EMP0007', '2023-09-15', 5, 'Maternity', 'Approved'),
  ('EMP0008', '2023-11-20', 2, 'Annual', 'Pending');



