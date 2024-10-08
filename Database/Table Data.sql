USE HRMS;

-- Insert sample values into Organization table
INSERT INTO Organization (Name, Start_Date)
VALUES ('Jupiter Apparels', '2023-01-01');

-- Insert sample values into Branch table
INSERT INTO Branch (Branch_Name, Address_Line1, Address_Line2, Address_Line3, Country)
VALUES
  ('Colombo Central Branch', 'No. 123', 'Main Street', 'Colombo 3', 'Sri Lanka'),
  ('Colombo North Branch', 'No. 456', 'Elm Street', 'Colombo', 'Sri Lanka'),
  ('Kandy Downtown Branch', 'No. 789', 'Oak Avenue', 'Kandy', 'Sri Lanka'),
  ('Galle Coastal Branch', 'No. 123', 'Palm Road', 'Galle', 'Sri Lanka'),
  ('Jaffna Northern Branch', 'No. 456', 'Coconut Lane', 'Jaffna', 'Sri Lanka'),
  ('Negombo Seaside Branch', 'No. 789', 'Banana Street', 'Negombo', 'Sri Lanka'),
  ('Dhaka Central Branch', 'No. 123', 'Elm Street', 'Dhaka', 'Bangladesh'),
  ('Chittagong Coastal Branch', 'No. 456', 'Oak Avenue', 'Chittagong', 'Bangladesh'),
  ('Islamabad Capital Branch', 'No. 123', 'Cedar Lane', 'Islamabad', 'Pakistan'),
  ('Lahore Cultural Branch', 'No. 456', 'Pine Street', 'Lahore', 'Pakistan');

-- Insert sample values into Department table
INSERT INTO Department (Dept_Name, Budget)
VALUES
  ('Human Resources', 100000.00),
  ('Finance', 150000.00),
  ('Engineering', 190000.00),
  ('Accounting', 120000.00);

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
  ('Level 1', 50000.00),
  ('Level 2', 45000.00),
  ('Level 3', 40000.00),
  ('Level 4', 35000.00),
  ('Level 5', 30000.00),
  ('Level 6', 25000.00),
  ('Level 7', 20000.00),
  ('Level 8', 15000.00),
  ('Level 9', 12000.00),
  ('Level 10', 10000.00);

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
  ('Mia', 'White', 18, 'Child', 'Female'),
  ('James', 'Smith', 13, 'Child', 'Male'),
  ('Charlotte', 'Johnson', 24, 'Child', 'Female'),
  ('Benjamin', 'Harris', 9, 'Child', 'Male'),
  ('Amelia', 'Wilson', 11, 'Child', 'Female'),
  ('Lucas', 'Davis', 17, 'Child', 'Male'),
  ('Lily', 'Garcia', 15, 'Child', 'Female'),
  ('Michael', 'Brown', 8, 'Child', 'Male'),
  ('Harper', 'Martinez', 19, 'Child', 'Female'),
  ('Ethan', 'Jones', 12, 'Child', 'Male'),
  ('Avery', 'Robinson', 7, 'Child', 'Female'),
  ('Mason', 'Miller', 16, 'Child', 'Male'),
  ('Ella', 'Thompson', 25, 'Child', 'Female'),
  ('Logan', 'Scott', 14, 'Child', 'Male'),
  ('Aria', 'Young', 20, 'Child', 'Female'),
  ('Carter', 'Clark', 9, 'Child', 'Male');

