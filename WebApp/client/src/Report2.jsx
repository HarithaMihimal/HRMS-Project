// eslint-disable-next-line no-unused-vars
import React, { useState, useEffect } from 'react';
import axios from 'axios';
import './styles/Supervisor.css';
const Report2 = () => {

  // State to store the employee data for HR Managers
  const [hrManagerData, setHRManagerData] = useState([]);

  // Function to fetch employee data for HR Managers from your API
  const fetchHRManagerData = async () => {
    try {
      const response = await axios.get('http://localhost:3000/employee_data_Title_HRManager'); // Replace with your API endpoint
      setHRManagerData(response.data);
    } catch (error) {
      console.error('Error fetching HR Manager data:', error);
    }
  };

  useEffect(() => {
    fetchHRManagerData();
  }, []); // Fetch data when the component mounts

  const [softwareEngineerData, setSoftwareEngineerData] = useState([]);

  // Function to fetch employee data for Software Engineers from your API
  const fetchSoftwareEngineerData = async () => {
    try {
      const response = await axios.get('http://localhost:3000/employee_data_Title_SoftwareEngineer'); // Replace with your API endpoint
      setSoftwareEngineerData(response.data);
    } catch (error) {
      console.error('Error fetching Software Engineer data:', error);
    }
  };

  useEffect(() => {
    fetchSoftwareEngineerData();
  }, []); // Fetch data when the component mounts

  const [accountantData, setAccountantData] = useState([]);

  // Function to fetch employee data for Accountants from your API
  const fetchAccountantData = async () => {
    try {
      const response = await axios.get('http://localhost:3000/employee_data_Title_Accountant'); // Replace with your API endpoint
      setAccountantData(response.data);
    } catch (error) {
      console.error('Error fetching Accountant data:', error);
    }
  };

  useEffect(() => {
    fetchAccountantData();
  }, []); // Fetch data when the component mounts
  const [qaEngineerData, setQAEngineerData] = useState([]);

  // Function to fetch employee data for QA Engineers from your API
  const fetchQAEngineerData = async () => {
    try {
      const response = await axios.get('http://localhost:3000/employee_data_Title_QA_Engineer'); // Replace with your API endpoint
      setQAEngineerData(response.data);
    } catch (error) {
      console.error('Error fetching QA Engineer data:', error);
    }
  };

  useEffect(() => {
    fetchQAEngineerData();
  }, []); // Fetch dat




  ///// department 
  const [financeData, setFinanceData] = useState([]);
  const [hrData, setHrData] = useState([]);
  const [accountingData, setAccountingData] = useState([]);
  const [engineeringData, setEngineeringData] = useState([]);

  const fetchFinanceData = async () => {
    try {
      const response = await axios.get('http://localhost:3000/employee_data_FinanceDepartmentEmployeeData');
      setFinanceData(response.data);
    } catch (error) {
      console.error('Error fetching Finance data:', error);
    }
  };

  const fetchHrData = async () => {
    try {
      const response = await axios.get('http://localhost:3000/employee_data_HRDepartmentEmployeeData');
      setHrData(response.data);
    } catch (error) {
      console.error('Error fetching HR data:', error);
    }
  };

  const fetchAccountingData = async () => {
    try {
      const response = await axios.get('http://localhost:3000/employee_data_AccountingDepartmentEmployeeData');
      setAccountingData(response.data);
    } catch (error) {
      console.error('Error fetching Accounting data:', error);
    }
  };

  const fetchEngineeringData = async () => {
    try {
      const response = await axios.get('http://localhost:3000/employee_data_EngineeringDepartmentEmployeeData');
      setEngineeringData(response.data);
    } catch (error) {
      console.error('Error fetching Engineering data:', error);
    }
  };

  useEffect(() => {
    fetchFinanceData();
    fetchHrData();
    fetchAccountingData();
    fetchEngineeringData();
  }, []);










  // eslint-disable-next-line no-unused-vars
  const [departmentReports, setDepartmentReports] = useState([]);
  // Function to fetch department data from your API
  const fetchDepartmentData = async () => {
    try {
      const response = await axios.get('http://localhost:3000/employee_data2'); // Replace with your API endpoint
      setDepartmentReports(response.data);
    } catch (error) {
      console.error('Error fetching department data:', error);
    }
  };

  useEffect(() => {
    fetchDepartmentData();
  }, []); // Fetch data when the component mounts


  // State to store the pay grade data
  const [payGradeReports, setPayGradeReports] = useState([]);

  // Function to fetch pay grade data from your API
  const fetchPayGradeData = async () => {
    try {
      const response = await axios.get('http://localhost:3000/employee_data3'); // Replace with your API endpoint
      setPayGradeReports(response.data);
    } catch (error) {
      console.error('Error fetching pay grade data:', error);
    }
  };

  useEffect(() => {
    fetchPayGradeData();
  }, []); // Fetch data when the component mounts

   // State to store the branch data
   const [branchReports, setBranchReports] = useState([]);

   // Function to fetch branch data from your API
   const fetchBranchData = async () => {
     try {
       const response = await axios.get('http://localhost:3000/employee_data4'); // Replace with your API endpoint
       setBranchReports(response.data);
     } catch (error) {
       console.error('Error fetching branch data:', error);
     }
   };
 
   useEffect(() => {
     fetchBranchData();
   }, []); // Fetch data when the component mounts

   


  return (
    <div>
      <h1>HR Manager Employee Data</h1>
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
          {hrManagerData.map((employee) => (
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
 <h1>Software Engineer Employee Data</h1>
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
          {softwareEngineerData.map((employee) => (
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
      <h1>Accountant Employee Data</h1>
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
          {accountantData.map((employee) => (
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

      
      <h1>QA Engineer Employee Data</h1>
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
          {qaEngineerData.map((employee) => (
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
<h1>Finance Department Employee Data</h1>
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
          {financeData.map((employee) => (
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
  
      <h1>HR Department Employee Data</h1>
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
          {hrData.map((employee) => (
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
        
<h1>Account Department Employee Data</h1>
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
          {accountingData.map((employee) => (
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
        
<h1>Engineering Department Employee Data</h1>
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
          {engineeringData.map((employee) => (
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
      <h1>Employee Report by Pay Grade</h1>
      <table>
        <thead>
          <tr>
            <th>Pay Grade ID</th>
            <th>Pay Grade</th>
            <th>Employee Count</th>
          </tr>
        </thead>
        <tbody>
          {payGradeReports.map((report) => (
            <tr key={report.Pay_Grade_ID}>
              <td>{report.Pay_Grade_ID}</td>
              <td>{report.Pay_Grade}</td>
              <td>{report.EmployeeCount}</td>
            </tr>
          ))}
        </tbody>
      </table>

      <h1>Employee Report by Branch</h1>
      <table>
        <thead>
          <tr>
            <th>Branch ID</th>
            <th>Branch Name</th>
            <th>Employee Count</th>
          </tr>
        </thead>
        <tbody>
          {branchReports.map((report) => (
            <tr key={report.Branch_ID}>
              <td>{report.Branch_ID}</td>
              <td>{report.Branch_Name}</td>
              <td>{report.EmployeeCount}</td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>


  );
};

export default Report2;
