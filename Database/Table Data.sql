-- Insert sample data into the Supervisor table
INSERT INTO Supervisor (Supervisor_ID, Subordinate_ID)
VALUES
(1, 2),
(2, 3),
(3, 4),
(4, 5),
(5, 6),
(6, 7),
(7, 8),
(1, 9),
(2, 10),
(3, 11),
(4, 12),
(5, 13),
(6, 14),
(7, 15),
(1, 16),
(6, 17),
(4, 18),
(5, 19),
(2, 20),
(3, 21),
(7, 22),
(6, 23),
(5, 24),
(3, 25),
(4, 26),
(2, 27),
(1, 28),
(4, 29),
(6, 30);
-- select * from Supervisor;


-- Insert sample data into the Dependent_Information table
INSERT INTO `Dependent_Information` (`First_name`, `Last_name`, `Age`, `Relation`, `Gender`)
VALUES
('John', 'Doe', 10, 'Child', 'Male'),
('Jane', 'Smith', 35, 'Spouse', 'Female'),
('David', 'Johnson', 62, 'Parent', 'Male'),
('Emily', 'Brown', 28, 'Spouse', 'Female'),
('Michael', 'Williams', 5, 'Child', 'Male'),
('Sophia', 'Miller', 42, 'Spouse', 'Female'),
('Ethan', 'Anderson', 8, 'Child', 'Male'),
('Olivia', 'Garcia', 19, 'Child', 'Female'),
('Aiden', 'Harris', 14, 'Child', 'Male'),
('Liam', 'Martinez', 28, 'Spouse', 'Male'),
('Abigail', 'Jones', 6, 'Child', 'Female'),
('Noah', 'Davis', 32, 'Spouse', 'Male'),
('Isabella', 'Wilson', 60, 'Parent', 'Female'),
('James', 'Taylor', 11, 'Child', 'Male'),
('Charlotte', 'Brown', 2, 'Child', 'Female'),
('Benjamin', 'Clark', 7, 'Child', 'Male'),
('Amelia', 'Lewis', 50, 'Parent', 'Female'),
('Lucas', 'Perez', 12, 'Child', 'Male'),
('Harper', 'White', 4, 'Child', 'Female'),
('Mason', 'Johnson', 9, 'Child', 'Male'),
('Evelyn', 'Thomas', 55, 'Parent', 'Female'),
('Oliver', 'Harris', 15, 'Child', 'Male'),
('Ava', 'Moore', 3, 'Child', 'Female'),
('William', 'Davis', 37, 'Spouse', 'Male'),
('Sophia', 'Hall', 1, 'Child', 'Female'),
('Henry', 'Smith', 30, 'Spouse', 'Male'),
('Mia', 'Anderson', 5, 'Child', 'Female'),
('Daniel', 'Jackson', 65, 'Parent', 'Male'),
('Lily', 'Wilson', 13, 'Child', 'Female'),
('Michael', 'Clark', 20, 'Child', 'Male'),
('Emily', 'Garcia', 29, 'Spouse', 'Female'),
('Matthew', 'Lee', 16, 'Child', 'Male'),
('Emma', 'Allen', 7, 'Child', 'Female'),
('Alexander', 'Moore', 45, 'Parent', 'Male');
-- select * from Dependent_Information;


-- Insert sample data into the Branch table
INSERT INTO Branch (Branch_No, Branch_Name, Address, Currency)
VALUES
(1, 'Sri Lanka', 'Colombo, Sri Lanka', 'LKR'),
(2, 'Bangladesh', 'Dhaka, Bangladesh', 'BDT'),
(3, 'Pakistan', 'Karachi, Pakistan', 'PKR');
--  select * from Branch;


