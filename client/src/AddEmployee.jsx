import React, { useState } from "react";
import Axios from 'axios';

function AddEmployee() {
  const [employeeData, setEmployeeData] = React.useState({
    firstName: "",
    lastName: "",
    gender: "",
    maritalStatus: "",
    birthday: "",
    email: "",
    employmentStatus: "",
    jobTitle: "",
    payGrade: "",
    department: "",
    branch: ""
  });

  const [dependentData, setDependentData] = React.useState({
    firstName: "",
    lastName: "",
    gender: "",
    age: "",
    relation: ""
  });

  const [accountData, setAccountData] = React.useState({
    username: "",
    password: "",
    confirmPassword: ""
  });

  const handleSubmit = (event) => {
    event.preventDefault();
    const data = {
      employeeData: employeeData,
      dependentData: dependentData,
      accountData: accountData
    }
    Axios.post("http://localhost:3000/addEmployee", data)
    .then(res => console.log(res.data))
    .catch(err => console.log(err));
  }

  return (
    <div>
      <form onSubmit={handleSubmit} style={{ padding: '20px', maxWidth: '800px', margin: '0 auto' }}>
        <div>
          <h4 style={{ marginBottom: '30px', marginTop: '40px' }}>Employee Information</h4>
        </div>
        <div className="row">
          <div className="form-group col-md-6">
            <label htmlFor="inputFirstName">First Name</label>
            <input type="text" className="form-control" id="inputFirstName" placeholder="First Name" style={{ width: '100%', marginBottom: '15px' }} 
            onChange={(event) => setEmployeeData({...employeeData, firstName: event.target.value})} />
          </div>
          <div className="form-group col-md-6">
            <label htmlFor="inputLastName">Last Name</label>
            <input type="text" className="form-control" id="inputLastName" placeholder="Last Name" style={{ width: '100%', marginBottom: '15px' }} 
            onChange={(event) => setEmployeeData({...employeeData, lastName: event.target.value})} />
          </div>
        </div>
        <div className="row">
          <div className="form-group col-md-4">
            <label htmlFor="inputGender">Gender</label>
            <select id="inputGender" className="form-control" style={{ width: '100%', marginBottom: '15px' }} defaultValue="Choose..."
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
            <select id="inputMaritalStatus" className="form-control" style={{ width: '100%', marginBottom: '15px' }} defaultValue="Choose..."
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
            <input type="date" className="form-control" id="inputBirthday" placeholder="Birthday" style={{ width: '100%', marginBottom: '15px' }} 
            onChange={(event) => setEmployeeData({...employeeData, birthday: event.target.value})} />
          </div>
        </div>
        <div className="form-group col-md-6">
          <label htmlFor="inputEmail">Email</label>
          <input type="email" className="form-control" id="inputEmail" placeholder="Email" style={{ width: '100%', marginBottom: '15px' }} 
          onChange={(event) => setEmployeeData({...employeeData, email: event.target.value})} />
        </div>
        <div className="row">
          <div className="form-group col-md-4">
            <label htmlFor="inputEmploymentStatus">Employment Status</label>
            <select id="inputEmploymentStatus" className="form-control" style={{ width: '100%', marginBottom: '15px' }} defaultValue="Choose..."
            onChange={(event) => setEmployeeData({...employeeData, employmentStatus: event.target.value})} >
              <option>Choose...</option>
              <option>Intern (Full-time)</option>
              <option>Intern (Part-time)</option>
              <option>Contract (Full-time)</option>
              <option>Contract (Part-time)</option>
              <option>Permanent</option>
              <option>Free Lance</option>
              <option>Other</option>
            </select>
          </div>
          <div className="form-group col-md-4">
            <label htmlFor="inputJobTitle">Job Title</label>
            <select id="inputJobTitle" className="form-control" style={{ width: '100%', marginBottom: '15px' }} defaultValue="Choose..."
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
            <input type="text" className="form-control" id="inputPayGrade" placeholder="Pay Grade" style={{ width: '100%', marginBottom: '15px' }} 
            onChange={(event) => setEmployeeData({...employeeData, payGrade: event.target.value})} />
          </div>
        </div>
        <div className="form-group col-md-5">
          <label htmlFor="inputDepartment">Department</label>
          <input type="text" className="form-control" id="inputDepartment" placeholder="Department" style={{ width: '100%', marginBottom: '15px' }} 
          onChange={(event) => setEmployeeData({...employeeData, department: event.target.value})} />
        </div>
        <div className="form-group col-md-5">
          <label htmlFor="inputBranch">Branch</label>
          <input type="text" className="form-control" id="inputBranch" placeholder="Branch" style={{ width: '100%', marginBottom: '15px' }} 
          onChange={(event) => setEmployeeData({...employeeData, branch: event.target.value})} />
        </div>

        <div>
          <h4 style={{ marginBottom: '30px', marginTop: '50px' }}>Dependent Information</h4>
        </div>
        <div className="row">
          <div className="form-group col-md-6">
            <label htmlFor="inputDependentFirstName">First Name</label>
            <input type="text" className="form-control" id="inputDependentFirstName" placeholder="Dependent's First Name" style={{ width: '100%', marginBottom: '15px' }} 
            onChange={(event) => setDependentData({...dependentData, firstName: event.target.value})} />
          </div>
          <div className="form-group col-md-6">
            <label htmlFor="inputDependentLastName">Last Name</label>
            <input type="text" className="form-control" id="inputDependentLastName" placeholder="Dependent's Last Name" style={{ width: '100%', marginBottom: '15px' }} 
            onChange={(event) => setDependentData({...dependentData, lastName: event.target.value})} />
          </div>
        </div>
        <div className="form-group col-md-4">
          <label htmlFor="inputDependentGender">Gender</label>
          <select id="inputDependentGender" className="form-control" style={{ width: '100%', marginBottom: '15px' } } defaultValue="Choose..."
          onChange={(event) => setDependentData({...dependentData, gender: event.target.value})} >
            <option>Choose...</option>
            <option>Male</option>
            <option>Female</option>
            <option>Other</option>
            <option>Prefer not to say</option>
          </select>
        </div>
        <div className="form-group col-md-5">
          <label htmlFor="inputDependentAge">Age</label>
          <input type="number" className="form-control" id="inputDependentAge" placeholder="Age" style={{ width: '100%', marginBottom: '15px' }} 
          onChange={(event) => setDependentData({...dependentData, age: event.target.value})} />
        </div>
        <div className="form-group col-md-5">
          <label htmlFor="inputRelation">Relation</label>
          <input type="text" className="form-control" id="inputRelation" placeholder="Relation" style={{ width: '100%', marginBottom: '15px' }} 
          onChange={(event) => setDependentData({...dependentData, relation: event.target.value})} />
        </div>

        <div>
          <h4 style={{ marginBottom: '30px', marginTop: '50px' }}>Employee Account Information</h4>
        </div>
        <div className="form-group col-md-6">
          <label htmlFor="inputUsername">Username</label>
          <input type="text" className="form-control" id="inputUsername" placeholder="New Username" style={{ width: '100%', marginBottom: '15px' }} 
          onChange={(event) => setAccountData({...accountData, username: event.target.value})} />
        </div>
        <div className="form-group col-md-6">
          <label htmlFor="inputPassword">Password</label>
          <input type="password" className="form-control" id="inputPassword" placeholder="New Password" style={{ width: '100%', marginBottom: '15px' }} 
          onChange={(event) => setAccountData({...accountData, password: event.target.value})} />
        </div>
        <div className="form-group col-md-6">
          <label htmlFor="inputConfirmPassword">Confirm Password</label>
          <input type="password" className="form-control" id="inputConfirmPassword" placeholder="Confirm Password" style={{ width: '100%', marginBottom: '15px' }} 
          onChange={(event) => setAccountData({...accountData, confirmPassword: event.target.value})} />
        </div>

        
        <div className="form-group">
          <div className="form-check" style={{ marginTop: '30px', marginBottom: '10px' }}>
            <input className="form-check-input" type="checkbox" id="gridCheck" />
            <label className="form-check-label" htmlFor="gridCheck">
              Check me out
            </label>
          </div>
        </div>
        <button type="submit" className="btn btn-primary" style={{ width: '100%', marginBottom: '30px' }}>Submit</button>
      </form>
    </div>
  );
}

export default AddEmployee;
