create view emp_view AS
select
	t1.Employee_ID,
    t1.First_name,
    t1.Last_name,
    t1.Job_Title,
    t2.dept_name,
    t3.pay_grade
from
    employee_data AS t1
left join
    department AS t2 ON t1.Dept_ID = t2.Dept_ID
left join
	pay_grade AS t3 ON t1.Pay_Grade_ID = t3.Pay_Grade_ID;


create view password_check as
select Employee_ID,User_ID,Password,Job_Title 
from employee_account join employee_data 
using (Employee_ID);

create view leave_count as
select Employee_ID,Annual,Casual,No_Pay,Maternity_Leave from Employee_data join leave_limit using (Pay_Grade_ID);


-- View for get employee details to the view and edit employee pages
CREATE VIEW Employee_Details AS
SELECT 
    e.Employee_ID, e.First_Name, e.Last_Name, e.Gender, e.Marital_Status, e.Birthday, e.Email, e.Job_Title,
    d.Dependent_ID, d.First_Name AS dFirst_Name, d.Last_Name AS dLast_Name, d.Age, d.Gender AS dGender, d.Relation,
    a.User_ID,
    p.Pay_Grade,
    b.Branch_Name,
    s.Status AS Employment_Status,
    dept.Dept_Name

FROM Employee_Data e
LEFT JOIN Dependent_Information d ON e.Dependent_ID = d.Dependent_ID
JOIN Employee_Account a ON e.Employee_ID = a.Employee_ID
JOIN Pay_Grade p ON e.Pay_Grade_ID = p.Pay_Grade_ID
JOIN Branch b ON e.Branch_ID = b.Branch_ID
JOIN Employment_Status s ON e.Employment_Status = s.Status_ID
JOIN Department dept ON e.Dept_ID = dept.Dept_ID;

