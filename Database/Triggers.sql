-- Trigger for update employee leave count
DELIMITER //
CREATE TRIGGER UpdateEmployeeLeaveCount
AFTER UPDATE ON leave_request
FOR EACH ROW
BEGIN
    IF NEW.Status = 'Approved' AND NEW.Type = 'Annual' THEN
        SET @annual_leave_count := 0;

       SELECT Annual INTO @annual_leave_count
        FROM employee_leave_count
        WHERE Employee_ID = NEW.Employee_ID;

        IF @annual_leave_count IS NOT NULL THEN
            SET @annual_leave_count := @annual_leave_count + NEW.No_Of_Days;

            UPDATE employee_leave_count
            SET Annual = @annual_leave_count
            WHERE Employee_ID = NEW.Employee_ID;
        END IF;

    ELSEIF  NEW.Status = 'Approved' AND NEW.Type = 'Casual' THEN
        SET @casual_leave_count := 0;

        SELECT Casual INTO @casual_leave_count
        FROM employee_leave_count
        WHERE Employee_ID = NEW.Employee_ID;

        IF @casual_leave_count IS NOT NULL THEN
            SET @casual_leave_count := @casual_leave_count + NEW.No_Of_Days;

            UPDATE employee_leave_count
            SET Casual = @casual_leave_count
            WHERE Employee_ID = NEW.Employee_ID;
        END IF;

    ELSEIF  NEW.Status = 'Approved' AND NEW.Type = 'No_Pay' THEN
        SET @no_pay_leave_count := 0;

        SELECT No_Pay INTO @no_pay_leave_count
        FROM employee_leave_count
        WHERE Employee_ID = NEW.Employee_ID;

        IF @no_pay_leave_count IS NOT NULL THEN
            SET @no_pay_leave_count := @no_pay_leave_count + NEW.No_Of_Days;

            UPDATE employee_leave_count
            SET No_Pay = @no_pay_leave_count
            WHERE Employee_ID = NEW.Employee_ID;
        END IF;

    ELSEIF  NEW.Status = 'Approved' AND NEW.Type = 'Maternity_Leave' THEN
        SET @maternity_leave_count := 0;

        SELECT Maternity_Leave INTO @maternity_leave_count
        FROM employee_leave_count
        WHERE Employee_ID = NEW.Employee_ID;

        IF @maternity_leave_count IS NOT NULL THEN
            SET @maternity_leave_count := @maternity_leave_count + NEW.No_Of_Days;

            UPDATE employee_leave_count
            SET Maternity_Leave = @maternity_leave_count
            WHERE Employee_ID = NEW.Employee_ID;
        END IF;
    END IF;
END;
//
DELIMITER ;


-- Trigger for insert new employee leave count
DELIMITER //
CREATE TRIGGER InsertNewEmployee
AFTER INSERT ON employee_data
FOR EACH ROW
BEGIN
    INSERT INTO employee_leave_count (Employee_ID, Annual, Casual, No_Pay, Maternity_Leave)
    VALUES (NEW.Employee_ID, 0, 0, 0, 0);
END;
//
DELIMITER ;


-- Trigger for auto increment employee ID
DELIMITER $$
CREATE TRIGGER EmployeeInsert
BEFORE INSERT ON employee_data
FOR EACH ROW
BEGIN
    DECLARE max_id INT;
    DECLARE prefix VARCHAR(3);
    
    IF NEW.Job_Title = 'HR Manager' THEN
        SET prefix = 'HRM';
    ELSE
        SET prefix = 'EMP';
    END IF;
    
    SELECT MAX(CAST(SUBSTRING(Employee_ID, 4) AS SIGNED)) INTO max_id
    FROM employee_data;
    
    IF max_id IS NULL THEN
        SET max_id = 0;
    END IF;

    SET NEW.Employee_ID = CONCAT(prefix, LPAD(max_id + 1, 4, '0'));
END;
$$
DELIMITER ;


-- Trigger for auto increment dependent ID
DELIMITER $$
CREATE TRIGGER DependentInsert
BEFORE INSERT ON dependent_information
FOR EACH ROW
BEGIN
    DECLARE max_id INT;
    
    SELECT MAX(CAST(SUBSTRING(Dependent_ID, 4) AS SIGNED)) INTO max_id
    FROM dependent_information;
    
    IF max_id IS NULL THEN
        SET max_id = 0;
    END IF;

    SET NEW.Dependent_ID = CONCAT('DEP', LPAD(max_id + 1, 4, '0'));
END;
$$
DELIMITER ;


-- Trigger for auto increment branch ID
DELIMITER $$
CREATE TRIGGER BranchInsert
BEFORE INSERT ON branch
FOR EACH ROW
BEGIN
    DECLARE max_id INT;
    
    SELECT MAX(CAST(SUBSTRING(Branch_ID, 3) AS SIGNED)) INTO max_id
    FROM branch;
    
    IF max_id IS NULL THEN
        SET max_id = 0;
    END IF;

    SET NEW.Branch_ID = CONCAT('BR', LPAD(max_id + 1, 3, '0'));
END;
$$
DELIMITER ;


-- Trigger for auto increment department ID
DELIMITER $$
CREATE TRIGGER DepartmentInsert
BEFORE INSERT ON department
FOR EACH ROW
BEGIN
    DECLARE max_id INT;
    
    SELECT MAX(CAST(SUBSTRING(Dept_ID, 5) AS SIGNED)) INTO max_id
    FROM department;
    
    IF max_id IS NULL THEN
        SET max_id = 0;
    END IF;

    SET NEW.Dept_ID = CONCAT('DEPT', LPAD(max_id + 1, 3, '0'));
END;
$$
DELIMITER ;


-- Trigger for auto increment organization ID
DELIMITER $$
CREATE TRIGGER OrganizationInsert
BEFORE INSERT ON organization
FOR EACH ROW
BEGIN
    DECLARE max_id INT;
    
    SELECT MAX(CAST(SUBSTRING(Registration_No, 10) AS SIGNED)) INTO max_id
    FROM organization;
    
    IF max_id IS NULL THEN
        SET max_id = 0;
    END IF;

    SET NEW.Registration_No = CONCAT('ORG/', YEAR(NEW.Start_Date), '/', LPAD(max_id + 1, 3, '0'));
END;
$$
DELIMITER ;


-- Trigger for set supervisor
DELIMITER $$
CREATE TRIGGER Set_Supervisor
AFTER INSERT ON employee_data
FOR EACH ROW
BEGIN
	DECLARE first_employee_id VARCHAR(10);
    
    IF NEW.job_title != 'HR Manager' THEN
        SELECT employee_id INTO first_employee_id
        FROM employee_data
        WHERE job_title = NEW.job_title
        ORDER BY employee_id
        LIMIT 1;

        IF first_employee_id IS NOT NULL THEN
            INSERT INTO supervisor (supervisor_id, subordinate_id)
            VALUES (first_employee_id, NEW.employee_id);
        END IF;
    END IF;
END $$
DELIMITER ;

