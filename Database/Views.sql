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