-- Insert sample values into Employee_Data table
INSERT INTO Employee_Data (First_Name, Last_Name, Gender, Marital_Status, Birthday, Email, Employment_Status, Job_Title, Pay_Grade_ID, Branch_ID, Dept_ID, Dependent_ID)
VALUES
  ('John', 'Doe', 'Male', 'Married', '1990-05-15', 'john.doe@gmail.com', 1, 'HR Manager', 1, 'BR001', 'DEPT001', 'DEP0001'),
  ('Jane', 'Smith', 'Female', 'Unmarried', '1988-08-21', 'jane.smith@gmail.com', 2, 'Software Engineer', 2, 'BR002', 'DEPT002', 'DEP0002'),
  ('Michael', 'Johnson', 'Male', 'Married', '1995-03-10', 'michael.johnson@gmail.com', 1, 'Accountant', 2, 'BR002', 'DEPT002', 'DEP0003'),
  ('Emily', 'Davis', 'Female', 'Unmarried', '1992-11-25', 'emily.davis@gmail.com', 1, 'QA Engineer', 2, 'BR004', 'DEPT001', 'DEP0004'),
  ('Robert', 'Wright', 'Male', 'Married', '1993-07-18', 'robert.wright@gmail.com', 6, 'Software Engineer', 7, 'BR004', 'DEPT001', NULL),
  ('David', 'Wilson', 'Male', 'Married', '1987-09-28', 'david.wilson@gmail.com', 3, 'HR Manager', 1, 'BR009', 'DEPT003', 'DEP0005'),
  ('Sarah', 'Anderson', 'Female', 'Unmarried', '1993-12-07', 'sarah.anderson@gmail.com', 3, 'Accountant', 3, 'BR010', 'DEPT003', 'DEP0006'),
  ('Daniel', 'Brown', 'Male', 'Married', '1995-07-14', 'daniel.brown@gmail.com', 4, 'Software Engineer', 4, 'BR001', 'DEPT004', 'DEP0007'),
  ('Olivia', 'Lee', 'Female', 'Married', '1998-02-18', 'olivia.lee@gmail.com', 4, 'QA Engineer', 4, 'BR008', 'DEPT004', 'DEP0008'),
  ('Henry', 'Hall', 'Male', 'Married', '1994-02-14', 'henry.hall@gmail.com', 4, 'Software Engineer', 4, 'BR006', 'DEPT002',NULL),
  ('William', 'Martinez', 'Male', 'Married', '1994-04-03', 'william.martinez@gmail.com', 5, 'QA Engineer', 6, 'BR002', 'DEPT003', 'DEP0009'),
  ('Sophia', 'Garcia', 'Female', 'Unmarried', '1996-06-20', NULL, 5, 'Accountant', 5, 'BR006', 'DEPT002', 'DEP0010'),
  ('Benjamin', 'Cooper', 'Male', 'Married', '1994-06-22', 'benjamin.cooper@gmail.com', 1, 'Software Engineer', 7, 'BR009', 'DEPT001', NULL),
  ('Ethan', 'Thomas', 'Male', 'Married', '1999-01-12', 'ethan.thomas@gmail.com', 6, 'Software Engineer', 6, 'BR007', 'DEPT001', 'DEP0011'),
  ('Ava', 'White', 'Female', 'Married', '1991-04-05', 'ava.white@gmail.com', 6, 'QA Engineer', 6, 'BR008', 'DEPT003', 'DEP0012'),
  ('Aces', 'Maxwell', 'Male', 'Married', '1995-02-03', 'aces.maxwell@gmail.com', 3, 'Accountant', 9, 'BR003', 'DEPT002', NULL),
  ('Noah', 'Harris', 'Male', 'Married', '1997-08-09', 'noah.harris@gmail.com', 1, 'HR Manager', 1, 'BR002', 'DEPT002', 'DEP0013'),
  ('Isabella', 'Martin', 'Female', 'Unmarried', '1990-03-17', 'isabella.martin@gmail.com', 2, 'Accountant', 7, 'BR001', 'DEPT001', 'DEP0014'),
  ('James', 'Clark', 'Male', 'Married', '1985-06-30', 'james.clark@gmail.com', 3, 'Software Engineer', 8, 'BR006', 'DEPT001', 'DEP0015'),
  ('Mia', 'Lewis', 'Female', 'Unmarried', '1989-10-11', 'mia.lewis@gmail.com', 4, 'QA Engineer', 8, 'BR005', 'DEPT002', 'DEP0016'),
  ('Liam', 'Walker', 'Male', 'Married', '1996-12-25', NULL, 5, 'HR Manager', 1, 'BR001', 'DEPT001', 'DEP0017'),
  ('Alexander', 'Brown', 'Male', 'Married', '1988-11-11', 'alexander.brown@gmail.com', 1, 'Software Engineer', 9, 'BR001', 'DEPT003', NULL),
  ('Nora', 'Garcia', 'Female', 'Unmarried', '1990-05-05', 'nora.garcia@gmail.com', 2, 'QA Engineer', 10, 'BR001', 'DEPT003', NULL),
  ('Avery', 'Hall', 'Female', 'Unmarried', '1993-02-14', 'avery.hall@gmail.com', 6, 'Accountant', 9, 'BR003', 'DEPT003', 'DEP0018'),
  ('Benjamin', 'Adams', 'Male', 'Married', '1992-04-27', 'benjamin.adams@gmail.com', 4, 'Software Engineer', 10, 'BR002', 'DEPT002', 'DEP0019'),
  ('Calsey', 'Mate', 'Female', 'Unmarried', '1994-07-30', 'calsey.mate@gmail.com', 2, 'HR Manager', 1, 'BR004', 'DEPT001', 'DEP0020'),
  ('Marcony', 'Prera', 'Female', 'Unmarried', '1997-11-30', 'marcony.prera@gmail.com', 5, 'QA Engineer', 10, 'BR001', 'DEPT003', NULL),
  ('Lillian', 'Perez', 'Female', 'Unmarried', '1996-04-30', 'lillian.perez@gmail.com', 5, 'QA Engineer', 7, 'BR005', 'DEPT001', 'DEP0021'),
  ('Ella', 'Sing', 'Female', 'Unmarried', '1991-09-25', 'ella.sing@gmail.com', 1, 'Accountant', 10, 'BR001', 'DEPT002', 'DEP0022'),
  ('Alexander', 'Black', 'Male', 'Married', '1988-11-11', 'alexander.black@gmail.com', 1, 'Software Engineer', 9, 'BR010', 'DEPT003', 'DEP0023'),
  ('Mason', 'Taylor', 'Male', 'Married', '1997-03-19', 'mason.taylor@gmail.com', 3, 'QA Engineer', 3, 'BR002', 'DEPT004', NULL),
  ('Nora', 'Garcie', 'Female', 'Unmarried', '1990-05-05', 'nora.garcia@gmail.com', 2, 'QA Engineer', 10, 'BR003', 'DEPT003', 'DEP0024'),
  ('Mason', 'Taylar', 'Male', 'Married', '1997-03-19', 'mason.taylar@gmail.com', 3, 'Accountant', 4, 'BR010', 'DEPT004', 'DEP0025'),
  ('Grace', 'Barnes', 'Female', 'Unmarried', '1997-11-30', 'grace.barnes@gmail.com', 5, 'QA Engineer', 10, 'BR001', 'DEPT003', NULL),
  ('Chloe', 'Hernandez', 'Female', 'Unmarried', '1995-08-07', 'chloe.hernandez@gmail.com', 4, 'Accountant', 8, 'BR007', 'DEPT004', 'DEP0026'),
  ('Samuel', 'Reed', 'Male', 'Married', '1992-01-23', 'samuel.reed@gmail.com', 5, 'Software Engineer', 7, 'BR008', 'DEPT004', 'DEP0027'),
  ('Lily', 'Ramirez', 'Female', 'Unmarried', '1987-12-14', 'lily.ramirez@gmail.com', 6, 'QA Engineer', 7, 'BR002', 'DEPT003', 'DEP0028'),
  ('Oliver', 'Parker', 'Male', 'Married', '1996-09-15', 'oliver.parker@gmail.com', 4, 'Software Engineer', 9, 'BR001', 'DEPT003', NULL),
  ('Sophie', 'Turner', 'Female', 'Unmarried', '1998-04-17', 'sophie.turner@gmail.com', 2, 'QA Engineer', 7, 'BR003', 'DEPT001', NULL),
  ('Daniel', 'Cook', 'Male', 'Married', '1989-06-08', NULL, 1, 'Accountant', 5, 'BR003', 'DEPT004', 'DEP0029'),
  ('Sophia', 'Smith', 'Female', 'Unmarried', '1993-10-02', 'sophia.smith@gmail.com', 2, 'Accountant', 9, 'BR002', 'DEPT003', 'DEP0030'),
  ('Joseph', 'Baker', 'Male', 'Married', '1996-05-30', 'joseph.baker@gmail.com', 1, 'Software Engineer', 10, 'BR001', 'DEPT003', 'DEP0031'),
  ('William', 'Powell', 'Male', 'Married', '1993-03-24', 'william.powell@gmail.com', 6, 'Accountant', 6, 'BR005', 'DEPT004', NULL),
  ('Aubrey', 'Parker', 'Female', 'Unmarried', '1998-09-12', 'aubrey.parker@gmail.com', 2, 'QA Engineer', 10, 'BR002', 'DEPT003', 'DEP0032'),
  ('Robert', 'Delt', 'Male', 'Married', '1993-07-18', NULL, 6, 'Software Engineer', 7, 'BR001', 'DEPT001', 'DEP0033'),
  ('Henry', 'Mitchell', 'Male', 'Married', '1995-02-03', 'henry.mitchell@gmail.com', 3, 'Accountant', 9, 'BR003', 'DEPT002', NULL),
  ('Lillian', 'Pere', 'Female', 'Unmarried', '1996-04-30', 'lillian.perez@gmail.com', 5, 'QA Engineer', 7, 'BR002', 'DEPT001', 'DEP0034'),
  ('Ella', 'King', 'Female', 'Unmarried', '1991-09-25', 'ella.king@gmail.com', 5, 'Accountant', 9, 'BR003', 'DEPT002', 'DEP0035'),
  ('gugliElmo', 'Piter', 'Male', 'Married', '1996-09-15', 'gugliElmo.piter@gmail.com', 4, 'Software Engineer', 9, 'BR002', 'DEPT003', NULL),
  ('Wilson', 'Karu', 'Male', 'Married', '1993-03-24', 'wilson.karu@gmail.com', 6, 'Accountant', 8, 'BR002', 'DEPT004', NULL);

