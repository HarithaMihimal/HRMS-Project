create database HRMS;
use hrms;

CREATE TABLE `Supervisor` (
  `Supervisor_ID` VARCHAR(255),
  `Subordinate_ID` VARCHAR(255),
  PRIMARY KEY (`Supervisor_ID`, `Subordinate_ID`)
);

CREATE TABLE `Dependent_Information` (
  `Dependent_ID` INT(12),
  `First_name` VARCHAR(255),
  `Last_name` VARCHAR(255),
  `Age` INT(3),
  `Relation` VARCHAR(255),
  `Gender` ENUM('Male', 'Female', 'Prefer not to say'),
  PRIMARY KEY (`Dependent_ID`)
);

CREATE TABLE `Leave_Request` (
  `Leave_Req_ID` INT(12),
  `Employee_ID` INT(12),
  `Date` DATE,
  `Type` ENUM('Annual', 'Casual', 'Maternity', 'No-pay'),
  `Status` ENUM('Approved', 'Pending', 'Rejected'),
  PRIMARY KEY (`Leave_Req_ID`)
);

CREATE TABLE `Branch` (
  `Branch_No` VARCHAR(255),
  `Branch_Name` VARCHAR(255),
  `Address` VARCHAR(255),
  `Currency` VARCHAR(3),
  PRIMARY KEY (`Branch_No`)
);

CREATE TABLE `Department` (
  `Dept_ID` INT(5),
  `Dept_name` VARCHAR(255),
  `Budget` NUMERIC(10, 2),
  PRIMARY KEY (`Dept_ID`)
);

CREATE TABLE `Pay_Grade` (
  `Pay_Grade_ID` VARCHAR(255),
  `Pay_Grade` VARCHAR(255),
  `Basic _salary` NUMERIC(10 ,2),
  PRIMARY KEY (`Pay_Grade_ID`)
);

CREATE TABLE `Employee_Data` (
  `Employee_ID` INT(12),
  `First_name` VARCHAR(255),
  `Last_name` VARCHAR(255),
  `Marital_status` ENUM('Married', 'Unmarried', 'Other', 'Prefer not to say'),
  `Birthday` DATE,
  `Contact_number` VARCHAR(255),
  `Email` VARCHAR(255),
  `Employment_status`  VARCHAR(255),
  `Job_Title` ENUM('HR Manager', 'Accountant', 'Software Engineer', 'QA Engineer'),
  `Pay_Grade_ID` VARCHAR(255),
  `Branch_No` VARCHAR(255),
  `Dept_ID` INT(5),
  `Dependent_ID` INT(12),
  PRIMARY KEY (`Employee_ID`),
  FOREIGN KEY (`Dependent_ID`) REFERENCES `Dependent_Information`(`Dependent_ID`),
  FOREIGN KEY (`Dept_ID`) REFERENCES `Department`(`Dept_ID`),
  FOREIGN KEY (`Branch_No`) REFERENCES `Branch`(`Branch_No`),
  FOREIGN KEY (`Pay_Grade_ID`) REFERENCES `Pay_Grade`(`Pay_Grade_ID`),
  FOREIGN KEY (`Employment_status`) REFERENCES `Employment_Status`(`Status_ID`)
);

CREATE TABLE `Leave_Limit` (
  `Pay_Grade_ID` VARCHAR(255),
  `Annual` INT(3),
  `Casual` INT(3),
  `No-Pay` INT(3),
  `Maternity_Leave` INT(3),
  PRIMARY KEY (`Pay_Grade_ID`)
);

CREATE TABLE `Employee_Custom_Attribute` (
  `Attribute_ID` INT(12),
  `Employee_ID` INT(12),
  `Value` VARCHAR(255),
  PRIMARY KEY (`Attribute_ID`, `Employee_ID`),
  FOREIGN KEY (`Employee_ID`) REFERENCES `Employee_Data`(`Employee_ID`)
);

CREATE TABLE `Custom_Attribute_Definition` (
  `Attribute_ID` INT(12),
  `Attribute_Name` VARCHAR(255),
  PRIMARY KEY (`Attribute_ID`),
  FOREIGN KEY (`Attribute_ID`) REFERENCES `Employee_Custom_Attribute`(`Attribute_ID`)
);

CREATE TABLE `Contact_Number_Details` (
  `Employee_ID` INT(12),
  `Contact_number` INT(10),
  PRIMARY KEY (`Employee_ID`, `Contact_number`),
  FOREIGN KEY (`Employee_ID`) REFERENCES `Employee_Data`(`Employee_ID`)
);

CREATE TABLE `Employee_Leave_Count` (
  `Employee_ID` INT(12),
  `Annual` INT(3),
  `Casual` INT(3),
  `No-Pay` INT(3),
  `Maternity_Leave` INT(3),
  PRIMARY KEY (`Employee_ID`)
);

CREATE TABLE `Employee_Account` (
  `User_ID` VARCHAR(255),
  `Employee_ID` INT(12),
  `Password` VARCHAR(255),
  `Profile_Pic` Blob,
  PRIMARY KEY (`User_ID`)
);

CREATE TABLE `Employment_Status` (
  `Status_ID` INT(12),
  `Status` VARCHAR(255),
  PRIMARY KEY (`Status_ID`)
);


show tables;
