use hrms;

-- Insert sample values into Organization table
INSERT INTO Organization (Name, Start_Date)
VALUES ('Jupiter Apparels', '2023-10-07');

-- Insert sample values into Branch table
INSERT INTO Branch (Branch_Name, Address, Currency)
VALUES
  ('Sri Lanka', '123 Main Street, Colombo 3, Sri Lanka.', 'LKR'),
  ('Bangladesh', '456 Elm Street, Dhaka, Bangladesh.', 'BDT'),
  ('Pakistan', '789 Oak Avenue, Islamabad, Pakistan.', 'PKR');

-- Insert sample values into Department table
INSERT INTO Department (Dept_Name, Budget)
VALUES
  ('Human Resources', 100000.00),
  ('Finance', 150000.00),
  ('Marketing', 120000.00),
  ('Information Technology', 200000.00),
  ('Sales', 130000.00),
  ('Research and Development', 180000.00),
  ('Customer Support', 110000.00),
  ('Production', 160000.00),
  ('Quality Assurance', 90000.00),
  ('Supply Chain', 140000.00),
  ('Legal', 95000.00),
  ('Public Relations', 110000.00),
  ('Design', 75000.00),
  ('Facilities Management', 80000.00),
  ('Health and Safety', 70000.00),
  ('Training and Development', 85000.00),
  ('Engineering', 190000.00),
  ('Accounting', 120000.00),
  ('Customer Relations', 105000.00),
  ('Purchasing', 135000.00);

-- Insert sample values into Employment_Status table
INSERT INTO Employment_Status (Status)
VALUES
  ('Intern (Full-time)'),
  ('Intern (Part-time)'),
  ('Contract (Full-time)'),
  ('Contract (Part-time)'),
  ('Permanent'),
  ('Freelance');
  
-- Insert sample values into Pay_Grade table
INSERT INTO Pay_Grade (Pay_Grade, Basic_Salary)
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
INSERT INTO Leave_Limit (Pay_Grade_ID, Annual, Casual, No_Pay, Maternity_Leave)
VALUES
  (1, 20, 10, 50, 90),
  (2, 25, 15, 50, 90),
  (3, 18, 8, 50, 90),
  (4, 22, 12, 50, 60),
  (5, 15, 7, 50, 60),
  (6, 20, 10, 50, 60),
  (7, 25, 15, 50, 60),
  (8, 18, 8, 50, 30),
  (9, 22, 12, 50, 30),
  (10, 15, 7, 50, 30);

-- Insert sample values into Dependent_Information table
INSERT INTO Dependent_Information (First_Name, Last_Name, Age, Relation, Gender)
VALUES
  ('Michael', 'Johnson', 18, 'Child', 'Male'),
  ('Emily', 'Davis', 22, 'Child', 'Female'),
  ('Daniel', 'Brown', 12, 'Child', 'Male'),
  ('Olivia', 'Lee', 19, 'Child', 'Female'),
  ('William', 'Martinez', 16, 'Child', 'Male'),
  ('Sophia', 'Garcia', 27, 'Child', 'Female'),
  ('Ethan', 'Thomas', 21, 'Child', 'Male'),
  ('Ava', 'White', 32, 'Child', 'Female'),
  ('Noah', 'Harris', 14, 'Child', 'Male'),
  ('Isabella', 'Martin', 23, 'Child', 'Female'),
  ('Liam', 'Smith', 10, 'Child', 'Male'),
  ('Emma', 'Wilson', 8, 'Child', 'Female'),
  ('Henry', 'Johnson', 15, 'Child', 'Male'),
  ('Oliver', 'Davis', 20, 'Child', 'Male'),
  ('Sophia', 'Martinez', 17, 'Child', 'Female'),
  ('Noah', 'Brown', 12, 'Child', 'Male'),
  ('Ava', 'Lee', 9, 'Child', 'Female'),
  ('William', 'Garcia', 14, 'Child', 'Male'),
  ('Isabella', 'Thomas', 22, 'Child', 'Female'),
  ('Mia', 'White', 18, 'Child', 'Female');