-- Insert sample values into Contact_Number_Details table
INSERT INTO Contact_Number_Details (Employee_ID, Contact_Number)
VALUES
  ('HRM0001', '0712345678'),
  ('EMP0002', '0723456789'),
  ('EMP0003', '0734567890'),
  ('EMP0004', '0745678901'),
  ('EMP0005', '0756789012'),
  ('HRM0006', '0767890123'),
  ('HRM0006', '0778901234'),
  ('EMP0007', '0778901234'),
  ('EMP0008', '0789012345'),
  ('EMP0009', '0790123456'),
  ('EMP0009', '0801234567'),
  ('EMP0010', '0801234567'),
  ('EMP0011', '0812345678'),
  ('EMP0011', '0823456789'),
  ('EMP0012', '0823456789'),
  ('EMP0013', '0834567890'),
  ('EMP0014', '0845678901'),
  ('EMP0015', '0856789012'),
  ('EMP0016', '0867890123'),
  ('EMP0016', '0878901234'),
  ('HRM0017', '0878901234'),
  ('EMP0018', '0889012345'),
  ('EMP0019', '0890123456'),
  ('EMP0020', '0901234567'),
  ('EMP0020', '0748834592'), 
  ('HRM0021', '0712345378'),
  ('EMP0022', '0723456789'),
  ('EMP0023', '0734267890'),
  ('EMP0024', '0745666901'),
  ('EMP0025', '0756789012'),
  ('HRM0026', '0767891123'),
  ('EMP0027', '0778901255'),
  ('EMP0028', '0708901234'),
  ('EMP0028', '0773909204'),
  ('EMP0029', '0789019945'),
  ('EMP0030', '0790123456'),
  ('EMP0031', '0801234567'),
  ('EMP0032', '0901234567'),
  ('EMP0033', '0332345678'),
  ('EMP0034', '0353456789'),
  ('EMP0035', '0913456789'),
  ('EMP0036', '0834567890'),
  ('EMP0037', '0845678901'),
  ('EMP0038', '0856789012'),
  ('EMP0039', '0867890773'),
  ('EMP0040', '0878901255'),
  ('EMP0041', '0878902234'),
  ('EMP0042', '0889112345'),
  ('EMP0043', '0890883456'),
  ('EMP0044', '0909994567'),
  ('EMP0045', '0748834592'), 
  ('EMP0045', '0748831136'),
  ('EMP0046', '0108901234'),
  ('EMP0047', '0118901234'),
  ('EMP0048', '0119012345'),
  ('EMP0049', '0990123456'),
  ('EMP0050', '0911234567');
 
