-- show databases;
drop database hrms;
create database HRMS;
use hrms;

CREATE TABLE `Supervisor` (
  `Supervisor_ID` INT(12) NOT NULL,
  `Subordinate_ID` INT(12) NOT NULL,
  PRIMARY KEY (`Supervisor_ID`, `Subordinate_ID`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `Dependent_Information` (
  `Dependent_ID` INT(12) NOT NULL AUTO_INCREMENT,
  `First_name` VARCHAR(255),
  `Last_name` VARCHAR(255) NOT NULL,
  `Age` INT(3),
  `Relation` VARCHAR(255) NOT NULL,
  `Gender` ENUM('Male', 'Female', 'Prefer not to say') NOT NULL,
  PRIMARY KEY (`Dependent_ID`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `Branch` (
  `Branch_No` INT(5) NOT NULL AUTO_INCREMENT,
  `Branch_Name` VARCHAR(255) NOT NULL,
  `Address` VARCHAR(255) NOT NULL,
  `Currency` VARCHAR(3) NOT NULL,
  PRIMARY KEY (`Branch_No`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `Department` (
  `Dept_ID` INT(5) NOT NULL AUTO_INCREMENT,
  `Dept_name` VARCHAR(255) NOT NULL,
  `Budget` NUMERIC(10, 2) NOT NULL,
  PRIMARY KEY (`Dept_ID`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `Pay_Grade` (
  `Pay_Grade_ID` INT(3) NOT NULL AUTO_INCREMENT,
  `Pay_Grade` VARCHAR(255) NOT NULL,
  `Basic_salary` NUMERIC(10 ,2) NOT NULL,
  PRIMARY KEY (`Pay_Grade_ID`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `Employment_Status` (
  `Status_ID` INT(3) NOT NULL AUTO_INCREMENT,
  `Status` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`Status_ID`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `Employee_Data` (
  `Employee_ID` INT(12) NOT NULL AUTO_INCREMENT,
  `First_name` VARCHAR(255) NOT NULL,
  `Last_name` VARCHAR(255) NOT NULL,
  `Marital_status` ENUM('Married', 'Unmarried', 'Other', 'Prefer not to say') NOT NULL,
  `Birthday` DATE NOT NULL,
  `Email` VARCHAR(255),
  `Employment_status`  INT(3) NOT NULL,
  `Job_Title` ENUM('HR Manager', 'Accountant', 'Software Engineer', 'QA Engineer') NOT NULL,
  `Pay_Grade_ID` INT(3) NOT NULL,
  `Branch_No` INT(12) NOT NULL,
  `Dept_ID` INT(5) NOT NULL,
  `Dependent_ID` INT(12),
  PRIMARY KEY (`Employee_ID`),
  FOREIGN KEY (`Dependent_ID`) REFERENCES `Dependent_Information`(`Dependent_ID`),
  FOREIGN KEY (`Dept_ID`) REFERENCES `Department`(`Dept_ID`),
  FOREIGN KEY (`Branch_No`) REFERENCES `Branch`(`Branch_No`),
  FOREIGN KEY (`Pay_Grade_ID`) REFERENCES `Pay_Grade`(`Pay_Grade_ID`),
  FOREIGN KEY (`Employment_status`) REFERENCES `Employment_Status`(`Status_ID`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `Leave_Request` (
  `Leave_Req_ID` INT(12) NOT NULL AUTO_INCREMENT,
  `Employee_ID` INT(12) NOT NULL,
  `Start_Date` DATE NOT NULL,
  `No_of_Days` INT(3) NOT NULL,
  `Type` ENUM('Annual', 'Casual', 'Maternity', 'No-pay') NOT NULL,
  `Status` ENUM('Approved', 'Pending', 'Rejected') NOT NULL,
  PRIMARY KEY (`Leave_Req_ID`),
  FOREIGN KEY (`Employee_ID`) REFERENCES `Employee_Data`(`Employee_ID`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `Leave_Limit` (
  `Pay_Grade_ID` INT(3) NOT NULL,
  `Annual` INT(3) NOT NULL,
  `Casual` INT(3) NOT NULL,
  `No_Pay` INT(3) NOT NULL,
  `Maternity_Leave` INT(3) NOT NULL,
  PRIMARY KEY (`Pay_Grade_ID`),
  FOREIGN KEY (`Pay_Grade_ID`) REFERENCES `Pay_Grade`(`Pay_Grade_ID`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `Custom_Attribute_Definition` (
  `Attribute_ID` INT(3) NOT NULL AUTO_INCREMENT,
  `Attribute_Name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`Attribute_ID`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `Employee_Custom_Attribute` (
  `Attribute_ID` INT(3) NOT NULL,
  `Employee_ID` INT(12) NOT NULL,
  `Value` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`Attribute_ID`, `Employee_ID`),
  FOREIGN KEY (`Employee_ID`) REFERENCES `Employee_Data`(`Employee_ID`),
  FOREIGN KEY (`Attribute_ID`) REFERENCES `Custom_Attribute_Definition`(`Attribute_ID`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `Contact_Number_Details` (
  `Employee_ID` INT(12) NOT NULL,
  `Contact_number` INT(10) NOT NULL,
  PRIMARY KEY (`Employee_ID`, `Contact_number`),
  FOREIGN KEY (`Employee_ID`) REFERENCES `Employee_Data`(`Employee_ID`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `Employee_Leave_Count` (
  `Employee_ID` INT(12) NOT NULL,
  `Annual` INT(3) NOT NULL,
  `Casual` INT(3) NOT NULL,
  `No_Pay` INT(3)NOT NULL,
  `Maternity_Leave` INT(3) NOT NULL,
  PRIMARY KEY (`Employee_ID`),
  FOREIGN KEY (`Employee_ID`) REFERENCES `Employee_Data`(`Employee_ID`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `Employee_Account` (
  `User_ID` VARCHAR(255) NOT NULL,
  `Employee_ID` INT(12) NOT NULL,
  `Password` VARCHAR(255) NOT NULL,
  `Profile_Pic` Blob,
  PRIMARY KEY (`User_ID`),
  FOREIGN KEY (`Employee_ID`) REFERENCES `Employee_Data`(`Employee_ID`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `Organization` (
  `Registration_No` VARCHAR(255) NOT NULL,
  `Name` VARCHAR(255) NOT NULL,
  `Main_Branch` INT(5) NOT NULL,
  PRIMARY KEY (`Registration_No`),
  FOREIGN KEY (`Main_Branch`) REFERENCES `Branch`(`Branch_No`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
-- show tables;

-- Insert sample data into the Supervisor table with unique Supervisor_ID and Subordinate_ID
INSERT INTO Supervisor (Supervisor_ID, Subordinate_ID)
VALUES
(21300100, 21300101),
(21300101, 21300102),
(21300102, 21300103),
(21300103, 21300104),
(21300104, 21300105),
(21300105, 21300106),
(21300106, 21300107),
(21300107, 21300108),
(21300108, 21300109),
(21300109, 21300110),
(21300110, 21300111),
(21300111, 21300112),
(21300112, 21300113),
(21300113, 21300114),
(21300114, 21300115),
(21300115, 21300116),
(21300116, 21300117),
(21300117, 21300118),
(21300118, 21300119),
(21300119, 21300120),
(21300120, 21300121),
(21300121, 21300122),
(21300122, 21300123),
(21300123, 21300124),
(21300124, 21300125),
(21300125, 21300126),
(21300126, 21300127),
(21300127, 21300128),
(21300128, 21300129),
(21300129, 21300130);
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
    (101, 'Main Branch', '123 Main Street, City1', 'USD'),
    (102, 'Downtown Branch', '456 Downtown Avenue, City2', 'EUR'),
    (103, 'City Center Branch', '789 Center Road, City3', 'GBP'),
    (104, 'Westside Branch', '321 West Boulevard, City4', 'JPY'),
    (105, 'East End Branch', '567 East Street, City5', 'AUD'),
    (106, 'Northside Branch', '987 North Avenue, City6', 'CAD'),
    (107, 'South Park Branch', '654 South Road, City7', 'INR'),
    (108, 'Riverfront Branch', '234 River Lane, City8', 'CNY'),
    (109, 'Harbor Branch', '876 Harbor Road, City9', 'KRW'),
    (110, 'Beachside Branch', '543 Beach Boulevard, City10', 'MXN'),
    (111, 'Central Branch', '678 Central Avenue, City11', 'RUB'),
    (112, 'Sunset Branch', '432 Sunset Road, City12', 'BRL'),
    (113, 'Mountain View Branch', '345 Mountain Lane, City13', 'ZAR'),
    (114, 'Hilltop Branch', '789 Hilltop Road, City14', 'CHF'),
    (115, 'Valley Branch', '123 Valley Avenue, City15', 'SGD'),
    (116, 'Highland Branch', '876 Highland Lane, City16', 'SEK'),
    (117, 'Meadowside Branch', '543 Meadow Road, City17', 'NOK'),
    (118, 'Forest Branch', '654 Forest Boulevard, City18', 'DKK'),
    (119, 'Lakeview Branch', '987 Lakeview Street, City19', 'NZD'),
    (120, 'Oceanfront Branch', '321 Ocean Road, City20', 'AED'),
    (121, 'Downtown West Branch', '555 Downtown West Avenue, City21', 'GBP'),
    (122, 'Riverside Branch', '222 Riverside Road, City22', 'JPY'),
    (123, 'Business Park Branch', '777 Business Park Street, City23', 'EUR'),
    (124, 'Industrial Zone Branch', '888 Industrial Road, City24', 'USD'),
    (125, 'Tech Park Branch', '333 Tech Park Avenue, City25', 'CAD'),
    (126, 'Airport Branch', '999 Airport Road, City26', 'INR'),
    (127, 'Financial District Branch', '111 Financial Lane, City27', 'CNY'),
    (128, 'Suburban Branch', '444 Suburban Avenue, City28', 'KRW'),
    (129, 'Garden View Branch', '666 Garden View Road, City29', 'MXN'),
    (130, 'Hillside Branch', '777 Hillside Street, City30', 'RUB');
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
('Grade A1', 50000.00),
('Grade A2', 70000.00),
('Grade A3', 75000.00),
('Grade A4', 80000.00),
('Grade A5', 85000.00),
('Grade A6', 90000.00),
('Grade A7', 95000.00),
('Grade A8', 100000.00),
('Grade A9', 105000.00),
('Grade A10', 110000.00),
('Grade B1', 60000.00),
('Grade B2', 62000.00),
('Grade B3', 64000.00),
('Grade B4', 66000.00),
('Grade B5', 68000.00),
('Grade B6', 70000.00),
('Grade B7', 72000.00),
('Grade B8', 74000.00),
('Grade B9', 76000.00),
('Grade B10', 78000.00),
('Grade C1', 50000.00),
('Grade C2', 52000.00),
('Grade C3', 54000.00),
('Grade C4', 56000.00),
('Grade C5', 58000.00),
('Grade C6', 60000.00),
('Grade C7', 62000.00),
('Grade C8', 64000.00),
('Grade C9', 66000.00),
('Grade C10', 68000.00);
-- select * from Pay_Grade;

-- Insert sample data into the Employment_Status table
INSERT INTO `Employment_Status` (`Status`)
VALUES
('Active'),
('Inactive'),
('On Leave'),
('Terminated'),
('Retired'),
('Suspended'),
('Probation'),
('Resigned'),
('Temporary'),
('Full-time'),
('Part-time'),
('Contractor'),
('Freelancer'),
('Consultant'),
('Intern'),
('Trainee'),
('Per Diem'),
('Seasonal'),
('Volunteer'),
('Remote'),
('Flextime'),
('Shift Worker'),
('Casual'),
('Freight'),
('Layoff'),
('Casual/Seasonal'),
('Fixed-term'),
('Self-Employed'),
('Zero Hours'),
('Other');
-- select * from Employment_Status;

-- Insert sample data into the Employee_Data table
INSERT INTO `Employee_Data` (`Employee_ID`,`First_name`, `Last_name`, `Marital_status`, `Birthday`, `Email`, `Employment_status`, `Job_Title`, `Pay_Grade_ID`, `Branch_No`, `Dept_ID`, `Dependent_ID`) 
VALUES
(1,'Sophia', 'Brown', 'Unmarried', '1998-02-25', 'sophia.brown@gmail.com', 9, 'HR Manager', 1, 103, 1, 7),
(2,'Joshua', 'Turner', 'Married', '1999-03-10', 'joshua.turner@gmail.com', 8, 'Software Engineer', 12, 127, 2, 2),
(3,'Natalie', 'Baker', 'Unmarried', '1988-11-29', 'natalie.baker@gmail.com', 10, 'QA Engineer', 10, 128, 3, 3),
(4,'Michael', 'Smith', 'Married', '1995-08-20', 'michael.smith@gmail.com', 5, 'Accountant', 13, 103, 4, 4),
(5,'Charlotte', 'Wilson', 'Married', '1996-12-03', 'charlotte.wilson@gmail.com', 5, 'HR Manager', 1, 102, 1, 11),
(6,'Daniel', 'Moore', 'Married', '1995-07-27', 'daniel.moore@gmail.com', 10, 'Accountant', 3, 119, 4, 12),
(7,'Olivia', 'Taylor', 'Unmarried', '1993-10-22', 'olivia.taylor@gmail.com', 7, 'Software Engineer', 12, 110, 5, 13),
(8,'Oliver', 'Jones', 'Married', '1993-06-08', 'oliver.jones@gmail.com', 6, 'Accountant', 3, 104, 4, 8),
(9,'Emma', 'Miller', 'Married', '1991-04-30', 'emma.miller@gmail.com', 11, 'Software Engineer', 11, 109, 5, 9),
(10,'Emily', 'Johnson', 'Unmarried', '1992-07-14', 'emily.johnson@gmail.com', 7, 'Software Engineer',12, 105, 5, 5),
(11,'David', 'Williams', 'Married', '1994-09-18', 'david.williams@gmail.com', 4, 'QA Engineer', 10, 108, 2, 6),
(12,'William', 'Davis', 'Unmarried', '1997-01-11', 'william.davis@gmail.com', 8, 'QA Engineer', 10, 106, 2, 10),
(13,'Ethan', 'Thompson', 'Unmarried', '1997-03-19', 'ethan.thompson@gmail.com', 5, 'QA Engineer', 20, 124, 2, 18),
(14,'Sofia', 'Garcia', 'Married', '1996-01-27', 'sofia.garcia@gmail.com', 9, 'HR Manager', 21, 125, 1, 19),
(15,'James', 'Rodriguez', 'Married', '1991-12-09', 'james.rodriguez@gmail.com', 6, 'Accountant', 6, 126, 4, 20),
(16,'Joseph', 'Anderson', 'Married', '1994-04-16', 'joseph.anderson@gmail.com', 9, 'QA Engineer', 1, 120, 2, 14),
(17,'Mia', 'White', 'Unmarried', '1998-08-07', 'mia.white@gmail.com', 1, 'HR Manager', 21, 121, 1, 15),
(18,'Alexander', 'Harris', 'Married', '1992-09-12', 'alexander.harris@gmail.com', 6, 'Accountant', 13, 122, 4, 16),
(19,'Abigail', 'Martin', 'Married', '1990-11-05', 'abigail.martin@gmail.com', 8, 'Software Engineer', 2, 123, 5, 17),
(20,'Henry', 'Gomez', 'Married', '1990-07-18', 'henry.gomez@gmail.com', 10, 'Accountant', 9, 115, 4, 28),
(21,'Ella', 'Torres', 'Unmarried', '1991-08-04', 'ella.torres@gmail.com', 18, 'Software Engineer', 25, 117, 5, 29),
(22,'Liam', 'Rivera', 'Married', '1992-06-21', 'liam.rivera@gmail.com', 17, 'QA Engineer', 2, 119, 2, 30),
(23,'Ava', 'Lopez', 'Unmarried', '1999-06-14', 'ava.lopez@gmail.com', 10, 'Software Engineer', 2, 103, 5, 21),
(24,'Harper', 'Hernandez', 'Unmarried', '1995-10-30', 'harper.hernandez@gmail.com', 8, 'HR Manager', 6, 113, 1, 23),
(25,'Benjamin', 'Lee', 'Married', '1998-04-02', 'benjamin.lee@gmail.com', 5, 'QA Engineer', 1, 107, 2, 22),
(26,'Amelia', 'Perez', 'Married', '1994-07-01', 'amelia.perez@gmail.com', 9, 'Software Engineer', 2, 116, 5, 25),
(27,'Lucas', 'Sanchez', 'Unmarried', '1997-09-26', 'lucas.sanchez@gmail.com', 6, 'QA Engineer', 8, 118, 2, 26),
(28,'Mila', 'Martinez', 'Married', '1996-03-12', 'mila.martinez@gmail.com', 5, 'HR Manager', 8, 114, 1, 27),
(29,'Logan', 'Gonzalez', 'Married', '1993-02-08', 'logan.gonzalez@gmail.com', 7, 'Accountant', 16, 111, 4, 24),
(30,'Frank', 'bebe', 'Married', '1997-04-02', 'bebe.lee@gmail.com', 8, 'QA Engineer', 1, 107, 2, 22);

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
(1, 25, 10, 5, 120),
(2, 20, 8, 4, 90),
(3, 30, 12, 6, 150),
(4, 28, 11, 5, 130),
(5, 23, 9, 4, 110),
(6, 27, 10, 5, 115),
(7, 22, 8, 4, 105),
(8, 29, 11, 6, 125),
(9, 24, 9, 5, 115),
(10, 26, 10, 5, 120),
(11, 21, 8, 4, 100),
(12, 28, 11, 6, 130),
(13, 25, 10, 5, 120),
(14, 23, 9, 4, 110),
(15, 30, 12, 6, 150),
(16, 27, 10, 5, 125),
(17, 22, 8, 4, 105),
(18, 29, 11, 6, 130),
(19, 26, 10, 5, 120),
(20, 21, 8, 4, 100),
(21, 28, 11, 6, 130),
(22, 25, 10, 5, 120),
(23, 23, 9, 4, 110),
(24, 30, 12, 6, 150),
(25, 27, 10, 5, 125),
(26, 22, 8, 4, 105),
(27, 29, 11, 6, 130),
(28, 26, 10, 5, 120),
(29, 21, 8, 4, 100),
(30, 28, 11, 6, 130);


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
(4, 0716456789),
(5, 0777567890),
(6, 0718678901),
(7, 0779789012),
(8, 0717890123),
(9, 0778901234),
(10, 0718901235),
(11, 0778901236),
(12, 0718901237),
(13, 0778901238),
(14, 0718901239),
(15, 0778901240),
(16, 0718901241),
(17, 0778901242),
(18, 0718901243),
(19, 0778901244),
(20, 0718901245),
(21, 0778901246),
(22, 0718901247),
(23, 0778901248),
(24, 0718901249),
(25, 0778901250),
(26, 0718901251),
(27, 0778901252),
(28, 0718901253),
(29, 0778901254),
(30, 0718901255);
-- select * from Contact_Number_Details;


-- Insert sample data into the Employee_Leave_Count table
INSERT INTO `Employee_Leave_Count` (`Employee_ID`, `Annual`, `Casual`, `No_Pay`, `Maternity_Leave`) 
VALUES
(1, 20, 10, 5, 120),
(2, 15, 8, 4, 90),
(3, 25, 12, 6, 150),
(4, 18, 11, 5, 130),
(5, 22, 9, 4, 110),
(6, 21, 10, 5, 115),
(7, 16, 8, 4, 105),
(8, 27, 11, 6, 125),
(9, 19, 9, 5, 115),
(10, 23, 10, 5, 120),
(11, 17, 8, 4, 100),
(12, 24, 11, 6, 130),
(13, 20, 10, 5, 120),
(14, 21, 9, 4, 110),
(15, 26, 12, 6, 150),
(16, 18, 10, 5, 125),
(17, 17, 8, 4, 105),
(18, 28, 11, 6, 130),
(19, 22, 10, 5, 120),
(20, 19, 8, 4, 100),
(21, 25, 11, 6, 130),
(22, 20, 10, 5, 120),
(23, 21, 9, 4, 110),
(24, 26, 12, 6, 150),
(25, 19, 10, 5, 125),
(26, 17, 8, 4, 105),
(27, 27, 11, 6, 130),
(28, 22, 10, 5, 120),
(29, 19, 8, 4, 100),
(30, 25, 11, 6, 130);

-- select * from Employee_Leave_Count;

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

-- Insert more sample data into the Organization table with registration numbers
INSERT INTO `Organization` (`Registration_No`, `Name`, `Main_Branch`) 
VALUES
('ORG/2023/001', 'XYZ Corporation', 101),
('ORG/2023/002', 'ABC Ltd.', 102),
('ORG/2023/003', 'XYZ Corp.', 103),
('ORG/2023/004', 'LMN Inc.', 104),
('ORG/2023/005', 'PQR Enterprises', 105),
('ORG/2023/006', 'JKL Co.', 106),
('ORG/2023/007', 'EFG Group', 107),
('ORG/2023/008', 'RST Ltd.', 108),
('ORG/2023/009', 'UVW Corporation', 109),
('ORG/2023/010', 'HIJ Inc.', 110),
('ORG/2023/011', 'NOP Enterprises', 111),
('ORG/2023/012', 'GHI Co.', 112),
('ORG/2023/013', 'XYZ Corporation', 113),
('ORG/2023/014', 'ABC Ltd.', 114),
('ORG/2023/015', 'XYZ Corp.', 115),
('ORG/2023/016', 'LMN Inc.', 116),
('ORG/2023/017', 'PQR Enterprises', 117),
('ORG/2023/018', 'JKL Co.', 118),
('ORG/2023/019', 'EFG Group', 119),
('ORG/2023/020', 'RST Ltd.', 120),
('ORG/2023/021', 'UVW Corporation', 121),
('ORG/2023/022', 'HIJ Inc.', 122),
('ORG/2023/023', 'NOP Enterprises', 123),
('ORG/2023/024', 'GHI Co.', 124),
('ORG/2023/025', 'XYZ Corporation', 125),
('ORG/2023/026', 'ABC Ltd.', 126),
('ORG/2023/027', 'XYZ Corp.', 127),
('ORG/2023/028', 'LMN Inc.', 128),
('ORG/2023/029', 'PQR Enterprises', 129),
('ORG/2023/030', 'JKL Co.', 130);
-- select * from Organization;