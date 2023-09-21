create database HRMS;
use hrms;

CREATE TABLE `Supervisor` (
  `Supervisor_ID` VARCHAR(255) NOT NULL AUTO_INCREMENT,
  `Subordinate_ID` VARCHAR(255) NOT NULL,
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

CREATE TABLE `Leave_Request` (
  `Leave_Req_ID` INT(12) NOT NULL AUTO_INCREMENT,
  `Employee_ID` INT(12) NOT NULL,
  `Date` DATE NOT NULL,
  `Type` ENUM('Annual', 'Casual', 'Maternity', 'No-pay') NOT NULL,
  `Status` ENUM('Approved', 'Pending', 'Rejected') NOT NULL,
  PRIMARY KEY (`Leave_Req_ID`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `Branch` (
  `Branch_No` VARCHAR(255) NOT NULL AUTO_INCREMENT,
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
  `Pay_Grade_ID` VARCHAR(255) NOT NULL AUTO_INCREMENT,
  `Pay_Grade` VARCHAR(255) NOT NULL,
  `Basic _salary` NUMERIC(10 ,2) NOT NULL,
  PRIMARY KEY (`Pay_Grade_ID`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `Employee_Data` (
  `Employee_ID` INT(12) NOT NULL AUTO_INCREMENT,
  `First_name` VARCHAR(255) NOT NULL,
  `Last_name` VARCHAR(255) NOT NULL,
  `Marital_status` ENUM('Married', 'Unmarried', 'Other', 'Prefer not to say') NOT NULL,
  `Birthday` DATE NOT NULL,
  `Contact_number` VARCHAR(255) NOT NULL,
  `Email` VARCHAR(255) ,
  `Employment_status`  VARCHAR(255) NOT NULL,
  `Job_Title` ENUM('HR Manager', 'Accountant', 'Software Engineer', 'QA Engineer') NOT NULL,
  `Pay_Grade_ID` VARCHAR(255) NOT NULL,
  `Branch_No` VARCHAR(255) NOT NULL,
  `Dept_ID` INT(5) NOT NULL,
  `Dependent_ID` INT(12),
  PRIMARY KEY (`Employee_ID`),
  FOREIGN KEY (`Dependent_ID`) REFERENCES `Dependent_Information`(`Dependent_ID`),
  FOREIGN KEY (`Dept_ID`) REFERENCES `Department`(`Dept_ID`),
  FOREIGN KEY (`Branch_No`) REFERENCES `Branch`(`Branch_No`),
  FOREIGN KEY (`Pay_Grade_ID`) REFERENCES `Pay_Grade`(`Pay_Grade_ID`),
  FOREIGN KEY (`Employment_status`) REFERENCES `Employment_Status`(`Status_ID`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `Leave_Limit` (
  `Pay_Grade_ID` VARCHAR(255) NOT NULL,
  `Annual` INT(3) NOT NULL,
  `Casual` INT(3) NOT NULL,
  `No-Pay` INT(3) NOT NULL,
  `Maternity_Leave` INT(3) NOT NULL,
  PRIMARY KEY (`Pay_Grade_ID`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `Employee_Custom_Attribute` (
  `Attribute_ID` INT(12) NOT NULL,
  `Employee_ID` INT(12) NOT NULL,
  `Value` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`Attribute_ID`, `Employee_ID`),
  FOREIGN KEY (`Employee_ID`) REFERENCES `Employee_Data`(`Employee_ID`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `Custom_Attribute_Definition` (
  `Attribute_ID` INT(12) NOT NULL AUTO_INCREMENT,
  `Attribute_Name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`Attribute_ID`),
  FOREIGN KEY (`Attribute_ID`) REFERENCES `Employee_Custom_Attribute`(`Attribute_ID`)
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
  `No-Pay` INT(3)NOT NULL,
  `Maternity_Leave` INT(3) NOT NULL,
  PRIMARY KEY (`Employee_ID`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `Employee_Account` (
  `User_ID` VARCHAR(255) NOT NULL,
  `Employee_ID` INT(12) NOT NULL,
  `Password` VARCHAR(255) NOT NULL,
  `Profile_Pic` Blob,
  PRIMARY KEY (`User_ID`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `Employment_Status` (
  `Status_ID` INT(12) NOT NULL AUTO_INCREMENT,
  `Status` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`Status_ID`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


show tables;