-- Insert sample values into Employee_Account table
INSERT INTO Employee_Account (User_ID, Employee_ID, Password, Profile_Picture)
VALUES
  ('john.doe', 'HRM0001', '$2a$12$3vKi3BJLp6mT8PElgzNguOHZ', 'https://drive.google.com/images/random_image_1.jpg'),
  ('jane.smith', 'EMP0002', '$2a$12$4UBnZyo.5zTgSMIwUW9Mz', 'https://drive.google.com/images/random_image_2.jpg'),
  ('michael.johnson', 'EMP0003', '$2a$12$AEMK1SokwY7E3eLmFE', 'https://drive.google.com/images/random_image_3.jpg'),
  ('emily.davis', 'EMP0004', '$2a$12$t8HfC3DltX2DCajY6Tal1', 'https://drive.google.com/images/random_image_4.jpg'),
  ('robert.wright', 'EMP0005', '$2a$12$EgTkyg5O0oLqQ1ArPSyE82', 'https://drive.google.com/images/random_image_5.jpg'),
  ('david.wilson', 'HRM0006', '$2a$12$YKuBzyMbE8bHzdBnOxjUe8', 'https://drive.google.com/images/random_image_6.jpg'),
  ('sarah.anderson', 'EMP0007', '$2a$12$eNzH4fzjVU0wZjvdx21kDu', 'https://drive.google.com/images/random_image_7.jpg'),
  ('daniel.brown', 'EMP0008', '$2a$12$V9aLGBF3wBPN0pLtRtzwKu', 'https://drive.google.com/images/random_image_8.jpg'),
  ('olivia.lee', 'EMP0009', '$2a$12$Yn2eJ9F2DBHzqCX6HBSwKu', 'https://drive.google.com/images/random_image_9.jpg'),
  ('henry.hall', 'EMP0010', '$2a$12$GkfA4EGm07M2haDy3BSzMe', 'https://drive.google.com/images/random_image_10.jpg'),
  ('william.martinez', 'EMP0011', '$2a$12$VaK3aLBCN3K2coLsRzvwKu', 'https://drive.google.com/images/random_image_11.jpg'),
  ('sophia.garcia', 'EMP0012', '$2a$12$TYDGBVW5P0W2uLmRvKzwKu', 'https://drive.google.com/images/random_image_12.jpg'),
  ('benjamin.cooper', 'EMP0013', '$2a$12$eMzHBjwVW8f2Ib3XzjvwKu', 'https://drive.google.com/images/random_image_13.jpg'),
  ('ethan.thomas', 'EMP0014', '$2a$12$XCbZBCG8P0K28OJGBHJwKu', 'https://drive.google.com/images/random_image_14.jpg'),
  ('ava.white', 'EMP0015', '$2a$12$RDzBQjV1k2w2T0BCUvQwKu', 'https://drive.google.com/images/random_image_15.jpg'),
  ('aces.maxwell', 'EMP0016', '$2a$12$cNZBBT6lP3f2SnXGDvQwKu', 'https://drive.google.com/images/random_image_16.jpg'),
  ('noah.harris', 'HRM0017', '$2a$12$DhVGBZk8k2W2ZxUWuUwKu', 'https://drive.google.com/images/random_image_17.jpg'),
  ('isabella.martin', 'EMP0018', '$2a$12$EeZHBZlVp2W2vGmVJQxwKu', 'https://drive.google.com/images/random_image_18.jpg'),
  ('james.clark', 'EMP0019', '$2a$12$X5WzBlwP0Wf2BzEwh0wKu', 'https://drive.google.com/images/random_image_19.jpg'),
  ('mia.lewis', 'EMP0020', '$2a$12$WRWxBiWBP0W2R0mBwzwKu', 'https://drive.google.com/images/random_image_20.jpg'),
  ('liam.walker', 'HRM0021', '$2a$12$EeZHBZlVp2W2vGmVJQxwKu', 'https://drive.google.com/images/random_image_21.jpg'),
  ('alexander.brown', 'EMP0022', '$2a$12$4UBnZyo.5zTgSMIwUW9Mz', 'https://drive.google.com/images/random_image_22.jpg'),
  ('nora.garcia', 'EMP0023', '$2a$12$4UBnZyo.5zTgSMIwUW9Mz', 'https://drive.google.com/images/random_image_23.jpg'),
  ('avery.hall', 'EMP0024', '$2a$12$AEMK1SokwY7E3eLmFE', 'https://drive.google.com/images/random_image_24.jpg'),
  ('benjamin.adams', 'EMP0025', '$2a$12$AEMK1SokwY7E3eLmFE', 'https://drive.google.com/images/random_image_25.jpg'),
  ('calsey.mate', 'HRM0026', '$2a$12$AEMK1SokwY7E3eLmFE', 'https://drive.google.com/images/random_image_26.jpg'),
  ('marcony.prera', 'EMP0027', '$2a$12$AEMK1SokwY7E3eLmFE', 'https://drive.google.com/images/random_image_27.jpg'),
  ('lillian.perez', 'EMP0028', '$2a$12$AEMK1SokwY7E3eLmFE', 'https://drive.google.com/images/random_image_28.jpg'),
  ('ella.sing', 'EMP0029', '$2a$12$AEMK1SokwY7E3eLmFE', 'https://drive.google.com/images/random_image_29.jpg'),
  ('alexander.black', 'EMP0030', '$2a$12$AEMK1SokwY7E3eLmFE', 'https://drive.google.com/images/random_image_30.jpg'),
  ('mason.taylor', 'EMP0031', '$2a$12$AEMK1SokwY7E3eLmFE', 'https://drive.google.com/images/random_image_31.jpg'),
  ('nora.garcie', 'EMP0032', '$2a$12$AEMK1SokwY7E3eLmFE', 'https://drive.google.com/images/random_image_32.jpg'),
  ('mason.taylar', 'EMP0033', '$2a$12$AEMK1SokwY7E3eLmFE', 'https://drive.google.com/images/random_image_33.jpg'),
  ('grace.barnes', 'EMP0034', '$2a$12$AEMK1SokwY7E3eLmFE', 'https://drive.google.com/images/random_image_34.jpg'),
  ('chloe.hernandez', 'EMP0035', '$2a$12$AEMK1SokwY7E3eLmFE', 'https://drive.google.com/images/random_image_35.jpg'),
  ('samuel.reed', 'EMP0036', '$2a$12$AEMK1SokwY7E3eLmFE', 'https://drive.google.com/images/random_image_36.jpg'),
  ('lily.ramirez', 'EMP0037', '$2a$12$AEMK1SokwY7E3eLmFE', 'https://drive.google.com/images/random_image_37.jpg'),
  ('oliver.parker', 'EMP0038', '$2a$12$AEMK1SokwY7l3eLmFE', 'https://drive.google.com/images/random_image_38.jpg'),
  ('sophie.turner', 'EMP0039', '$2a$12$AEMK1SokwY7l3eLmFE', 'https://drive.google.com/images/random_image_39.jpg'),
  ('daniel.cook', 'EMP0040', '$2a$12$AEMK1SokwY7l3eLmFE', 'https://drive.google.com/images/random_image_40.jpg'),
  ('sophia.smith', 'EMP0041', '$2a$12$AEMK1SokwY7l3eLmFE', 'https://drive.google.com/images/random_image_41.jpg'),
  ('joseph.baker', 'EMP0042', '$2a$12$AEMK1SokwY7l3eLmFE', 'https://drive.google.com/images/random_image_42.jpg'),
  ('william.powell', 'EMP0043', '$2a$12$AEMK1SokwY7l3eLmFE', 'https://drive.google.com/images/random_image_43.jpg'),
  ('aubrey.parker', 'EMP0044', '$2a$12$AEMK1SokwY7l3eLmFE', 'https://drive.google.com/images/random_image_44.jpg'),
  ('robert.delt', 'EMP0045', '$2a$12$AEMK1SokwY7l3eLmFE', 'https://drive.google.com/images/random_image_45.jpg'),
  ('henry.mitchell', 'EMP0046', '$2a$12$AEMK1SokwY7l3eLmFE', 'https://drive.google.com/images/random_image_46.jpg'),
  ('lillian.pere', 'EMP0047', '$2a$12$AEMK1SokwY7l3eLmFE', 'https://drive.google.com/images/random_image_47.jpg'),
  ('ella.king', 'EMP0048', '$2a$12$AEMK1SokwY7l3eLmFE', 'https://drive.google.com/images/random_image_48.jpg'),
  ('gugliElmo.piter', 'EMP0049', '$2a$12$AEMK1SokwY7l3eLmFE', 'https://drive.google.com/images/random_image_49.jpg'),
  ('wilson.karu', 'EMP0050', '$2a$12$AEMK1SokwY7l3eLmFE', 'https://drive.google.com/images/random_image_50.jpg');

