import React, { useState, useEffect } from 'react';
import Axios from 'axios';
import { useNavigate, useParams } from 'react-router-dom';
import ReactPaginate from 'react-paginate';
import './EmployeeManagement.css'; // Import the CSS file

function EmployeeManagement() {
  const { id_to_transfer } = useParams();
  const navigate = useNavigate();

  const handleAddEmployee = () => {
    navigate(`/PageHR/${id_to_transfer}/EmployeeManagement/AddEmployee`);
  };

  const [employees, setEmployees] = useState([]);
  const [currentPage, setCurrentPage] = useState(0); // Current page number
  const perPage = 10; // Number of records per page

  useEffect(() => {
    Axios.get('http://localhost:3000/employeeData')
      .then((response) => setEmployees(response.data))
      .catch((error) => console.log(error));
  }, []);

  const offset = currentPage * perPage;
  const pageCount = Math.ceil(employees.length / perPage);

  const handlePageClick = ({ selected }) => {
    setCurrentPage(selected);
  };

  const customButtonLabel = (label) => {
    return (
      <button className="custom-pagination-button">
        {label}
      </button>
    );
  };

  const displayedEmployees = employees.slice(offset, offset + perPage);

  return (
    <div className="container">
      <h1>Page the Employee Management</h1>
      <div className="justify-content-center">
        <div>
          <button type="button" className="btn btn-success my-3" onClick={handleAddEmployee}>
            Add New Employee
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
              {displayedEmployees.map((employee) => (
                <tr key={employee.Employee_ID}>
                  <td>{employee.Employee_ID}</td>
                  <td>{employee.First_Name + " " + employee.Last_Name}</td>
                  <td>{employee.Gender}</td>
                  <td>{employee.Job_Title}</td>
                  <td>{employee.Email}</td>
                  <td>
                    <div style={{margin: "0px"}} className="d-flex custom-button-container">
                      <div style={{margin: "0px"}} className="mx-1">
                        <button type="button" className="btn btn-success">
                          View
                        </button>
                      </div>
                      <div style={{margin: "0px"}} className="mx-1">
                        <button type="button" className="btn btn-warning">
                          Edit
                        </button>
                      </div>
                    </div>
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      </div>

      <div className="pagination-container">
        <ReactPaginate
          previousLabel={customButtonLabel('Previous')}
          nextLabel={customButtonLabel('Next')}
          breakLabel={<span>...</span>}
          pageCount={pageCount}
          marginPagesDisplayed={2}
          pageRangeDisplayed={5}
          onPageChange={handlePageClick}
          containerClassName="pagination"
          subContainerClassName="pages pagination"
          activeClassName="active"
        />
      </div>
    </div>
  );
}

export default EmployeeManagement;
