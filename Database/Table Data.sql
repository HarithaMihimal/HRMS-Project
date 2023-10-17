
-- Insert sample values into Organization table
INSERT INTO Organization (Name, Start_Date)
VALUES ('Jupiter Apparels', '2023-10-07');

-- Insert sample values into Branch table
INSERT INTO Branch (Branch_Name, Address, Country)
VALUES
  ('Colombo Central Branch', '123 Main Street, Colombo 3.', 'Sri Lanka'),
  ('Colombo North Branch', '456 Elm Street, Colombo.', 'Sri Lanka'),
  ('Kandy Downtown Branch', '789 Oak Avenue, Kandy.', 'Sri Lanka'),
  ('Galle Coastal Branch', '123 Palm Road, Galle.', 'Sri Lanka'),
  ('Jaffna Northern Branch', '456 Coconut Lane, Jaffna.', 'Sri Lanka'),
  ('Negombo Seaside Branch', '789 Banana Street, Negombo.', 'Sri Lanka'),
  ('Dhaka Central Branch', '123 Elm Street, Dhaka.', 'Bangladesh'),
  ('Chittagong Coastal Branch', '456 Oak Avenue, Chittagong.', 'Bangladesh'),
  ('Islamabad Capital Branch', '123 Cedar Lane, Islamabad.', 'Pakistan'),
  ('Lahore Cultural Branch', '456 Pine Street, Lahore.', 'Pakistan');

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
  ('Jane', 'Smith', 'Female', 'Unmarried', '1988-08-21', 'jane.smith@gmail.com', 2, 'Software Engineer', 2, 'BR001', 'DEPT002', 'DEP0002'),
  ('Michael', 'Johnson', 'Male', 'Married', '1995-03-10', 'michael.johnson@gmail.com', 1, 'Accountant', 2, 'BR002', 'DEPT002', 'DEP0003'),
  ('Emily', 'Davis', 'Female', 'Unmarried', '1992-11-25', 'emily.davis@gmail.com', 1, 'QA Engineer', 1, 'BR001', 'DEPT001', 'DEP0004'),
  ('David', 'Wilson', 'Male', 'Married', '1987-09-28', 'david.wilson@gmail.com', 3, 'HR Manager', 3, 'BR003', 'DEPT003', 'DEP0005'),
  ('Sarah', 'Anderson', 'Female', 'Unmarried', '1993-12-07', 'sarah.anderson@gmail.com', 3, 'Accountant', 3, 'BR001', 'DEPT003', 'DEP0006'),
  ('Daniel', 'Brown', 'Male', 'Married', '1995-07-14', 'daniel.brown@gmail.com', 4, 'Software Engineer', 4, 'BR001', 'DEPT004', 'DEP0007'),
  ('Olivia', 'Lee', 'Female', 'Married', '1998-02-18', 'olivia.lee@gmail.com', 4, 'QA Engineer', 4, 'BR001', 'DEPT004', 'DEP0008'),
  ('William', 'Martinez', 'Male', 'Married', '1994-04-03', 'william.martinez@gmail.com', 5, 'HR Manager', 5, 'BR001', 'DEPT003', 'DEP0009'),
  ('Sophia', 'Garcia', 'Female', 'Unmarried', '1996-06-20', 'sophia.garcia@gmail.com', 5, 'Accountant', 5, 'BR001', 'DEPT002', 'DEP0010'),
   ('Ethan', 'Thomas', 'Male', 'Married', '1999-01-12', 'ethan.thomas@gmail.com', 6, 'Software Engineer', 6, 'BR002', 'DEPT001', 'DEP0011'),
   ('Ava', 'White', 'Female', 'Married', '1991-04-05', 'ava.white@gmail.com', 6, 'QA Engineer', 6, 'BR002', 'DEPT003', 'DEP0012'),
   ('Noah', 'Harris', 'Male', 'Married', '1997-08-09', 'noah.harris@gmail.com', 1, 'HR Manager', 7, 'BR001', 'DEPT002', 'DEP0013'),
   ('Isabella', 'Martin', 'Female', 'Unmarried', '1990-03-17', 'isabella.martin@gmail.com', 2, 'Accountant', 7, 'BR001', 'DEPT001', 'DEP0014'),
   ('James', 'Clark', 'Male', 'Married', '1985-06-30', 'james.clark@gmail.com', 3, 'Software Engineer', 8, 'BR001', 'DEPT001', 'DEP0015'),
   ('Mia', 'Lewis', 'Female', 'Unmarried', '1989-10-11', 'mia.lewis@gmail.com', 4, 'QA Engineer', 8, 'BR001', 'DEPT002', 'DEP0016'),
   ('Liam', 'Walker', 'Male', 'Married', '1996-12-25', 'liam.walker@gmail.com', 5, 'HR Manager', 9, 'BR001', 'DEPT001', 'DEP0017'),
   ('Avery', 'Hall', 'Female', 'Unmarried', '1993-02-14', 'avery.hall@gmail.com', 6, 'Accountant', 9, 'BR003', 'DEPT003', 'DEP0018'),
   ('Benjamin', 'Adams', 'Male', 'Married', '1992-04-27', 'benjamin.adams@gmail.com', 4, 'Software Engineer', 10, 'BR003', 'DEPT002', 'DEP0019'),
   ('Calsey', 'Mate', 'Female', 'Unmarried', '1994-07-30', 'calsey.mate@gmail.com', 2, 'HR Manager', 5, 'BR003', 'DEPT001', 'DEP0020'),
   ('Robert', 'Wright', 'Male', 'Married', '1993-07-18', 'robert.wright@gmail.com', 6, 'Software Engineer', 7, 'BR002', 'DEPT001', NULL),
   ('Lillian', 'Perez', 'Female', 'Unmarried', '1996-04-30', 'lillian.perez@gmail.com', 5, 'QA Engineer', 7, 'BR002', 'DEPT001', NULL),
   ('Henry', 'Hall', 'Male', 'Married', '1994-02-14', 'henry.hall@gmail.com', 4, 'HR Manager', 9, 'BR003', 'DEPT002',NULL),
   ('Ella', 'King', 'Female', 'Unmarried', '1991-09-25', 'ella.king@gmail.com',1, 'Accountant', 10, 'BR003', 'DEPT002', NULL),
   ('Alexander', 'Brown', 'Male', 'Married', '1988-11-11', 'alexander.brown@gmail.com', 1, 'Software Engineer', 9, 'BR003', 'DEPT003', NULL),
   ('Nora', 'Garcia', 'Female', 'Unmarried', '1990-05-05', 'nora.garcia@gmail.com', 2, 'QA Engineer', 10, 'BR003', 'DEPT003', NULL),
   ('Mason', 'Taylor', 'Male', 'Married', '1997-03-19', 'mason.taylor@gmail.com', 3, 'HR Manager', 8, 'BR001', 'DEPT004', NULL),
   ('Chloe', 'Hernandez', 'Female', 'Unmarried', '1995-08-07', 'chloe.hernandez@gmail.com', 4, 'Accountant', 8, 'BR001', 'DEPT004', NULL),
   ('Samuel', 'Reed', 'Male', 'Married', '1992-01-23', 'samuel.reed@gmail.com', 5, 'Software Engineer', 7, 'BR001', 'DEPT004',NULL),
   ('Lily', 'Ramirez', 'Female', 'Unmarried', '1987-12-14', 'lily.ramirez@gmail.com', 6, 'QA Engineer', 7, 'BR001', 'DEPT003', NULL),
   ('Daniel', 'Cook', 'Male', 'Married', '1989-06-08', 'daniel.cook@gmail.com', 1, 'HR Manager', 9, 'BR003', 'DEPT004', NULL),
   ('Sophia', 'Smith', 'Female', 'Unmarried', '1993-10-02', 'sophia.smith@gmail.com', 2, 'Accountant', 9, 'BR003', 'DEPT003', NULL),
   ('Joseph', 'Baker', 'Male', 'Married', '1996-05-30', 'joseph.baker@gmail.com', 1, 'Software Engineer', 10, 'BR003', 'DEPT003', NULL),
   ('Aubrey', 'Parker', 'Female', 'Unmarried', '1998-09-12', 'aubrey.parker@gmail.com', 2, 'QA Engineer', 10, 'BR003', 'DEPT003', NULL),
   ('Robert', 'Wright', 'Male', 'Married', '1993-07-18', 'robert.wright@gmail.com', 6, 'Software Engineer', 7, 'BR002', 'DEPT001', NULL),
   ('Lillian', 'Perez', 'Female', 'Unmarried', '1996-04-30', 'lillian.perez@gmail.com', 5, 'QA Engineer', 7, 'BR002', 'DEPT001', NULL),
   ('Ella', 'King', 'Female', 'Unmarried', '1991-09-25', 'ella.king@gmail.com', 5, 'Accountant', 9, 'BR003', 'DEPT002', NULL),
   ('Alexander', 'Brown', 'Male', 'Married', '1988-11-11', 'alexander.brown@gmail.com', 1, 'Software Engineer', 9, 'BR003', 'DEPT003', NULL),
   ('Nora', 'Garcia', 'Female', 'Unmarried', '1990-05-05', 'nora.garcia@gmail.com', 2, 'QA Engineer', 10, 'BR003', 'DEPT003', NULL),
   ('Mason', 'Taylor', 'Male', 'Married', '1997-03-19', 'mason.taylor@gmail.com', 3, 'HR Manager', 8, 'BR001', 'DEPT004', NULL),
   ('Benjamin', 'Cooper', 'Male', 'Married', '1994-06-22', 'benjamin.cooper@gmail.com', 1, 'Software Engineer', 7, 'BR002', 'DEPT001', NULL),
   ('Sophie', 'Turner', 'Female', 'Unmarried', '1998-04-17', 'sophie.turner@gmail.com', 2, 'QA Engineer', 7, 'BR002', 'DEPT001', NULL),
   ('Henry', 'Mitchell', 'Male', 'Married', '1995-02-03', 'henry.mitchell@gmail.com', 3, 'Accountant', 9, 'BR003', 'DEPT002', NULL),
   ('Oliver', 'Parker', 'Male', 'Married', '1996-09-15', 'oliver.parker@gmail.com', 4, 'Software Engineer', 9, 'BR003', 'DEPT003', NULL),
   ('Grace', 'Barnes', 'Female', 'Unmarried', '1997-11-30', 'grace.barnes@gmail.com', 5, 'QA Engineer', 10, 'BR003', 'DEPT003',NULL),
   ('William', 'Powell', 'Male', 'Married', '1993-03-24', 'william.powell@gmail.com', 6, 'HR Manager', 8, 'BR001', 'DEPT004', NULL)
 ;