-- Insert sample values into Supervisor table
INSERT INTO Supervisor (Supervisor_ID, Subordinate_ID)
VALUES
  ('EMP0002', 'EMP0005'),
  ('EMP0003', 'EMP0007'),
  ('EMP0002', 'EMP0008'),
  ('EMP0004', 'EMP0009'),
  ('EMP0002', 'EMP0010'),
  ('EMP0004', 'EMP0011'),
  ('EMP0003', 'EMP0012'),
  ('EMP0002', 'EMP0013'),
  ('EMP0002', 'EMP0014'),
  ('EMP0004', 'EMP0015'),
  ('EMP0003', 'EMP0016'),
  ('EMP0003', 'EMP0018'),
  ('EMP0002', 'EMP0019'),
  ('EMP0004', 'EMP0020'),
  ('EMP0002', 'EMP0022'),
  ('EMP0004', 'EMP0023'),
  ('EMP0003', 'EMP0024'),
  ('EMP0002', 'EMP0025'),
  ('EMP0004', 'EMP0027'),
  ('EMP0004', 'EMP0028'),
  ('EMP0003', 'EMP0029'),
  ('EMP0002', 'EMP0030'),
  ('EMP0004', 'EMP0031'),
  ('EMP0004', 'EMP0032'),
  ('EMP0003', 'EMP0033'),
  ('EMP0004', 'EMP0034'),
  ('EMP0003', 'EMP0035'),
  ('EMP0002', 'EMP0036'),
  ('EMP0004', 'EMP0037'),
  ('EMP0002', 'EMP0038'),
  ('EMP0004', 'EMP0039'),
  ('EMP0003', 'EMP0040'),
  ('EMP0003', 'EMP0041'),
  ('EMP0002', 'EMP0042'),
  ('EMP0003', 'EMP0043'),
  ('EMP0004', 'EMP0044'),
  ('EMP0002', 'EMP0045'),
  ('EMP0003', 'EMP0046'),
  ('EMP0004', 'EMP0047'),
  ('EMP0003', 'EMP0048'),
  ('EMP0002', 'EMP0049'),
  ('EMP0003', 'EMP0050');

