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

create view leave_req_dept as
select Leave_Req_ID,Employee_ID,Start_Date,No_of_Days,Type,Status,Dept_ID 
from employee_data join leave_request
using (Employee_ID);

create view leave_req_dept_2 as
select Leave_Req_ID,Employee_ID,Start_Date,No_of_Days,Type,Status,Dept_Name
from leave_req_dept join department
using (Dept_ID);

CREATE VIEW leave_count_gender AS
SELECT Employee_ID,Gender, Annual, Casual, No_Pay, Maternity_Leave
FROM Employee_data JOIN leave_limit
USING (Pay_Grade_ID);

