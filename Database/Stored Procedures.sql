USE HRMS;

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