-- Insert sample data into the Department table
INSERT INTO `Department` (`Dept_name`, `Budget`) VALUES
('Finance', 150000.00),
('IT', 200000.00),
('Marketing', 120000.00),
('Sales', 130000.00),
('Engineering', 180000.00),
('Research and Development', 160000.00),
('Customer Support', 110000.00),
('Legal', 90000.00),
('Operations', 140000.00),
('Product Management', 170000.00),
('Quality Assurance', 130000.00),
('Design', 110000.00),
('Supply Chain', 160000.00),
('Public Relations', 120000.00),
('Health and Safety', 90000.00),
('Training and Development', 80000.00),
('Internal Audit', 95000.00),
('Facilities Management', 110000.00),
('Purchasing', 130000.00),
('Accounting', 140000.00),
('Business Development', 170000.00),
('Project Management', 150000.00),
('Data Analysis', 140000.00),
('Logistics', 120000.00),
('Customer Relations', 110000.00),
('Event Management', 100000.00),
('Consulting', 190000.00),
('Quality Control', 120000.00),
('Compliance', 95000.00);
-- select * from Department;


-- Insert sample data into the Pay_Grade table
INSERT INTO `Pay_Grade` (`Pay_Grade`, `Basic_salary`) VALUES
('Level 1', 50000.00),
('Level 2', 70000.00),
('Level 3', 75000.00),
('Level 4', 80000.00),
('Level 5', 85000.00),
('Level 6', 90000.00),
('Level 7', 95000.00),
('Level 8', 100000.00),
('Level 9', 105000.00),
('Level 10', 110000.00);
-- select * from Pay_Grade;


-- Insert sample data into the Employment_Status table
INSERT INTO `Employment_Status` (`Status`)
VALUES
('Intern Fulltime'),
('Intern Parttime'),
('Contract fulltime'),
('Contract parttime'),
('Permanent'),
('Free Lance'),
('Other');
-- select * from Employment_Status;


