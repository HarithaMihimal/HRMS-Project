-- View for display employee data
CREATE VIEW emp_view AS
SELECT
	t1.Employee_ID,
    t1.First_name,
    t1.Last_name,
    t1.Job_Title,
    t2.dept_name,
    t3.pay_grade
FROM
    employee_data AS t1
LEFT JOIN
    department AS t2 ON t1.Dept_ID = t2.Dept_ID
LEFT JOIN
	pay_grade AS t3 ON t1.Pay_Grade_ID = t3.Pay_Grade_ID;


-- View for check password
CREATE VIEW password_check AS
SELECT Employee_ID, User_ID, Password, Job_Title 
FROM employee_account JOIN employee_data 
USING (Employee_ID);


-- View for display employee leave count
CREATE VIEW leave_count AS
SELECT Employee_ID, Annual, Casual, No_Pay, Maternity_Leave
FROM Employee_data JOIN leave_limit
USING (Pay_Grade_ID);

-- haritha report views

use hrms;
CREATE VIEW EmployeeDataByJobTitle AS
SELECT
    Job_Title,
    GROUP_CONCAT(Employee_ID ORDER BY Employee_ID) AS Employee_IDs,
    GROUP_CONCAT(CONCAT(First_Name, ' ', Last_Name) ORDER BY Employee_ID) AS Employee_Names,
    COUNT(*) AS EmployeeCount
FROM Employee_Data
GROUP BY Job_Title;

-- Query the EmployeeDataByJobTitle view
SELECT * FROM EmployeeDataByJobTitle;

-- Create a view to get all employee data for HR Managers
CREATE VIEW HRManagerEmployeeData AS
SELECT
    Employee_ID,First_Name,Last_Name,Gender,Marital_Status,Birthday,Email,Employment_Status,Job_Title,Pay_Grade_ID,Branch_ID,Dept_ID,Dependent_ID
FROM Employee_Data
WHERE Job_Title = 'HR Manager';


-- Query the HRManagerEmployeeData view
SELECT * FROM HRManagerEmployeeData;
-- Create a view to get all employee data for Software Engineers
CREATE VIEW SoftwareEngineerEmployeeData AS
SELECT
    Employee_ID,First_Name,Last_Name,Gender,Marital_Status,Birthday,Email,Employment_Status,Job_Title,Pay_Grade_ID,Branch_ID,Dept_ID,Dependent_ID
FROM Employee_Data
WHERE Job_Title = 'Software Engineer';

-- Query the SoftwareEngineerEmployeeData view
SELECT * FROM SoftwareEngineerEmployeeData;
-- Create a view to get all employee data for Accountants
CREATE VIEW AccountantEmployeeData AS
SELECT
    Employee_ID,First_Name,Last_Name,Gender,Marital_Status,Birthday,Email,Employment_Status,Job_Title,Pay_Grade_ID,Branch_ID,Dept_ID,Dependent_ID
FROM Employee_Data
WHERE Job_Title = 'Accountant';
-- Query the AccountantEmployeeData view
SELECT * FROM AccountantEmployeeData;
CREATE VIEW QA_EngineerEmployeeData AS
SELECT
    Employee_ID,First_Name,Last_Name,Gender,Marital_Status,Birthday,Email,Employment_Status,Job_Title,Pay_Grade_ID,Branch_ID,Dept_ID,Dependent_ID
FROM Employee_Data
WHERE Job_Title = 'QA Engineer';
-- Query the AccountantEmployeeData view
SELECT * FROM QA_EngineerEmployeeData;



-- Create a view to get employee data for the Human Resources department
CREATE VIEW FinanceDepartmentEmployeeData AS
SELECT Employee_ID, First_Name, Last_Name, Gender, Marital_Status, Birthday, Email, Employment_Status, Job_Title, Pay_Grade_ID, Branch_ID, Dept_ID, Dependent_ID
FROM Employee_Data
WHERE Dept_ID = 'DEPT002';

SELECT * FROM FinanceDepartmentEmployeeData;
-- Create a view to get employee data for the Engineering department
CREATE VIEW EngineeringDepartmentEmployeeData AS
SELECT Employee_ID, First_Name, Last_Name, Gender, Marital_Status, Birthday, Email, Employment_Status, Job_Title, Pay_Grade_ID, Branch_ID, Dept_ID, Dependent_ID
FROM Employee_Data
WHERE Dept_ID = 'DEPT003';
SELECT * FROM EngineeringDepartmentEmployeeData;

-- Create a view to get employee data for the Human Resources department
CREATE VIEW HRDepartmentEmployeeData AS
SELECT Employee_ID, First_Name, Last_Name, Gender, Marital_Status, Birthday, Email, Employment_Status, Job_Title, Pay_Grade_ID, Branch_ID, Dept_ID, Dependent_ID
FROM Employee_Data
WHERE Dept_ID = 'DEPT001';
SELECT * FROM HRDepartmentEmployeeData;

-- Create a view to get employee data for the Accounting department
CREATE VIEW AccountingDepartmentEmployeeData AS
SELECT Employee_ID, First_Name, Last_Name, Gender, Marital_Status, Birthday, Email, Employment_Status, Job_Title, Pay_Grade_ID, Branch_ID, Dept_ID, Dependent_ID
FROM Employee_Data
WHERE Dept_ID = 'DEPT004';

SELECT * FROM AccountingDepartmentEmployeeData;




-- Create a view to generate Employee Report grouped by Pay Grade
CREATE VIEW EmployeeReportByPayGrade AS
SELECT
    p.Pay_Grade_ID,
    p.Pay_Grade,
    COUNT(*) AS EmployeeCount
FROM Employee_Data e
INNER JOIN Pay_Grade p ON e.Pay_Grade_ID = p.Pay_Grade_ID
GROUP BY p.Pay_Grade_ID, p.Pay_Grade;
-- Query the EmployeeReportByPayGrade view
SELECT * FROM EmployeeReportByPayGrade;


-- Create a view to generate Employee Report grouped by Branch
CREATE VIEW EmployeeReportByBranch AS
SELECT
    b.Branch_ID,
    b.Branch_Name,
    COUNT(*) AS EmployeeCount
FROM Employee_Data e
INNER JOIN Branch b ON e.Branch_ID = b.Branch_ID
GROUP BY b.Branch_ID, b.Branch_Name;
-- Query the EmployeeReportByBranch view
SELECT * FROM EmployeeReportByBranch;

