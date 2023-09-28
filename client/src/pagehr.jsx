import React from 'react';
import { useNavigate } from 'react-router-dom';

function PageHR() {
  const navigate = useNavigate(); // Define the navigate function

  // Handler for the "Leave Request" button click
  const handleLeaveRequestClick_1 = () => {
    navigate('/PageHR/AddEmployee');
  };
  const handleLeaveRequestClick_2 = () => {
    navigate('/PageHR/AddCustom'); 
  };

  return (
    <div>
      <h1>Page for the HR</h1>
      <div className="d-flex justify-content-center">
        <button type="button" className="btn btn-primary btn-lg custom-button" onClick={handleLeaveRequestClick_1}>
          Add Employee
        </button>
      </div>
      <div className="d-flex justify-content-center">
        <button type="button" className="btn btn-primary btn-lg custom-button" onClick={handleLeaveRequestClick_2}>
          Add Custom Attribute
        </button>
      </div>
    </div>
  );
}

export default PageHR;
