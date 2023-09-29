import React from "react";

function AddEmployee() {
  return (
    <div>
      <h1>Here we can add new employees</h1>
      <form style={{ padding: '20px', maxWidth: '800px', margin: '0 auto' }}>
        <div className="row">
          <div className="form-group col-md-6">
            <label htmlFor="inputFirstName">First Name</label>
            <input type="text" className="form-control" id="inputFirstName" placeholder="First Name" style={{ width: '100%', marginBottom: '15px' }} />
          </div>
          <div className="form-group col-md-6">
            <label htmlFor="inputLastName">Last Name</label>
            <input type="text" className="form-control" id="inputLastName" placeholder="Last Name" style={{ width: '100%', marginBottom: '15px' }} />
          </div>
        </div>
        <div className="row">
          <div className="form-group col-md-4">
            <label htmlFor="inputGender">Gender</label>
            <select id="inputGender" className="form-control" style={{ width: '100%', marginBottom: '15px' }}>
              <option selected>Choose...</option>
              <option>Male</option>
              <option>Female</option>
              <option>Other</option>
              <option>Prefer not to say</option>
            </select>
          </div>
          <div className="form-group col-md-4">
            <label htmlFor="inputMaritalStatus">Marital Status</label>
            <select id="inputMaritalStatus" className="form-control" style={{ width: '100%', marginBottom: '15px' }}>
              <option selected>Choose...</option>
              <option>Married</option>
              <option>Unmarried</option>
              <option>Other</option>
              <option>Prefer not to say</option>
            </select>
          </div>
          <div className="form-group col-md-4">
            <label htmlFor="inputBirthday">Birthday</label>
            <input type="date" className="form-control" id="inputBirthday" placeholder="Birthday" style={{ width: '100%', marginBottom: '15px' }} />
          </div>
        </div>
        <div className="form-group col-md-6">
          <label htmlFor="inputEmail">Email</label>
          <input type="email" className="form-control" id="inputEmail" placeholder="Email" style={{ width: '100%', marginBottom: '15px' }} />
        </div>
        <div className="row">
          <div className="form-group col-md-4">
            <label htmlFor="inputEmploymentStatus">Employment Status</label>
            <select id="inputEmploymentStatus" className="form-control" style={{ width: '100%', marginBottom: '15px' }}>
              <option selected>Choose...</option>
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
            <select id="inputJobTitle" className="form-control" style={{ width: '100%', marginBottom: '15px' }}>
              <option selected>Choose...</option>
              <option>HR Manager</option>
              <option>Accountant</option>
              <option>Software Engineer</option>
              <option>QA Engineer</option>
            </select>
          </div>
          <div className="form-group col-md-4">
            <label htmlFor="inputPayGrade">Pay Grade</label>
            <input type="text" className="form-control" id="inputPayGrade" placeholder="Pay Grade" style={{ width: '100%', marginBottom: '15px' }} />
          </div>
        </div>
        <div className="form-group col-md-5">
          <label htmlFor="inputDepartment">Department</label>
          <input type="text" className="form-control" id="inputDepartment" placeholder="Department" style={{ width: '100%', marginBottom: '15px' }} />
        </div>
        <div className="form-group col-md-5">
          <label htmlFor="inputBranch">Branch</label>
          <input type="text" className="form-control" id="inputBrach" placeholder="Branch" style={{ width: '100%', marginBottom: '15px' }} />
        </div>
        
        <div className="form-group">
          <div className="form-check">
            <input className="form-check-input" type="checkbox" id="gridCheck" />
            <label className="form-check-label" htmlFor="gridCheck">
              Check me out
            </label>
          </div>
        </div>
        <button type="submit" className="btn btn-primary" style={{ width: '100%' }}>Submit</button>
      </form>
    </div>
  );
}

export default AddEmployee;
