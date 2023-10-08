import React, { useState, useEffect } from "react";
import { useNavigate } from 'react-router-dom';
import Axios from 'axios';
import { useParams } from 'react-router-dom';
import { useFormik } from 'formik';
import { addEmployeeSchema } from "./validations/AddEmployeeValidations";

function AddEmployee() {
  const { id_to_transfer } = useParams();
  const navigate = useNavigate();

  const emptyEmployeeData = {
    firstName: "",
    lastName: "",
    gender: "Choose...",
    maritalStatus: "Choose...",
    birthday: "",
    email: "",
    employmentStatus: "Choose...",
    jobTitle: "Choose...",
    payGrade: "Choose...",
    department: "Choose...",
    branch: "Choose..."
  };

  const emptyAccountData = {
    username: "",
    password: "",
    confirmPassword: ""
  }

  const [employeeData, setEmployeeData] = useState(emptyEmployeeData);
  const [accountData, setAccountData] = useState(emptyAccountData);
  const [haveDependent, setHaveDependent] = useState(false);

  const handleAddDependent = () => {
    // Save the current employee data to local storage
    localStorage.setItem('employeeData', JSON.stringify(employeeData));
    localStorage.setItem('accountData', JSON.stringify(accountData));

    navigate(`/PageHR/${id_to_transfer}/AddEmployee/AddDependent`);
  };

  const handleSubmit = (event) => {
    event.preventDefault();
    const data = {
      employeeData: employeeData,
      accountData: accountData,
      haveDependent: haveDependent
    }
    Axios.post("http://localhost:3000/addEmployee", data)
    .then(res => console.log(res.data))
    .catch(err => console.log(err));

    // Clear the saved data from local storage
    localStorage.removeItem('employeeData');
    localStorage.removeItem('accountData');
    localStorage.removeItem('haveDependent');

    setEmployeeData(emptyEmployeeData);
    setAccountData(emptyAccountData);
    setHaveDependent(false);
  }

  // Use useEffect to load data from local storage when the component mounts
  useEffect(() => {
    const savedEmployeeData = JSON.parse(localStorage.getItem('employeeData'));
    if (savedEmployeeData) {
      setEmployeeData(savedEmployeeData);
    }

    const savedAccountData = JSON.parse(localStorage.getItem('accountData'));
    if (savedAccountData) {
      setAccountData(savedAccountData);
    }

    const savedHaveDependent = JSON.parse(localStorage.getItem('haveDependent'));
    if (savedHaveDependent) {
      setHaveDependent(savedHaveDependent);
    }
  }, []);

  const [employmentStatusOptions, setEmploymentStatusOptions] = useState([]);
  useEffect(() => {
    Axios.get("http://localhost:3000/addEmployee/employmentStatus")
      .then(response => {
        setEmploymentStatusOptions(response.data);
      })
      .catch(error => {
        console.error('Error fetching data:', error);
      });
  }, []);

  const [payGradeOptions, setPayGradeOptions] = useState ([]);
  useEffect(() => {
    Axios.get("http://localhost:3000/addEmployee/payGrade")
      .then(response => {
        setPayGradeOptions(response.data);
      })
      .catch(error => {
        console.error('Error fetching data:', error);
      });
  }, []);

  const [departmentOptions, setDepartmentOptions] = useState ([]);
  useEffect(() => {
    Axios.get("http://localhost:3000/addEmployee/department")
      .then(response => {
        setDepartmentOptions(response.data);
      })
      .catch(error => {
        console.error('Error fetching data:', error);
      });
  }, []);

  const [branchOptions, setBranchOptions] = useState ([]);
  useEffect(() => {
    Axios.get("http://localhost:3000/addEmployee/branch")
      .then(response => {
        setBranchOptions(response.data);
      })
      .catch(error => {
        console.error('Error fetching data:', error);
      });
  }, []);

  return (
    <div>
      <form onSubmit={handleSubmit} style={{ padding: '20px', maxWidth: '800px', margin: '0 auto' }}>
        <div>
          <h4 style={{ marginBottom: '30px', marginTop: '40px' }}>Employee Information</h4>
        </div>
        <div className="row">
          <div className="form-group col-md-6">
            <label htmlFor="inputFirstName">First Name</label>
            <input type="text" className="form-control" id="inputFirstName" placeholder="First Name" value={employeeData.firstName} style={{ width: '100%', marginBottom: '15px' }} 
            onChange={(event) => setEmployeeData({...employeeData, firstName: event.target.value})} />
          </div>
          <div className="form-group col-md-6">
            <label htmlFor="inputLastName">Last Name</label>
            <input type="text" className="form-control" id="inputLastName" placeholder="Last Name" value={employeeData.lastName} style={{ width: '100%', marginBottom: '15px' }} 
            onChange={(event) => setEmployeeData({...employeeData, lastName: event.target.value})} />
          </div>
        </div>
        <div className="row">
          <div className="form-group col-md-4">
            <label htmlFor="inputGender">Gender</label>
            <select id="inputGender" className="form-control" style={{ width: '100%', marginBottom: '15px' }} value={employeeData.gender}
            onChange={(event) => setEmployeeData({...employeeData, gender: event.target.value})} >
              <option>Choose...</option>
              <option>Male</option>
              <option>Female</option>
              <option>Other</option>
              <option>Prefer not to say</option>
            </select>
          </div>
          <div className="form-group col-md-4">
            <label htmlFor="inputMaritalStatus">Marital Status</label>
            <select id="inputMaritalStatus" className="form-control" style={{ width: '100%', marginBottom: '15px' }} value={employeeData.maritalStatus}
            onChange={(event) => setEmployeeData({...employeeData, maritalStatus: event.target.value})} >
              <option>Choose...</option>
              <option>Married</option>
              <option>Unmarried</option>
              <option>Other</option>
              <option>Prefer not to say</option>
            </select>
          </div>
          <div className="form-group col-md-4">
            <label htmlFor="inputBirthday">Birthday</label>
            <input type="date" className="form-control" id="inputBirthday" placeholder="Birthday" value={employeeData.birthday} style={{ width: '100%', marginBottom: '15px' }} 
            onChange={(event) => setEmployeeData({...employeeData, birthday: event.target.value})} />
          </div>
        </div>
        <div className="form-group col-md-6">
          <label htmlFor="inputEmail">Email</label>
          <input type="email" className="form-control" id="inputEmail" placeholder="Email" value={employeeData.email} style={{ width: '100%', marginBottom: '15px' }} 
          onChange={(event) => setEmployeeData({...employeeData, email: event.target.value})} />
        </div>
        <div className="row">
          <div className="form-group col-md-4">
            <label htmlFor="inputEmploymentStatus">Employment Status</label>
            <select id="inputEmploymentStatus" className="form-control" style={{ width: '100%', marginBottom: '15px' }} value={employeeData.employmentStatus}
            onChange={(event) => setEmployeeData({...employeeData, employmentStatus: event.target.value})} >
              <option>Choose...</option>
              {employmentStatusOptions.map(option => (
                <option key={option.Status_ID}>
                  {option.Status}
                </option>
              ))}
            </select>
          </div>
          <div className="form-group col-md-4">
            <label htmlFor="inputJobTitle">Job Title</label>
            <select id="inputJobTitle" className="form-control" style={{ width: '100%', marginBottom: '15px' }} value={employeeData.jobTitle}
            onChange={(event) => setEmployeeData({...employeeData, jobTitle: event.target.value})} >
              <option>Choose...</option>
              <option>HR Manager</option>
              <option>Accountant</option>
              <option>Software Engineer</option>
              <option>QA Engineer</option>
            </select>
          </div>
          <div className="form-group col-md-4">
            <label htmlFor="inputPayGrade">Pay Grade</label>
            <select id="inputPayGrade" className="form-control" style={{ width: '100%', marginBottom: '15px' }} value={employeeData.payGrade}
            onChange={(event) => setEmployeeData({...employeeData, payGrade: event.target.value})} >
              <option>Choose...</option>
              {payGradeOptions.map(option => (
                <option key={option.Pay_Grade_ID}>
                  {option.Pay_Grade}
                </option>
              ))}
            </select>
          </div>
        </div>
        <div className="form-group col-md-5">
          <label htmlFor="inputDepartment">Department</label>
          <select id="inputDepartment" className="form-control" style={{ width: '100%', marginBottom: '15px' }} value={employeeData.department}
          onChange={(event) => setEmployeeData({...employeeData, department: event.target.value})} >
            <option>Choose...</option>
            {departmentOptions.map(option => (
              <option key={option.Dept_ID}>
                {option.Dept_Name}
              </option>
            ))}
          </select>
        </div>
        <div className="form-group col-md-5">
          <label htmlFor="inputBranch">Branch</label>
          <select id="inputBranch" className="form-control" style={{ width: '100%', marginBottom: '15px' }} value={employeeData.branch}
          onChange={(event) => setEmployeeData({...employeeData, branch: event.target.value})} >
            <option>Choose...</option>
            {branchOptions.map(option => (
              <option key={option.Branch_ID}>
                {option.Branch_Name}
              </option>
            ))}
          </select>
        </div>
        
        <div>
          <h6 style={{ marginBottom: '30px', marginTop: '50px' }}>Do you want to add dependent</h6>
          <button type="button"  onClick={handleAddDependent}>
            Add Dependent
          </button>
        </div>

        <div>
          <h4 style={{ marginBottom: '30px', marginTop: '50px' }}>Employee Account Information</h4>
        </div>
        <div className="form-group col-md-6">
          <label htmlFor="inputUsername">Username</label>
          <input type="text" className="form-control" id="inputUsername" placeholder="New Username" value={accountData.username} style={{ width: '100%', marginBottom: '15px' }} 
          onChange={(event) => setAccountData({...accountData, username: event.target.value})} />
        </div>
        <div className="form-group col-md-6">
          <label htmlFor="inputPassword">Password</label>
          <input type="password" className="form-control" id="inputPassword" placeholder="New Password" value={accountData.password} style={{ width: '100%', marginBottom: '15px' }} 
          onChange={(event) => setAccountData({...accountData, password: event.target.value})} />
        </div>
        <div className="form-group col-md-6">
          <label htmlFor="inputConfirmPassword">Confirm Password</label>
          <input type="password" className="form-control" id="inputConfirmPassword" placeholder="Confirm Password" value={accountData.confirmPassword} style={{ width: '100%', marginBottom: '15px' }} 
          onChange={(event) => setAccountData({...accountData, confirmPassword: event.target.value})} />
        </div>

        <button type="submit" className="btn btn-primary" style={{ width: '100%', marginBottom: '50px' }}>Submit</button>
      </form>
    </div>
  );
}

export default AddEmployee;
