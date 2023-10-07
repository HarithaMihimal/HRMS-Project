create database HRMS;
use hrms;

CREATE TABLE `Organization` (
  `Registration_No` VARCHAR(15) NOT NULL,     -- ORG/2023/001
  `Name` VARCHAR(255) NOT NULL,
  `Start_Date` DATE NOT NULL,
  PRIMARY KEY (`Registration_No`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `Branch` (
  `Branch_ID` VARCHAR(10) NOT NULL,     -- BR001
  `Branch_Name` VARCHAR(255) NOT NULL,
  `Address` VARCHAR(255) NOT NULL,
  `Currency` VARCHAR(3) NOT NULL,
  PRIMARY KEY (`Branch_ID`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `Department` (
  `Dept_ID` VARCHAR(10) NOT NULL,     -- DEPT001
  `Dept_Name` VARCHAR(255) NOT NULL,
  `Budget` NUMERIC(10, 2) NOT NULL,
  PRIMARY KEY (`Dept_ID`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `Employment_Status` (
  `Status_ID` INT NOT NULL AUTO_INCREMENT,
  `Status` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`Status_ID`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `Pay_Grade` (
  `Pay_Grade_ID` INT NOT NULL AUTO_INCREMENT,
  `Pay_Grade` VARCHAR(255) NOT NULL,
  `Basic_Salary` NUMERIC(10, 2) NOT NULL,
  PRIMARY KEY (`Pay_Grade_ID`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `Leave_Limit` (
  `Pay_Grade_ID` INT NOT NULL,
  `Annual` INT NOT NULL,
  `Casual` INT NOT NULL,
  `No_Pay` INT NOT NULL,
  `Maternity_Leave` INT NOT NULL,
  PRIMARY KEY (`Pay_Grade_ID`),
  FOREIGN KEY (`Pay_Grade_ID`) REFERENCES `Pay_Grade`(`Pay_Grade_ID`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `Dependent_Information` (
  `Dependent_ID` VARCHAR(10) NOT NULL,     -- DEP0001
  `First_Name` VARCHAR(255) NOT NULL,
  `Last_Name` VARCHAR(255) NOT NULL,
  `Age` INT NOT NULL,
  `Relation` VARCHAR(255) NOT NULL,
  `Gender` ENUM('Male', 'Female', 'Other', 'Prefer not to say') NOT NULL,
  `Timestamp` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Dependent_ID`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `Employee_Data` (
  `Employee_ID` VARCHAR(10) NOT NULL,    -- EMP0001, HRM0001
  `First_Name` VARCHAR(255) NOT NULL,
  `Last_Name` VARCHAR(255) NOT NULL,
  `Gender` ENUM('Male', 'Female', 'Other', 'Prefer not to say') NOT NULL,
  `Marital_Status` ENUM('Married', 'Unmarried', 'Other', 'Prefer not to say') NOT NULL,
  `Birthday` DATE NOT NULL,
  `Email` VARCHAR(255),
  `Employment_Status`  INT NOT NULL,
  `Job_Title` ENUM('HR Manager', 'Accountant', 'Software Engineer', 'QA Engineer') NOT NULL,
  `Pay_Grade_ID` INT NOT NULL,
  `Branch_ID` VARCHAR(10) NOT NULL,
  `Dept_ID` VARCHAR(10) NOT NULL,
  `Dependent_ID` VARCHAR(10),
  `Timestamp` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Employee_ID`),
  FOREIGN KEY (`Dependent_ID`) REFERENCES `Dependent_Information`(`Dependent_ID`),
  FOREIGN KEY (`Dept_ID`) REFERENCES `Department`(`Dept_ID`),
  FOREIGN KEY (`Branch_ID`) REFERENCES `Branch`(`Branch_ID`),
  FOREIGN KEY (`Pay_Grade_ID`) REFERENCES `Pay_Grade`(`Pay_Grade_ID`),
  FOREIGN KEY (`Employment_status`) REFERENCES `Employment_Status`(`Status_ID`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `Contact_Number_Details` (
  `Employee_ID` VARCHAR(10) NOT NULL,
  `Contact_Number` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`Employee_ID`, `Contact_Number`),
  FOREIGN KEY (`Employee_ID`) REFERENCES `Employee_Data`(`Employee_ID`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `Employee_Account` (
  `User_ID` VARCHAR(255) NOT NULL,
  `Employee_ID` VARCHAR(10) NOT NULL,
  `Password` VARCHAR(255) NOT NULL,
  `Profile_Picture` VARCHAR(255),
  PRIMARY KEY (`User_ID`),
  FOREIGN KEY (`Employee_ID`) REFERENCES `Employee_Data`(`Employee_ID`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `Supervisor` (
  `Supervisor_ID` VARCHAR(10) NOT NULL,
  `Subordinate_ID` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`Subordinate_ID`),
  FOREIGN KEY (`Supervisor_ID`) REFERENCES `Employee_Data`(`Employee_ID`),
  FOREIGN KEY (`Subordinate_ID`) REFERENCES `Employee_Data`(`Employee_ID`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `Custom_Attribute_Definition` (
  `Attribute_ID` INT NOT NULL AUTO_INCREMENT,
  `Attribute_Name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`Attribute_ID`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `Employee_Custom_Attribute` (
  `Attribute_ID` INT NOT NULL,
  `Employee_ID` VARCHAR(10) NOT NULL,
  `Value` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`Attribute_ID`, `Employee_ID`),
  FOREIGN KEY (`Employee_ID`) REFERENCES `Employee_Data`(`Employee_ID`),
  FOREIGN KEY (`Attribute_ID`) REFERENCES `Custom_Attribute_Definition`(`Attribute_ID`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `Employee_Leave_Count` (
  `Employee_ID` VARCHAR(10) NOT NULL,
  `Annual` INT NOT NULL,
  `Casual` INT NOT NULL,
  `No_Pay` INT NOT NULL,
  `Maternity_Leave` INT NOT NULL,
  PRIMARY KEY (`Employee_ID`),
  FOREIGN KEY (`Employee_ID`) REFERENCES `Employee_Data`(`Employee_ID`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `Leave_Request` (
  `Leave_Req_ID` INT NOT NULL AUTO_INCREMENT,
  `Employee_ID` VARCHAR(10) NOT NULL,
  `Start_Date` DATE NOT NULL,
  `No_of_Days` INT NOT NULL,
  `Type` ENUM('Annual', 'Casual', 'Maternity', 'No_pay') NOT NULL,
  `Status` ENUM('Approved', 'Pending', 'Rejected') NOT NULL,
  PRIMARY KEY (`Leave_Req_ID`),
  FOREIGN KEY (`Employee_ID`) REFERENCES `Employee_Data`(`Employee_ID`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

show tables;
