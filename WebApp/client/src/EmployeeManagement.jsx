import React from 'react';
import { useNavigate } from 'react-router-dom';
import { useParams } from 'react-router-dom';

function EmployeeManagement() {
  const { id_to_transfer } = useParams();
  console.log('id_to_transfer in EmployeeManagement:', id_to_transfer);
  const navigate = useNavigate(); // Define the navigate function

  // Handler for the "Leave Request" button click
  const handleAddEmployee = () => {
    navigate(`/PageHR/${id_to_transfer}/EmployeeManagement/AddEmployee`);
  };

  return (
    <div>
      <h1>Page for the Employee Management</h1>
      <div className="d-flex justify-content-center">
        <button type="button" className="btn btn-primary btn-lg custom-button" onClick={handleAddEmployee}>
          Add Employee
        </button>
      </div>
    </div>
  );
}

export default EmployeeManagement;
