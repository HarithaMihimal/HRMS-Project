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

-- Create a view to get all employee data for HR Managers
CREATE VIEW HRManagerEmployeeData AS
SELECT
    Employee_ID,First_Name,Last_Name,Gender,Marital_Status,Birthday,Email,Employment_Status,Job_Title,Pay_Grade_ID,Branch_ID,Dept_ID,Dependent_ID
FROM Employee_Data
WHERE Job_Title = 'HR Manager';

-- Create a view to get all employee data for Software Engineers
CREATE VIEW SoftwareEngineerEmployeeData AS
SELECT
    Employee_ID,First_Name,Last_Name,Gender,Marital_Status,Birthday,Email,Employment_Status,Job_Title,Pay_Grade_ID,Branch_ID,Dept_ID,Dependent_ID
FROM Employee_Data
WHERE Job_Title = 'Software Engineer';
-- Create a view to get all employee data for Accountants
CREATE VIEW AccountantEmployeeData AS
SELECT
    Employee_ID,First_Name,Last_Name,Gender,Marital_Status,Birthday,Email,Employment_Status,Job_Title,Pay_Grade_ID,Branch_ID,Dept_ID,Dependent_ID
FROM Employee_Data
WHERE Job_Title = 'Accountant';
-- Create a view to get all employee data for QA_Engineers
CREATE VIEW QA_EngineerEmployeeData AS
SELECT
    Employee_ID,First_Name,Last_Name,Gender,Marital_Status,Birthday,Email,Employment_Status,Job_Title,Pay_Grade_ID,Branch_ID,Dept_ID,Dependent_ID
FROM Employee_Data
WHERE Job_Title = 'QA Engineer';

-- Create a view to get employee data for the Human Resources department
CREATE VIEW FinanceDepartmentEmployeeData AS
SELECT Employee_ID, First_Name, Last_Name, Gender, Marital_Status, Birthday, Email, Employment_Status, Job_Title, Pay_Grade_ID, Branch_ID, Dept_ID, Dependent_ID
FROM Employee_Data
WHERE Dept_ID = 'DEPT002';

-- Create a view to get employee data for the Engineering department
CREATE VIEW EngineeringDepartmentEmployeeData AS
SELECT Employee_ID, First_Name, Last_Name, Gender, Marital_Status, Birthday, Email, Employment_Status, Job_Title, Pay_Grade_ID, Branch_ID, Dept_ID, Dependent_ID
FROM Employee_Data
WHERE Dept_ID = 'DEPT003';

-- Create a view to get employee data for the Human Resources department
CREATE VIEW HRDepartmentEmployeeData AS
SELECT Employee_ID, First_Name, Last_Name, Gender, Marital_Status, Birthday, Email, Employment_Status, Job_Title, Pay_Grade_ID, Branch_ID, Dept_ID, Dependent_ID
FROM Employee_Data
WHERE Dept_ID = 'DEPT001';

-- Create a view to get employee data for the Accounting department
CREATE VIEW AccountingDepartmentEmployeeData AS
SELECT Employee_ID, First_Name, Last_Name, Gender, Marital_Status, Birthday, Email, Employment_Status, Job_Title, Pay_Grade_ID, Branch_ID, Dept_ID, Dependent_ID
FROM Employee_Data
WHERE Dept_ID = 'DEPT004';


-- View for employees in Pay Grade 1
CREATE VIEW Pay_Grade_1_Employees AS
SELECT *
FROM Employee_Data
WHERE Pay_Grade_ID = 1;

-- View for employees in Pay Grade 2
CREATE VIEW Pay_Grade_2_Employees AS
SELECT *
FROM Employee_Data
WHERE Pay_Grade_ID = 2;

-- View for employees in Pay Grade 3
CREATE VIEW Pay_Grade_3_Employees AS
SELECT *
FROM Employee_Data
WHERE Pay_Grade_ID = 3;

-- View for employees in Pay Grade 4
CREATE VIEW Pay_Grade_4_Employees AS
SELECT *
FROM Employee_Data
WHERE Pay_Grade_ID = 4;


-- Create a view to generate Employee Report grouped by Branch
CREATE VIEW EmployeeReportByBranch AS
SELECT
    b.Branch_ID,
    b.Branch_Name,
    COUNT(*) AS EmployeeCount
FROM Employee_Data e
INNER JOIN Branch b ON e.Branch_ID = b.Branch_ID
GROUP BY b.Branch_ID, b.Branch_Name;


