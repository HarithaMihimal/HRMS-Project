USE HRMS;


-- Procedure for adding new employee
DELIMITER $$
CREATE PROCEDURE AddEmployee(
    IN firstName VARCHAR(255),
    IN lastName VARCHAR(255),
    IN gender ENUM('Male', 'Female', 'Other', 'Prefer not to say'),
    IN maritalStatus ENUM('Married', 'Unmarried', 'Other', 'Prefer not to say'),
    IN birthday DATE,
    IN email VARCHAR(255),
    IN employmentStatus VARCHAR(255),
    IN jobTitle ENUM('HR Manager', 'Accountant', 'Software Engineer', 'QA Engineer'),
    IN payGrade VARCHAR(255),
    IN branchName VARCHAR(255),
    IN departmentName VARCHAR(255),
    
    IN haveDependent BOOLEAN,
    
    IN username VARCHAR(255),
    IN password VARCHAR(255),
    
    IN contactNumbers JSON
)
BEGIN
    DECLARE employeeID VARCHAR(10);
    DECLARE dependentId VARCHAR(10);
    DECLARE numContacts INT;
    DECLARE i INT DEFAULT 0;
    
    SELECT Status_ID INTO employmentStatus FROM Employment_Status WHERE Status = employmentStatus;
    SELECT Pay_Grade_ID INTO payGrade FROM Pay_Grade WHERE Pay_Grade = payGrade;
    SELECT Branch_ID INTO branchName FROM Branch WHERE Branch_Name = branchName;
    SELECT Dept_ID INTO departmentName FROM Department WHERE Dept_name = departmentName;
    
    SET dependentId = NULL;
    
    IF haveDependent = TRUE THEN
        SELECT Dependent_ID INTO dependentId FROM Dependent_Information ORDER BY Timestamp DESC LIMIT 1;
    END IF;
    
    INSERT INTO Employee_Data (First_name, Last_name, Gender, Marital_status, Birthday, Email, Employment_status, Job_Title, Pay_Grade_ID, Branch_ID, Dept_ID, Dependent_ID)
    VALUES (firstName, lastName, gender, maritalStatus, birthday, NULLIF(email, ""), employmentStatus, jobTitle, payGrade, branchName, departmentName, dependentId);
    
    -- Get the Employee_ID of the newly inserted employee
    SELECT Employee_ID INTO employeeID FROM Employee_Data ORDER BY Timestamp DESC LIMIT 1;
    
    -- Loop to insert new contact numbers
    SET numContacts = JSON_LENGTH(contactNumbers);

    WHILE i < numContacts DO
        INSERT INTO Contact_Number_Details (Employee_id, Contact_Number)
        VALUES (employeeID, JSON_UNQUOTE(JSON_EXTRACT(contactNumbers, CONCAT('$[', i, ']'))));
        SET i = i + 1;
    END WHILE;
    
    -- Insert account information into Employee_account table
    INSERT INTO Employee_account (Employee_ID, User_ID, Password) VALUES (employeeID, username, password);
    
END $$
DELIMITER ;



-- Procedure for update employee data
DELIMITER //

CREATE PROCEDURE Update_Employee_Data(
	IN employeeID VARCHAR(10),
    IN firstName VARCHAR(255),
    IN lastName VARCHAR(255),
    IN gender ENUM('Male', 'Female', 'Other', 'Prefer not to say'),
    IN maritalStatus ENUM('Married', 'Unmarried', 'Other', 'Prefer not to say'),
    IN birthday DATE,
    IN email VARCHAR(255),
    IN jobTitle ENUM('HR Manager', 'Accountant', 'Software Engineer', 'QA Engineer'),
    IN payGrade VARCHAR(255),
    IN branch VARCHAR(255),
    IN department VARCHAR(255),
    IN employmentStatus VARCHAR(255),
    
    IN dependentID VARCHAR(10),
    IN dFirstName VARCHAR(255),
    IN dLastName VARCHAR(255),
    IN dGender ENUM('Male', 'Female', 'Other', 'Prefer not to say'),
    IN age INT,
    IN relation VARCHAR(255),
    
    IN contactNumbers JSON
)

BEGIN
	DECLARE i INT DEFAULT 0;
    DECLARE numContacts INT;

    -- Update employee data in the employee_data table
    UPDATE Employee_data
    SET First_Name = firstName,
        Last_Name = lastName,
        Gender = gender,
        Marital_Status = maritalStatus,
        Birthday = birthday,
        Email = NULLIF(email, ""),
        Employment_Status = (SELECT Status_ID from Employment_Status WHERE Status = employmentStatus),
        Job_Title = jobTitle,
        Pay_Grade_ID = (SELECT Pay_Grade_ID from Pay_Grade WHERE Pay_Grade = payGrade),
        Branch_ID = (SELECT Branch_ID from Branch WHERE Branch_Name = branch),
        Dept_ID = (SELECT Dept_ID from Department WHERE Dept_Name = department),
        Dependent_ID = dependentID
    WHERE employee_id = employeeID;
    
    -- Check if dependentID is not null and update dependent information
    IF dependentID IS NOT NULL THEN
        UPDATE Dependent_Information
        SET First_Name = dFirstName,
            Last_Name = dLastName,
            Gender = dGender,
            Age = age,
            Relation = relation
        WHERE Dependent_ID = dependentID;
    END IF;
    
    -- Delete all existing contact numbers for the employee
    DELETE FROM Contact_Number_Details
    WHERE Employee_ID = employeeID;

    -- Loop to insert new contact numbers without double quotes
    SET numContacts = JSON_LENGTH(contactNumbers);

    WHILE i < numContacts DO
        INSERT INTO Contact_Number_Details (Employee_id, Contact_Number)
        VALUES (employeeID, JSON_UNQUOTE(JSON_EXTRACT(contactNumbers, CONCAT('$[', i, ']'))));
        SET i = i + 1;
    END WHILE;
    
END //

DELIMITER ;
