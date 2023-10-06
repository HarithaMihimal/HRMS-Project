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


DELIMITER $$
CREATE TRIGGER EmployeeInsert
BEFORE INSERT ON employee_data
FOR EACH ROW
BEGIN
    DECLARE prefix VARCHAR(3);
    IF NEW.Job_Title = 'HR Manager' THEN
        SET prefix = 'HRM';
    ELSE
        SET prefix = 'EMP';
    END IF;
    IF (SELECT Employee_ID FROM employee_data) IS NULL THEN
        SET NEW.Employee_ID = CONCAT(prefix, LPAD(1, 4, '0'));
    ELSE
        SET @new_id = (SELECT MAX(CAST(SUBSTRING(Employee_ID, 4) AS SIGNED)) + 1 FROM employee_data);
        SET NEW.Employee_ID = CONCAT(prefix, LPAD(@new_id, 4, '0'));
    END IF;
END;
$$
DELIMITER ;


DELIMITER $$
CREATE TRIGGER DependentInsert
BEFORE INSERT ON dependent_information
FOR EACH ROW
BEGIN
	IF (SELECT Dependent_ID FROM dependent_information) IS NULL THEN
		SET NEW.Dependent_ID = CONCAT('DEP', LPAD(1, 4, '0'));
    ELSE
		SET @new_id = (SELECT MAX(CAST(SUBSTRING(Dependent_ID, 4) AS SIGNED)) + 1 FROM dependent_information);
		SET NEW.Dependent_ID = CONCAT('DEP', LPAD(@new_id, 4, '0'));
	END IF;
END;
$$
DELIMITER ;


DELIMITER $$
CREATE TRIGGER BranchInsert
BEFORE INSERT ON branch
FOR EACH ROW
BEGIN
	IF (SELECT Branch_ID FROM branch) IS NULL THEN
		SET NEW.Branch_ID = CONCAT('BR', LPAD(1, 3, '0'));
    ELSE
		SET @new_id = (SELECT MAX(CAST(SUBSTRING(Branch_ID, 4) AS SIGNED)) + 1 FROM branch);
		SET NEW.Branch_ID = CONCAT('BR', LPAD(@new_id, 3, '0'));
	END IF;
END;
$$
DELIMITER ;


DELIMITER $$
CREATE TRIGGER DepartmentInsert
BEFORE INSERT ON department
FOR EACH ROW
BEGIN
	IF (SELECT Dept_ID FROM department) IS NULL THEN
		SET NEW.Dept_ID = CONCAT('DEPT', LPAD(1, 3, '0'));
    ELSE
		SET @new_id = (SELECT MAX(CAST(SUBSTRING(Dept_ID, 4) AS SIGNED)) + 1 FROM department);
		SET NEW.Dept_ID = CONCAT('DEPT', LPAD(@new_id, 3, '0'));
	END IF;
END;
$$
DELIMITER ;


DELIMITER $$
CREATE TRIGGER OrganizationInsert
BEFORE INSERT ON organization
FOR EACH ROW
BEGIN
    DECLARE prefix VARCHAR(8);
    SET prefix = CONCAT('ORG', YEAR(NEW.Start_Date));
	IF (SELECT Registration_No FROM organization) IS NULL THEN
		SET NEW.Registration_No = CONCAT(prefix, LPAD(1, 3, '0'));
    ELSE
		SET @new_id = (SELECT MAX(CAST(SUBSTRING(Registration_No, 4) AS SIGNED)) + 1 FROM organization);
		SET NEW.Registration_No = CONCAT(prefix, LPAD(@new_id, 3, '0'));
	END IF;
END;
$$
DELIMITER ;