-- Insert sample values into Custom_Attribute_Definition table
INSERT INTO Custom_Attribute_Definition (Attribute_Name)
VALUES
  ('Skills'),
  ('Languages'),
  ('Nationality');

-- Insert sample values into Employee_Custom_Attribute table
INSERT INTO Employee_Custom_Attribute (Attribute_ID, Employee_ID, Value)
VALUES
  (1, 'EMP0030', 'Leadership Skills'),
  (2, 'EMP0018', 'English, Sinhala, Tamil'),
  (3, 'EMP0008', 'Sri Lankan');

-- Insert sample values into Leave_Request table
INSERT INTO Leave_Request (Employee_ID, Start_Date, No_of_Days, Type, Status)
VALUES
  ('EMP0023', '2023-10-10', 5, 'Annual', 'Pending'),
  ('EMP0024', '2023-11-15', 3, 'Casual', 'Approved'),
  ('EMP0047', '2023-09-20', 2, 'Annual', 'Pending'),
  ('EMP0015', '2023-09-28', 2, 'Annual', 'Approved'),
  ('EMP0031', '2023-10-05', 7, 'Casual', 'Approved'),
  ('EMP0018', '2023-11-01', 1, 'Annual', 'Pending'),
  ('EMP0008', '2023-11-16', 5, 'Annual', 'Pending'),
  ('EMP0007', '2023-12-10', 4, 'Casual', 'Pending'),
  ('EMP0009', '2023-09-15', 30, 'Maternity', 'Approved'),
  ('EMP0010', '2023-11-20', 2, 'Annual', 'Pending'),
  ('EMP0012', '2023-11-25', 40, 'Maternity','Pending'),
  ('EMP0033', '2023-11-10', 2, 'Casual', 'Pending'),
  ('EMP0035', '2023-11-01', 3, 'Annual', 'Pending'),
  ('EMP0040', '2023-11-15', 2, 'Casual', 'Pending');

-- Update sample values in the Employee_Leave_Count table
UPDATE `employee_leave_count` SET `Casual` = '3' WHERE (`Employee_ID` = 'EMP0024');
UPDATE `employee_leave_count` SET `Casual` = '7' WHERE (`Employee_ID` = 'EMP0031');
UPDATE `employee_leave_count` SET `Maternity_Leave` = '30' WHERE (`Employee_ID` = 'EMP0009');
UPDATE `employee_leave_count` SET `Annual` = '2' WHERE (`Employee_ID` = 'EMP0015');