-- Insert sample data into the Employee_Data table
INSERT INTO `Employee_Data` (`Employee_ID`, `First_name`, `Last_name`, `Gender`, `Marital_status`, `Birthday`, `Email`, `Employment_status`, `Job_Title`, `Pay_Grade_ID`, `Branch_No`, `Dept_ID`, `Dependent_ID`)
VALUES
(1, 'Sophia', 'Brown', 'Female', 'Unmarried', '1998-02-25', 'sophia.brown@gmail.com', 2, 'HR Manager', 1, 3, 1, 7),
(2, 'Joshua', 'Turner', 'Male', 'Married', '1999-03-10', 'joshua.turner@gmail.com', 5, 'Software Engineer', 1, 1, 2, 2),
(3, 'Natalie', 'Baker', 'Female', 'Unmarried', '1988-11-29', 'natalie.baker@gmail.com', 1, 'QA Engineer', 10, 1, 3, 3),
(4, 'Michael', 'Smith', 'Male', 'Married', '1995-08-20', 'michael.smith@gmail.com', 5, 'Accountant', 3, 3, 4, 4),
(5, 'Charlotte', 'Wilson', 'Female', 'Married', '1996-12-03', 'charlotte.wilson@gmail.com', 5, 'HR Manager', 1, 2, 1, 11),
(6, 'Daniel', 'Moore', 'Male', 'Married', '1995-07-27', 'daniel.moore@gmail.com', 1, 'Accountant', 3, 1, 4, 12),
(7, 'Olivia', 'Taylor', 'Female', 'Unmarried', '1993-10-22', 'olivia.taylor@gmail.com', 7, 'Software Engineer', 2, 3, 5, 13),
(8, 'Oliver', 'Jones', 'Male', 'Married', '1993-06-08', 'oliver.jones@gmail.com', 6, 'Accountant', 3, 1, 4, 8),
(9, 'Emma', 'Miller', 'Female', 'Married', '1991-04-30', 'emma.miller@gmail.com', 4, 'Software Engineer', 1, 2, 5, 9),
(10, 'Emily', 'Johnson', 'Female', 'Unmarried', '1992-07-14', 'emily.johnson@gmail.com', 7, 'Software Engineer', 2, 2, 5, 5),
(11, 'David', 'Williams', 'Male', 'Married', '1994-09-18', 'david.williams@gmail.com', 4, 'QA Engineer', 10, 1, 2, 6),
(12, 'William', 'Davis', 'Male', 'Unmarried', '1997-01-11', 'william.davis@gmail.com', 3, 'QA Engineer', 10, 1, 2, 10),
(13, 'Ethan', 'Thompson', 'Male', 'Unmarried', '1997-03-19', 'ethan.thompson@gmail.com', 5, 'QA Engineer', 5, 3, 2, 18),
(14, 'Sofia', 'Garcia', 'Female', 'Married', '1996-01-27', 'sofia.garcia@gmail.com', 2, 'HR Manager', 7, 3, 1, 19),
(15, 'James', 'Rodriguez', 'Male', 'Married', '1991-12-09', 'james.rodriguez@gmail.com', 6, 'Accountant', 6, 2, 4, 20),
(16, 'Joseph', 'Anderson', 'Male', 'Married', '1994-04-16', 'joseph.anderson@gmail.com', 3, 'QA Engineer', 8, 2, 2, 14),
(17, 'Mia', 'White', 'Female', 'Unmarried', '1998-08-07', 'mia.white@gmail.com', 1, 'HR Manager', 9, 1, 1, 15),
(18, 'Alexander', 'Harris', 'Male', 'Married', '1992-09-12', 'alexander.harris@gmail.com', 6, 'Accountant', 3, 2, 4, 16),
(19, 'Abigail', 'Martin', 'Female', 'Married', '1990-11-05', 'abigail.martin@gmail.com', 7, 'Software Engineer', 4, 3, 5, 17),
(20, 'Henry', 'Gomez', 'Male', 'Married', '1990-07-18', 'henry.gomez@gmail.com', 1, 'Accountant', 9, 1, 4, 28),
(21, 'Ella', 'Torres', 'Female', 'Unmarried', '1991-08-04', 'ella.torres@gmail.com', 1, 'Software Engineer', 5, 2, 5, 29),
(22, 'Liam', 'Rivera', 'Male', 'Married', '1992-06-21', 'liam.rivera@gmail.com', 1, 'QA Engineer', 2, 3, 2, 30),
(23, 'Ava', 'Lopez', 'Female', 'Unmarried', '1999-06-14', 'ava.lopez@gmail.com', 1, 'Software Engineer', 2, 2, 5, 21),
(24, 'Harper', 'Hernandez', 'Female', 'Unmarried', '1995-10-30', 'harper.hernandez@gmail.com', 5, 'HR Manager', 6, 3, 1, 23),
(25, 'Benjamin', 'Lee', 'Male', 'Married', '1998-04-02', 'benjamin.lee@gmail.com', 5, 'QA Engineer', 1, 1, 2, 22),
(26, 'Amelia', 'Perez', 'Female', 'Married', '1994-07-01', 'amelia.perez@gmail.com', 7, 'Software Engineer', 2, 2, 5, 25),
(27, 'Lucas', 'Sanchez', 'Male', 'Unmarried', '1997-09-26', 'lucas.sanchez@gmail.com', 6, 'QA Engineer', 8, 1, 2, 26),
(28, 'Mila', 'Martinez', 'Female', 'Married', '1996-03-12', 'mila.martinez@gmail.com', 5, 'HR Manager', 8, 3, 1, 27),
(29, 'Logan', 'Gonzalez', 'Male', 'Married', '1993-02-08', 'logan.gonzalez@gmail.com', 7, 'Accountant', 7, 1, 4, 24),
(30, 'Frank', 'Bebe', 'Male', 'Married', '1997-04-02', 'bebe.lee@gmail.com', 3, 'QA Engineer', 6, 2, 2, 22);
-- select * from Employee_Data;


