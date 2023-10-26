// eslint-disable-next-line no-unused-vars
import React, { useState, useEffect } from 'react';
import axios from 'axios';
import './styles/Supervisor.css';
const Report2 = () => {

  // State to store the employee data for HR Managers
  const [hrManagerData, setHRManagerData] = useState([]);
  const [softwareEngineerData, setSoftwareEngineerData] = useState([]);
  const [accountantData, setAccountantData] = useState([]);
  const [qaEngineerData, setQAEngineerData] = useState([]);
  const [financeData, setFinanceData] = useState([]);
  const [hrData, setHrData] = useState([]);
  const [accountingData, setAccountingData] = useState([]);
  const [engineeringData, setEngineeringData] = useState([]);
  const [payGrade1Data, setPayGrade1Data] = useState([]);
  const [payGrade2Data, setPayGrade2Data] = useState([]);
  const [payGrade3Data, setPayGrade3Data] = useState([]);
  const [payGrade4Data, setPayGrade4Data] = useState([]);
  const [branchReports, setBranchReports] = useState([]);
  // Function to fetch employee data for HR Managers from your API

  useEffect(() => {
    fetchData();
  }, []); // Fetch data when the component mounts
  

  const fetchData = async (url, setDataFunction) => {
    try {
      const response = await axios.get(url);
      setDataFunction(response.data);
    } catch (error) {
      console.error('Error fetching data:', error);
    }
  };

  fetchData('http://localhost:3000/employee_data_Title_HRManager',setHRManagerData);
  fetchData('http://localhost:3000/employee_data_Title_SoftwareEngineer',setSoftwareEngineerData);
  fetchData('http://localhost:3000/employee_data_Title_Accountant',setAccountantData);
  fetchData('http://localhost:3000/employee_data_Title_QA_Engineer',setQAEngineerData);
  fetchData('http://localhost:3000/employee_data_FinanceDepartmentEmployeeData',setFinanceData);
  fetchData('http://localhost:3000/employee_data_HRDepartmentEmployeeData',setHrData);
  fetchData('http://localhost:3000/employee_data_EngineeringDepartmentEmployeeData',setEngineeringData);
  fetchData('http://localhost:3000/employee_data_AccountingDepartmentEmployeeData',setAccountingData);
  fetchData('http://localhost:3000/employee_data_pay_grade_1',setPayGrade1Data);
  fetchData('http://localhost:3000/employee_data_pay_grade_1',setPayGrade2Data);
  fetchData('http://localhost:3000/employee_data_pay_grade_1',setPayGrade3Data);
  fetchData('http://localhost:3000/employee_data_pay_grade_1',setPayGrade4Data);
  fetchData('http://localhost:3000/employee_data4',setBranchReports);
  

   const renderTable = (data, title) => (
    <div>
      <h1>{title}</h1>
      <table>
        <thead>
          <tr>
            <th>Employee ID</th>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Gender</th>
            <th>Marital Status</th>
            <th>Birthday</th>
            <th>Email</th>
            <th>Employment Status</th>
            <th>Pay Grade ID</th>
            <th>Branch ID</th>
            <th>Department ID</th>
            <th>Dependent ID</th>
          </tr>
        </thead>
        <tbody>
          {data.map((employee) => (
            <tr key={employee.Employee_ID}>
              <td>{employee.Employee_ID}</td>
              <td>{employee.First_Name}</td>
              <td>{employee.Last_Name}</td>
              <td>{employee.Gender}</td>
              <td>{employee.Marital_Status}</td>
              <td>{employee.Birthday}</td>
              <td>{employee.Email}</td>
              <td>{employee.Employment_Status}</td>
              <td>{employee.Pay_Grade_ID}</td>
              <td>{employee.Branch_ID}</td>
              <td>{employee.Dept_ID}</td>
              <td>{employee.Dependent_ID}</td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );

  return (
   
<dev>
{renderTable(hrManagerData, "HR Manager Employee Data")};
{renderTable(softwareEngineerData, 'Software Engineer Employee Data')}
{renderTable(accountantData, 'Accountant Employee Data')}
{renderTable(qaEngineerData, 'QA Engineer Employee Data')}
{renderTable(financeData, 'Finance Department Employee Data')}
{renderTable(hrData, 'HR Department Employee Data')}
{renderTable(accountingData, 'Account Department Employee Data')}
{renderTable(engineeringData, 'Engineering Department Employee Data')}
{renderTable(payGrade1Data, 'payGrade L1 Employee Data')}
{renderTable(payGrade2Data, 'payGrade L2 Employee Data')}
{renderTable(payGrade3Data, 'payGrade L3 Employee Data')}
{renderTable(payGrade4Data, 'payGrade L4 Employee Data')}
{renderTable(branchReports, 'Employee Report by Branch')}

</dev>
  );
};

export default Report2;
