import React, { useState, useEffect } from "react";
import { useNavigate } from 'react-router-dom';
import Axios from 'axios';
import { useParams } from 'react-router-dom';
import { Formik, Form, Field, ErrorMessage } from 'formik';
import { addEmployeeSchema } from "./validations/AddEmployeeValidations";

function AddEmployee() {
  const { id_to_transfer } = useParams();
  const navigate = useNavigate();

  const initialEmployeeData = {
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
    branch: "Choose...",
    username: "",
    password: "",
    confirmPassword: ""
  }

  const [savedEmployeeData, setSavedEmployeeData] = useState(() => {
    const savedData = localStorage.getItem('employeeData');
    return savedData ? JSON.parse(savedData) : initialEmployeeData;
  });

  const [haveDependent, setHaveDependent] = useState(false);

  useEffect(() => {
    const savedHaveDependent = JSON.parse(localStorage.getItem('haveDependent'));
    if (savedHaveDependent) {
      setHaveDependent(true);
    }
  }, []);

  useEffect(() => {
    // Listen for the beforeunload event (page refresh)
    const handleBeforeUnload = (event) => {
      // Save the current employee data to local storage
      localStorage.setItem('employeeData', JSON.stringify(savedEmployeeData));
    };

    // Clear local storage when the page is refreshed
    const handlePageRefresh = () => {
      localStorage.clear();
    };

    window.addEventListener('beforeunload', handleBeforeUnload);
    window.addEventListener('unload', handlePageRefresh);

    // Clean up the event listeners when the component unmounts
    return () => {
      window.removeEventListener('beforeunload', handleBeforeUnload);
      window.removeEventListener('unload', handlePageRefresh);
    };
  }, [savedEmployeeData]);

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
      <Formik 
        initialValues={savedEmployeeData} 
        validationSchema={addEmployeeSchema}
        onSubmit={(employeeData , { resetForm } ) => {
          const data = {
            employeeData: employeeData,
            haveDependent: haveDependent
          }
          Axios.post("http://localhost:3000/addEmployee", data)
          .then(res => {
            console.log(res.data);
            localStorage.removeItem('employeeData');
            localStorage.removeItem('haveDependent');
            resetForm({
              values: initialEmployeeData // Reset the form with initial values
            });
            setSavedEmployeeData(initialEmployeeData); // Update the savedEmployeeData state
            setHaveDependent(false);
          }) 
          .catch(err => console.log(err))
        }}>
        {({errors, values}) => (
          <Form autoComplete="off" style={{ padding: '20px', maxWidth: '800px', margin: '0 auto' }}>
            <div>
              <h4 style={{ marginBottom: '30px', marginTop: '40px' }}>Employee Information</h4>
            </div>
            <div className="row">
              <div className="form-group col-md-6">
                <label htmlFor="inputFirstName" style={{marginTop: '15px'}}>First Name</label>
                <Field type="text" className="form-control" id="inputFirstName" name="firstName" placeholder="First Name" />
                <ErrorMessage name="firstName" component="div" className="error-message" />
              </div>
              <div className="form-group col-md-6">
                <label htmlFor="inputLastName" style={{marginTop: '15px'}}>Last Name</label>
                <Field type="text" className="form-control" id="inputLastName" name="lastName" placeholder="Last Name" />
                <ErrorMessage name="lastName" component="div" className="error-message" />
              </div>
            </div>
            <div className="row">
              <div className="form-group col-md-4">
                <label htmlFor="inputGender" style={{marginTop: '15px'}}>Gender</label>
                <Field as='select' className="form-control" id="inputGender" name="gender" >
                  <option>Choose...</option>
                  <option>Male</option>
                  <option>Female</option>
                  <option>Other</option>
                  <option>Prefer not to say</option>
                </Field>
                <ErrorMessage name="gender" component="div" className="error-message" />
              </div>
              <div className="form-group col-md-4">
                <label htmlFor="inputMaritalStatus" style={{marginTop: '15px'}}>Marital Status</label>
                <Field as='select' className="form-control" id="inputMaritalStatus" name="maritalStatus" >
                  <option>Choose...</option>
                  <option>Married</option>
                  <option>Unmarried</option>
                  <option>Other</option>
                  <option>Prefer not to say</option>
                </Field>
                <ErrorMessage name="maritalStatus" component="div" className="error-message" />
              </div>
              <div className="form-group col-md-4">
                <label htmlFor="inputBirthday" style={{marginTop: '15px'}}>Birthday</label>
                <Field type="date" className="form-control" id="inputBirthday" name="birthday" placeholder="Birthday" />
                <ErrorMessage name="birthday" component="div" className="error-message" />
              </div>
            </div>
            <div className="form-group col-md-6">
              <label htmlFor="inputEmail" style={{marginTop: '15px'}}>Email</label>
              <Field type="email" className="form-control" id="inputEmail" name="email" placeholder="Email" />
              <ErrorMessage name="email" component="div" className="error-message" />
            </div>
            <div className="row">
              <div className="form-group col-md-4">
                <label htmlFor="inputEmploymentStatus" style={{marginTop: '15px'}}>Employment Status</label>
                <Field as='select' className="form-control" id="inputEmploymentStatus" name="employmentStatus" >
                  <option>Choose...</option>
                  {employmentStatusOptions.map(option => (
                    <option key={option.Status_ID}>
                      {option.Status}
                    </option>
                  ))}
                </Field>
                <ErrorMessage name="employmentStatus" component="div" className="error-message" />
              </div>
              <div className="form-group col-md-4">
                <label htmlFor="inputJobTitle" style={{marginTop: '15px'}}>Job Title</label>
                <Field as='select' className="form-control" id="inputJobTitle" name="jobTitle" >
                  <option>Choose...</option>
                  <option>HR Manager</option>
                  <option>Accountant</option>
                  <option>Software Engineer</option>
                  <option>QA Engineer</option>
                </Field>
                <ErrorMessage name="jobTitle" component="div" className="error-message" />
              </div>
              <div className="form-group col-md-4">
                <label htmlFor="inputPayGrade" style={{marginTop: '15px'}}>Pay Grade</label>
                <Field as='select' className="form-control" id="inputPayGrade" name="payGrade" >
                  <option>Choose...</option>
                  {payGradeOptions.map(option => (
                    <option key={option.Pay_Grade_ID}>
                      {option.Pay_Grade}
                    </option>
                  ))}
                </Field>
                <ErrorMessage name="payGrade" component="div" className="error-message" />
              </div>
            </div>
            <div className="form-group col-md-5">
              <label htmlFor="inputDepartment" style={{marginTop: '15px'}}>Department</label>
              <Field as='select' className="form-control" id="inputDepartment" name="department" >
                <option>Choose...</option>
                {departmentOptions.map(option => (
                  <option key={option.Dept_ID}>
                    {option.Dept_Name}
                  </option>
                ))}
              </Field>
              <ErrorMessage name="department" component="div" className="error-message" />
            </div>
            <div className="form-group col-md-5">
              <label htmlFor="inputBranch" style={{marginTop: '15px'}}>Branch</label>
              <Field as='select' className="form-control" id="inputBranch" name="branch" >
                <option>Choose...</option>
                {branchOptions.map(option => (
                  <option key={option.Branch_ID}>
                    {option.Branch_Name}
                  </option>
                ))}
              </Field>
              <ErrorMessage name="branch" component="div" className="error-message" />
            </div>
            
            <div>
              <h6 style={{ marginBottom: '30px', marginTop: '50px' }}>Do you want to add dependent</h6>
              <button type="button" onClick={ () => {
                  // Save the current employee data to local storage
                  localStorage.setItem('employeeData', JSON.stringify(values));
              
                  navigate(`/PageHR/${id_to_transfer}/AddEmployee/AddDependent`);
              }}>
                Add Dependent
              </button>
            </div>
    
            <div>
              <h4 style={{ marginBottom: '30px', marginTop: '50px' }}>Employee Account Information</h4>
            </div>
            <div className="form-group col-md-6">
              <label htmlFor="inputUsername" style={{marginTop: '15px'}}>Username</label>
              <Field type="text" className="form-control" id="inputUsername" name="username" placeholder="New Username" />
              <ErrorMessage name="username" component="div" className="error-message" />
            </div>
            <div className="form-group col-md-6">
              <label htmlFor="inputPassword" style={{marginTop: '15px'}}>Password</label>
              <Field type="password" className="form-control" id="inputPassword" name="password" placeholder="New Password" />
              <ErrorMessage name="password" component="div" className="error-message" />
            </div>
            <div className="form-group col-md-6">
              <label htmlFor="inputConfirmPassword" style={{marginTop: '15px'}}>Confirm Password</label>
              <Field type="password" className="form-control" id="inputConfirmPassword" name="confirmPassword" placeholder="Confirm Password" />
              <ErrorMessage name="confirmPassword" component="div" className="error-message" />
            </div>
    
            <button type="submit" className="btn btn-primary" style={{ width: '100%', marginBottom: '50px', marginTop: '30px' }}>Submit</button>
          </Form>
        )}
      
      </Formik>
    </div>
  );
}

export default AddEmployee;
