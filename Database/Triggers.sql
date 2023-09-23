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
            SET @annual_leave_count := @annual_leave_count + 10;

            UPDATE employee_leave_count
            SET Annual = @annual_leave_count
            WHERE Employee_ID = NEW.Employee_ID;
        END IF;
    END IF;
END;
//