-- Insert sample values into Employee_Data table
INSERT INTO Employee_Data (First_Name, Last_Name, Gender, Marital_Status, Birthday, Email, Employment_Status, Job_Title, Pay_Grade_ID, Branch_ID, Dept_ID, Dependent_ID)
VALUES
  ('John', 'Doe', 'Male', 'Married', '1990-05-15', 'john.doe@gmail.com', 1, 'Software Engineer', 1, 'BR001', 'DEPT001', 'DEP0001'),
  ('Jane', 'Smith', 'Female', 'Unmarried', '1988-08-21', 'jane.smith@gmail.com', 2, 'Software Engineer', 2, 'BR001', 'DEPT002', 'DEP0002'),
  ('Michael', 'Johnson', 'Male', 'Married', '1995-03-10', 'michael.johnson@gmail.com', 1, 'Accountant', 2, 'BR002', 'DEPT002', 'DEP0003'),
  ('Emily', 'Davis', 'Female', 'Unmarried', '1992-11-25', 'emily.davis@gmail.com', 1, 'Software Engineer', 1, 'BR001', 'DEPT001', 'DEP0004'),
  ('David', 'Wilson', 'Male', 'Married', '1987-09-28', 'david.wilson@gmail.com', 3, 'HR Manager', 3, 'BR003', 'DEPT003', 'DEP0005'),
  ('Sarah', 'Anderson', 'Female', 'Unmarried', '1993-12-07', 'sarah.anderson@gmail.com', 3, 'Accountant', 3, 'BR001', 'DEPT003', 'DEP0006'),
  ('Daniel', 'Brown', 'Male', 'Married', '1995-07-14', 'daniel.brown@gmail.com', 4, 'Software Engineer', 4, 'BR001', 'DEPT004', 'DEP0007'),
  ('Olivia', 'Lee', 'Female', 'Unmarried', '1998-02-18', 'olivia.lee@gmail.com', 4, 'QA Engineer', 4, 'BR001', 'DEPT004', 'DEP0008'),
  ('William', 'Martinez', 'Male', 'Married', '1994-04-03', 'william.martinez@gmail.com', 5, 'HR Manager', 5, 'BR001', 'DEPT005', 'DEP0009'),
  ('Sophia', 'Garcia', 'Female', 'Unmarried', '1996-06-20', 'sophia.garcia@gmail.com', 5, 'Accountant', 5, 'BR001', 'DEPT005', 'DEP0010'),
  ('Ethan', 'Thomas', 'Male', 'Married', '1999-01-12', 'ethan.thomas@gmail.com', 6, 'Software Engineer', 6, 'BR002', 'DEPT006', 'DEP0011'),
  ('Ava', 'White', 'Female', 'Unmarried', '1991-04-05', 'ava.white@gmail.com', 6, 'QA Engineer', 6, 'BR002', 'DEPT006', 'DEP0012'),
  ('Noah', 'Harris', 'Male', 'Married', '1997-08-09', 'noah.harris@gmail.com', 1, 'HR Manager', 7, 'BR001', 'DEPT007', 'DEP0013'),
  ('Isabella', 'Martin', 'Female', 'Unmarried', '1990-03-17', 'isabella.martin@gmail.com', 2, 'Accountant', 7, 'BR001', 'DEPT007', 'DEP0014'),
  ('James', 'Clark', 'Male', 'Married', '1985-06-30', 'james.clark@gmail.com', 3, 'Software Engineer', 8, 'BR001', 'DEPT008', 'DEP0015'),
  ('Mia', 'Lewis', 'Female', 'Unmarried', '1989-10-11', 'mia.lewis@gmail.com', 4, 'QA Engineer', 8, 'BR001', 'DEPT008', 'DEP0016'),
  ('Liam', 'Walker', 'Male', 'Married', '1996-12-25', 'liam.walker@gmail.com', 5, 'HR Manager', 9, 'BR001', 'DEPT009', 'DEP0017'),
  ('Avery', 'Hall', 'Female', 'Unmarried', '1993-02-14', 'avery.hall@gmail.com', 6, 'Accountant', 9, 'BR003', 'DEPT009', 'DEP0018'),
  ('Benjamin', 'Adams', 'Male', 'Married', '1992-04-27', 'benjamin.adams@gmail.com', 4, 'Software Engineer', 10, 'BR003', 'DEPT007', 'DEP0019'),
  ('Calsey', 'Mate', 'Female', 'Unmarried', '1994-07-30', 'calsey.mate@gmail.com', 2, 'HR Manager', 5, 'BR003', 'DEPT001', 'DEP0020');

-- Insert sample values into Contact_Number_Details table
INSERT INTO Contact_Number_Details (Employee_ID, Contact_Number)
VALUES
  ('EMP0001', '0712345678'),
  ('EMP0002', '0723456789'),
  ('EMP0003', '0734567890'),
  ('EMP0004', '0745678901'),
  ('HRM0005', '0756789012'),
  ('EMP0006', '0767890123'),
  ('EMP0006', '0778901234'),
  ('EMP0007', '0778901234'),
  ('EMP0008', '0789012345'),
  ('HRM0009', '0790123456'),
  ('HRM0009', '0801234567'),
  ('EMP0010', '0801234567'),
  ('EMP0011', '0812345678'),
  ('EMP0011', '0823456789'),
  ('EMP0012', '0823456789'),
  ('HRM0013', '0834567890'),
  ('EMP0014', '0845678901'),
  ('EMP0015', '0856789012'),
  ('EMP0016', '0867890123'),
  ('EMP0016', '0878901234'),
  ('HRM0017', '0878901234'),
  ('EMP0018', '0889012345'),
  ('EMP0019', '0890123456'),
  ('HRM0020', '0901234567'),
  ('HRM0020', '0748834592'); 

