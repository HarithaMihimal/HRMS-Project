import React from 'react';
import Axios from 'axios';
import { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import { useParams } from 'react-router-dom';

function EmployeeManagement() {
  const { id_to_transfer } = useParams();
  console.log('id_to_transfer in EmployeeManagement:', id_to_transfer);
  const navigate = useNavigate(); // Define the navigate function

  // Handler for the "AddEmployee" button click
  const handleAddEmployee = () => {
    navigate(`/PageHR/${id_to_transfer}/EmployeeManagement/AddEmployee`);
  };

  const [employees, setEmployees] = useState([]); // Define the employees state variable and the setEmployees function
  useEffect(() => {
    Axios.get('http://localhost:3000/employeeData')
    .then((response) => setEmployees(response.data))
    .catch((error) => console.log(error));
  }, []);

  // Custom CSS for reducing row height
  const tableCellStyle = {
    verticalAlign: 'middle', // Center content vertically
    padding: '0px', // Adjust padding as needed
  };

  return (
    <div className='container'>
      <h1>Page the Employee Management</h1>
      <div className="justify-content-center">
        <div>
          <button type="button" className="btn btn-success my-3" onClick={handleAddEmployee}>
            Add Employee
          </button>
        </div>

        <div>
          <table className="table table-striped table-bordered">
            <thead>
              <tr>
                <th>Employee ID</th>
                <th>Name</th>
                <th>Gender</th>
                <th>Job Title</th>
                <th>Email</th>
                <th>Action</th>
              </tr>
            </thead>
            <tbody>
              {employees.map((employee) => (
                <tr key={employee.Employee_ID}>
                  <td style={tableCellStyle}>{employee.Employee_ID}</td>
                  <td>{employee.First_Name + " " + employee.Last_Name}</td>
                  <td>{employee.Gender}</td>
                  <td>{employee.Job_Title}</td>
                  <td>{employee.Email}</td>
                  <td>
                    <div className="d-flex">
                      <dic>
                        <button type="button" className="btn btn-success">View</button>
                      </dic>
                      <dic className="mx-1">
                        <button type="button" className="btn btn-primary">Edit</button>
                      </dic>
                      <dic>
                        <button type="button" className="btn btn-danger">Delete</button>
                      </dic>
                    </div>
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      </div>
    </div>
  );
}

export default EmployeeManagement;