-- Insert sample values into Contact_Number_Details table
INSERT INTO Contact_Number_Details (Employee_ID, Contact_Number)
VALUES
  ('HRM0001', '0712345678'),
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
  ('john.doe', 'HRM0001', '$2a$12$3vKi3BJLp6mT8PElgzNguOHZ', 'https://drive.google.com/images/random_image_1.jpg'),
  ('jane.smith', 'EMP0002', '$2a$12$4UBnZyo.5zTgSMIwUW9Mz', 'https://drive.google.com/images/random_image_2.jpg'),
  ('michael.johnson', 'EMP0003', '$2a$12$AEMK1SokwY7E3eLmFE', 'https://drive.google.com/images/random_image_3.jpg'),
  ('emily.davis', 'EMP0004', '$2a$12$t8HfC3DltX2DCajY6Tal1', 'https://drive.google.com/images/random_image_4.jpg'),
  ('david.wilson', 'HRM0005', '$2a$12$.oPpC07zPUMtQHr8QIhwBe', 'https://drive.google.com/images/random_image_5.jpg'),
  ('sarah.anderson', 'EMP0006', '$2a$12$6bs/C.B/WIa5p0.jZZi2', 'https://drive.google.com/images/random_image_6.jpg'),
  ('daniel.brown', 'EMP0007', '$2a$12$72IOK/CaWGoU59pG2PM9fO', 'https://drive.google.com/images/random_image_7.jpg'),
  ('olivia.lee', 'EMP0008', '$2a$12$0VHaBwzhyC8p4vDYwVj3ju', 'https://drive.google.com/images/random_image_8.jpg'),
  ('william.martinez', 'HRM0009', '$2a$12$YMIwUgjMyRV9ryh7H', 'https://drive.google.com/images/random_image_9.jpg'),
  ('sophia.garcia', 'EMP0010', '$2a$12$ZMblck3qXaY1uGvXUxxqn', 'https://drive.google.com/images/random_image_10.jpg'),
  ('ethan.thomas', 'EMP0011', '$2a$12$3QUrwXoMlnKuKv5IyFbZb', 'https://drive.google.com/images/random_image_11.jpg'),
  ('ava.white', 'EMP0012', '$2a$12$lMCx9iM8/zLjtAvfCvFbRujw', 'https://drive.google.com/images/random_image_12.jpg'),
  ('noah.harris', 'HRM0013', '$2a$12$Uctw3.wxFb8u2QCEH.pfl', 'https://drive.google.com/images/random_image_13.jpg'),
  ('isabella.martin', 'EMP0014', '$2a$12$jdcQQ.9qMhYNrSj3HqI', 'https://drive.google.com/images/random_image_14.jpg'),
  ('james.clark', 'EMP0015', '$2a$12$OkDJ/5SLppnTFP0nOwK49C', 'https://drive.google.com/images/random_image_15.jpg'),
  ('mia.lewis', 'EMP0016', '$2a$12$pZP9gXo/MG9WqwNjz0b28', 'https://drive.google.com/images/random_image_16.jpg'),
  ('liam.walker', 'HRM0017', '$2a$12$IsYFtHXkfxfr33Tbplw3', 'https://drive.google.com/images/random_image_17.jpg'),
  ('avery.hall', 'EMP0018', '$2a$12$OxhQufBl7ts0DrrOMwL', 'https://drive.google.com/images/random_image_18.jpg'),
  ('benjamin.adams', 'EMP0019', '$2a$12$.L5qfz8WstCL4eE', 'https://drive.google.com/images/random_image_19.jpg'),
  ('calsey.mate', 'HRM0020', '$2a$12$RwYfqwQK04LpV/zr', 'https://drive.google.com/images/random_image_20.jpg'),
  ('robert.wright', 'EMP0021', '$2a$12$AeOygoXPOvVJiZnb0l7a', 'https://drive.google.com/images/random_image_21.jpg'),
  ('lillian.perez', 'EMP0022', '$2a$12$LZQIZdAm3e8vADN8RDBv', 'https://drive.google.com/images/random_image_22.jpg'),
  ('henry.hall', 'HRM0023', '$2a$12$4DzEdL66NJuh.XKbMfA8', 'https://drive.google.com/images/random_image_23.jpg'),
  ('ella.king', 'EMP0024', '$2a$12$.9En1yJpA6FUK5MEtu3K', 'https://drive.google.com/images/random_image_24.jpg'),
  ('alexander.brown', 'EMP0025', '$2a$12$Gd6M0Z6vG0aFJS9CzTYA', 'https://drive.google.com/images/random_image_25.jpg'),
  ('nora.garcia', 'EMP0026', '$2a$12$EtdD8L7vC0u.WNZRV1yV', 'https://drive.google.com/images/random_image_26.jpg'),
  ('mason.taylor', 'HRM0027', '$2a$12$JiQhSdNm5zaEXs7ay2u8', 'https://drive.google.com/images/random_image_27.jpg'),
  ('chloe.hernandez', 'EMP0028', '$2a$12$2YmVpL8xZuRqFbi7Su4C', 'https://drive.google.com/images/random_image_28.jpg'),
  ('samuel.reed', 'EMP0029', '$2a$12$0EzKwT6tK0vFURKCVa7K', 'https://drive.google.com/images/random_image_29.jpg'),
  ('lily.ramirez', 'EMP0030', '$2a$12$OZqLjW1tO0eFJWKzWqjK', 'https://drive.google.com/images/random_image_30.jpg'),
  ('daniel.cook', 'HRM0031', '$2a$12$6FsKvT6sK0wFRPKCJa7K', 'https://drive.google.com/images/random_image_31.jpg'),
  ('sophia.smith', 'EMP0032', '$2a$12$3EsKvT6tK0wFRPKCJa7K', 'https://drive.google.com/images/random_image_32.jpg'),
  ('joseph.baker', 'EMP0033', '$2a$12$2FsKvT6tK0wFRPKCJa7K', 'https://drive.google.com/images/random_image_33.jpg'),
  ('aubrey.parker', 'EMP0034', '$2a$12$9GKVtT6tK0wFRPKCJa7K', 'https://drive.google.com/images/random_image_34.jpg'),
  ('robert.wright', 'EMP0035', '$2a$12$5FsKvT6tK0wFRPKCJa7K', 'https://drive.google.com/images/random_image_35.jpg'),
  ('lillian.perez', 'EMP0036', '$2a$12$4FsKvT6tK0wFRPKCJa7K', 'https://drive.google.com/images/random_image_36.jpg'),
  ('ella.king', 'EMP0037', '$2a$12$6FsKvT6tK0wFRPKCJa7K', 'https://drive.google.com/images/random_image_37.jpg'),
  ('alexander.brown', 'EMP0038', '$2a$12$8FsKvT6tK0wFRPKCJa7K', 'https://drive.google.com/images/random_image_38.jpg'),
  ('nora.garcia', 'EMP0039', '$2a$12$7FsKvT6tK0wFRPKCJa7K', 'https://drive.google.com/images/random_image_39.jpg'),
  ('mason.taylor', 'EMP0040', '$2a$12$9FsKvT6tK0wFRPKCJa7K', 'https://drive.google.com/images/random_image_40.jpg'),
  ('benjamin.cooper', 'HRM0041', '$2a$12$1FsKvT6tK0wFRPKCJa7K', 'https://drive.google.com/images/random_image_41.jpg'),
  ('sophie.turner', 'EMP0042', '$2a$12$2FsKvT6tK0wFRPKCJa7K', 'https://drive.google.com/images/random_image_42.jpg'),
  ('henry.mitchell', 'EMP0043', '$2a$12$3FsKvT6tK0wFRPKCJa7K', 'https://drive.google.com/images/random_image_43.jpg'),
  ('oliver.parker', 'EMP0044', '$2a$12$4FsKvT6tK0wFRPKCJa7K', 'https://drive.google.com/images/random_image_44.jpg'),
  ('grace.barnes', 'HRM0045', '$2a$12$5FsKvT6tK0wFRPKCJa7K', 'https://drive.google.com/images/random_image_45.jpg'),
  ('william.powell', 'EMP0046', '$2a$12$6FsKvT6tK0wFRPKCJa7K', 'https://drive.google.com/images/random_image_46.jpg');