-- Insert sample values into Employee_Account table
INSERT INTO Employee_Account (User_ID, Employee_ID, Password, Profile_Picture)
VALUES
  ('john.doe', 'EMP0001', 'password123', 'profile_pic1.jpg'),
  ('jane.smith', 'EMP0002', 'secret456', 'profile_pic2.jpg'),
  ('michael.johnson', 'EMP0003', 'secure789', 'profile_pic3.jpg'),
  ('emily.davis', 'EMP0004', 'pass1234', 'profile_pic4.jpg'),
  ('david.wilson', 'HRM0005', 'mysecret789', 'profile_pic5.jpg'),
  ('sarah.anderson', 'EMP0006', 'toppassword', 'profile_pic6.jpg'),
  ('daniel.brown', 'EMP0007', 'mypassword123', 'profile_pic7.jpg'),
  ('olivia.lee', 'EMP0008', 'abc123', 'profile_pic8.jpg'),
  ('william.martinez', 'HRM0009', 'password456', 'profile_pic9.jpg'),
  ('sophia.garcia', 'EMP0010', 'p@ssw0rd', 'profile_pic10.jpg'),
  ('ethan.thomas', 'EMP0011', 'letmein123', 'profile_pic11.jpg'),
  ('ava.white', 'EMP0012', 'passwordabc', 'profile_pic12.jpg'),
  ('noah.harris', 'HRM0013', '1234pass', 'profile_pic13.jpg'),
  ('isabella.martin', 'EMP0014', 'testpass', 'profile_pic14.jpg'),
  ('james.clark', 'EMP0015', 'abcdefg123', 'profile_pic15.jpg'),
  ('mia.lewis', 'EMP0016', 'pass123', 'profile_pic16.jpg'),
  ('liam.walker', 'HRM0017', 'qwerty456', 'profile_pic17.jpg'),
  ('avery.hall', 'EMP0018', 'password987', 'profile_pic18.jpg'),
  ('benjamin.adams', 'EMP0019', 'passpass', 'profile_pic19.jpg'),
  ('calsey.mate', 'HRM0020', 'securepass123', 'profile_pic20.jpg');

-- Insert sample values into Supervisor table
INSERT INTO Supervisor (Supervisor_ID, Subordinate_ID)
VALUES
  ('EMP0001', 'EMP0002'),
  ('EMP0001', 'EMP0004'),
  ('EMP0003', 'EMP0006'),
  ('EMP0001', 'EMP0007'),
  ('EMP0003', 'EMP0010'),
  ('EMP0001', 'EMP0011'),
  ('EMP0008', 'EMP0012'),
  ('EMP0003', 'EMP0014'),
  ('EMP0001', 'EMP0015'),
  ('EMP0008', 'EMP0016'),
  ('EMP0003', 'EMP0018'),
  ('EMP0001', 'EMP0019');

-- Insert sample values into Custom_Attribute_Definition table
INSERT INTO Custom_Attribute_Definition (Attribute_Name)
VALUES
  ('Skills'),
  ('Languages'),
  ('Nationality');

-- Insert sample values into Employee_Custom_Attribute table
INSERT INTO Employee_Custom_Attribute (Attribute_ID, Employee_ID, Value)
VALUES
  (1, 'EMP0001', 'Leadership Skills'),
  (2, 'EMP0003', 'English, Sinhala, Tamil'),
  (3, 'EMP0008', 'Sri Lankan');

-- Insert sample values into Leave_Request table
INSERT INTO Leave_Request (Employee_ID, Start_Date, No_of_Days, Type, Status)
VALUES
  ('EMP0001', '2023-10-10', 5, 'Annual', 'Pending'),
  ('EMP0002', '2023-11-15', 3, 'Casual', 'Approved'),
  ('EMP0003', '2023-09-20', 2, 'Annual', 'Pending'),
  ('EMP0004', '2023-10-05', 7, 'Casual', 'Approved'),
  ('EMP0006', '2023-11-01', 1, 'Annual', 'Pending'),
  ('EMP0007', '2023-12-10', 4, 'Casual', 'Pending'),
  ('EMP0008', '2023-09-15', 30, 'Maternity', 'Approved'),
  ('EMP0010', '2023-11-20', 2, 'Annual', 'Pending');

-- Insert sample values into Employee_Leave_Count table

UPDATE `hrms`.`employee_leave_count` SET `Casual` = '3' WHERE (`Employee_ID` = 'EMP0002');
UPDATE `hrms`.`employee_leave_count` SET `Casual` = '7' WHERE (`Employee_ID` = 'EMP0004');
UPDATE `hrms`.`employee_leave_count` SET `Maternity_Leave` = '30' WHERE (`Employee_ID` = 'EMP0008');