-- Insert sample data into the Leave_Request table
INSERT INTO `Leave_Request` (`Start_Date`, `No_of_Days`, `Type`, `Status`, `Employee_ID`) 
VALUES
('2023-10-01', 5, 'Annual', 'Approved', 1),
('2023-10-10', 3, 'Casual', 'Pending', 2),
('2023-11-15', 90, 'Maternity', 'Approved', 3),
('2023-09-20', 7, 'Annual', 'Approved', 4),
('2023-12-05', 2, 'Casual', 'Pending', 5),
('2023-11-01', 30, 'No-pay', 'Rejected', 6),
('2023-10-03', 5, 'Annual', 'Approved', 7),
('2023-10-12', 3, 'Casual', 'Pending', 8),
('2023-11-16', 90, 'Maternity', 'Approved', 9),
('2023-09-21', 7, 'Annual', 'Approved', 10),
('2023-12-06', 2, 'Casual', 'Pending', 11),
('2023-11-02', 30, 'No-pay', 'Rejected', 12),
('2023-10-05', 5, 'Annual', 'Approved', 13),
('2023-10-14', 3, 'Casual', 'Pending', 14),
('2023-11-18', 90, 'Maternity', 'Approved', 15),
('2023-09-22', 7, 'Annual', 'Approved', 16),
('2023-12-07', 2, 'Casual', 'Pending', 17),
('2023-11-03', 30, 'No-pay', 'Rejected', 18),
('2023-10-07', 5, 'Annual', 'Approved', 19),
('2023-10-16', 3, 'Casual', 'Pending', 20),
('2023-11-20', 90, 'Maternity', 'Approved', 21),
('2023-09-23', 7, 'Annual', 'Approved', 22),
('2023-12-08', 2, 'Casual', 'Pending', 23),
('2023-11-04', 30, 'No-pay', 'Rejected', 24),
('2023-10-09', 5, 'Annual', 'Approved', 25),
('2023-10-18', 3, 'Casual', 'Pending', 26),
('2023-11-22', 90, 'Maternity', 'Approved', 27),
('2023-09-24', 7, 'Annual', 'Approved', 28),
('2023-12-09', 2, 'Casual', 'Pending', 29),
('2023-11-05', 30, 'No-pay', 'Rejected', 30);
-- select * from Leave_Request;


-- Insert sample data into the Leave_Limit table
INSERT INTO `Leave_Limit` (`Pay_Grade_ID`, `Annual`, `Casual`, `No_Pay`, `Maternity_Leave`) 
VALUES
(1, 25, 10, 50, 120),
(2, 20, 8, 50, 90),
(3, 30, 12, 50, 150),
(4, 28, 11, 50, 130),
(5, 23, 9, 50, 110),
(6, 27, 10, 50, 115),
(7, 22, 8, 50, 105),
(8, 29, 11, 50, 125),
(9, 24, 9, 50, 115),
(10, 26, 10, 50, 120);
-- select * from Leave_Limit;


-- Insert sample data into the Custom_Attribute_Definition table
INSERT INTO `Custom_Attribute_Definition` (`Attribute_Name`) 
VALUES
('Skill Level'),
('Certification'),
('Languages Spoken'),
('Specialization'),
('Professional Membership'),
('Previous Experience'),
('Education Level'),
('Technical Skills'),
('Project Management Certification'),
('Programming Languages'),
('Industry Certifications'),
('Soft Skills'),
('Publications'),
('Volunteer Experience'),
('Awards and Honors'),
('Hobbies and Interests'),
('References'),
('Leadership Experience'),
('Research Projects'),
('Additional Training'),
('Job-specific Skills'),
('Social Media Profiles'),
('Workshops Attended'),
('Presentation Skills'),
('Customer Service Skills'),
('Sales Achievements'),
('Public Speaking Experience'),
('Analytical Skills'),
('Team Collaboration Skills'),
('Conflict Resolution Skills');
-- select * from Custom_Attribute_Definition;