-- Insert sample values into Supervisor table
INSERT INTO Supervisor (Supervisor_ID, Subordinate_ID)
VALUES
  ('HRM0001', 'EMP0002'),
  ('HRM0001', 'EMP0004'),
  ('EMP0003', 'EMP0006'),
  ('HRM0001', 'EMP0007'),
  ('EMP0003', 'EMP0010'),
  ('HRM0001', 'EMP0011'),
  ('EMP0008', 'EMP0012'),
  ('EMP0003', 'EMP0014'),
  ('HRM0001', 'EMP0015'),
  ('EMP0008', 'EMP0016'),
  ('EMP0003', 'EMP0018'),
  ('HRM0001', 'EMP0019');

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
  ('EMP0030', '2023-10-10', 5, 'Annual', 'Pending'),
  ('EMP0018', '2023-11-15', 3, 'Casual', 'Approved'),
  ('EMP0008', '2023-09-20', 2, 'Annual', 'Pending'),
  ('EMP0004', '2023-10-05', 7, 'Casual', 'Approved'),
  ('EMP0006', '2023-11-01', 1, 'Annual', 'Pending'),
  ('EMP0007', '2023-12-10', 4, 'Casual', 'Pending'),
  ('EMP0008', '2023-09-15', 30, 'Maternity', 'Approved'),
  ('EMP0010', '2023-11-20', 2, 'Annual', 'Pending'),
  ('EMP0012', '2023-11-25', 40, 'Maternity', 'Pending');

-- Update sample values in the Employee_Leave_Count table
UPDATE `employee_leave_count` SET `Casual` = '3' WHERE (`Employee_ID` = 'EMP0002');
UPDATE `employee_leave_count` SET `Casual` = '7' WHERE (`Employee_ID` = 'EMP0004');
UPDATE `employee_leave_count` SET `Maternity_Leave` = '30' WHERE (`Employee_ID` = 'EMP0008');
