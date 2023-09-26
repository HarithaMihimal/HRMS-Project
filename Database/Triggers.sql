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

    ELSE IF  NEW.Status = 'Approved' AND NEW.Type = 'Casual' THEN
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

    ELSE IF  NEW.Status = 'Approved' AND NEW.Type = 'No Pay' THEN
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

    ELSE IF  NEW.Status = 'Approved' AND NEW.Type = 'Maternity Leave' THEN
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