-- Insert sample data into the Employee_Custom_Attribute table
INSERT INTO `Employee_Custom_Attribute` (`Attribute_ID`, `Employee_ID`, `Value`) 
VALUES
(1, 1, 'Intermediate'),
(2, 2, 'Certified Scrum Master'),
(3, 3, 'English, French'),
(4, 4, 'Back-end Development'),
(5, 5, 'ACM Member'),
(6, 6, '3 years at ABC Corp.'),
(1, 7, 'Advanced'),
(2, 8, 'Certified Six Sigma Black Belt'),
(3, 9, 'English, German'),
(4, 10, 'Full-stack Development'),
(5, 11, 'IEEE Member'),
(6, 12, '4 years at DEF Ltd.'),
(1, 13, 'Intermediate'),
(2, 14, 'Certified Product Owner'),
(3, 15, 'English, Spanish'),
(4, 16, 'Database Administration'),
(5, 17, 'PMI Member'),
(6, 18, '2 years at GHI Inc.'),
(1, 19, 'Advanced'),
(2, 20, 'Certified Business Analyst'),
(3, 21, 'English, French, Spanish'),
(4, 22, 'UI/UX Design'),
(5, 23, 'ACM Member'),
(6, 24, '6 years at JKL Corp.'),
(1, 25, 'Intermediate'),
(2, 26, 'Certified Data Scientist'),
(3, 27, 'English, Chinese'),
(4, 28, 'Cloud Computing'),
(5, 29, 'IEEE Member'),
(6, 30, '4 years at MNO Ltd.');
-- select * from Employee_Custom_Attribute;


-- Insert sample data into the Contact_Number_Details table
INSERT INTO `Contact_Number_Details` (`Employee_ID`, `Contact_number`) 
VALUES
(1, 0777123456),
(2, 0718234567),
(3, 0779345678),
(3, 0784687951),
(4, 0716456789),
(5, 0777567890),
(6, 0718678901),
(6, 0778495742),
(6, 0716455755),
(7, 0779789012),
(8, 0717890123),
(9, 0778901234),
(10, 0718901235),
(11, 0778901236),
(12, 0718901237),
(13, 0778901238),
(14, 0718901239),
(14, 0768585748),
(15, 0778901240),
(16, 0718901241),
(17, 0778901242),
(18, 0718901243),
(19, 0778901244),
(20, 0718901245),
(21, 0778901246),
(22, 0718901247),
(23, 0778901248),
(23, 0708459765),
(24, 0718901249),
(25, 0778901250),
(26, 0718901251),
(27, 0778901252),
(28, 0718901253),
(29, 0778901254),
(30, 0718901255);
-- select * from Contact_Number_Details;


-- Insert sample data into the Employee_Account table
INSERT INTO `Employee_Account` (`User_ID`, `Employee_ID`, `Password`) 
VALUES
('user123', 1, 'passw0rd!'),
('employee456', 2, 'SecurePwd789'),
('johndoe77', 3, 'R@nd0mPass'),
('user987', 4, 'P@ssw0rd123'),
('emplacer', 5, 'SecretPwd456'),
('accountant22', 6, 'MyP@ss123'),
('janesmith33', 7, 'RandomPwd!'),
('user789', 8, 'StrongP@ss456'),
('engineer42', 9, '1234Random!'),
('user555', 10, 'Pwd789!'),
('manager66', 11, 'Random123!'),
('employee101', 12, 'Password!123'),
('user202', 13, 'Secure123!'),
('emplacer303', 14, 'StrongPwd!789'),
('user404', 15, '123Random!'),
('analyst505', 16, 'RandomPwd!456'),
('user606', 17, 'P@ssw0rd789'),
('assistant707', 18, 'SecurePwd!123'),
('user808', 19, 'RandomP@ss123'),
('coordinator909', 20, 'Pwd123!'),
('user1010', 21, 'Random1234!'),
('designer1111', 22, '12345Pwd!'),
('user1212', 23, 'P@ssword!789'),
('developer1313', 24, 'StrongPwd123!'),
('user1414', 25, 'RandomP@sswd!'),
('administrator1515', 26, 'Pwd!Random456'),
('user1616', 27, 'P@sswd!1234'),
('supervisor1717', 28, 'SecurePwd!567'),
('user1818', 29, 'RandomP@ssword!'),
('manager1919', 30, '12345678Pwd!');
-- select * from Employee_Account;


-- Insert sample data into the Organization table
INSERT INTO `Organization` (`Registration_No`, `Name`, `Main_Branch`) 
VALUES
('ORG/2023/001', 'Jupiter Apparels', 1);
-- select * from Organization;
