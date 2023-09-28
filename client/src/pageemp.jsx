import React from 'react';
import { useNavigate } from 'react-router-dom';

function PageEMP() {
  const navigate = useNavigate(); // Define the navigate function

  // Handler for the "Leave Request" button click
  const handleLeaveRequestClick_1 = () => {
    navigate('/PageEMP/LeaveReq'); // Navigate to the '/LeaveReq' route
  };
  const handleLeaveRequestClick_2 = () => {
    navigate('/PageEMP/PasswordChange'); 
  };
  const handleLeaveRequestClick_3 = () => {
    navigate('/PageEMP/Supervisor');
  };

  return (
    <div>
      <h1>Page for the Employee</h1>
      <div className="d-flex justify-content-center">
        <button type="button" className="btn btn-primary btn-lg custom-button" onClick={handleLeaveRequestClick_1}>
          Leave Request
        </button>
      </div>
      <div className="d-flex justify-content-center">
        <button type="button" className="btn btn-primary btn-lg custom-button" onClick={handleLeaveRequestClick_2}>
          Change your password
        </button>
      </div>
      <div className="d-flex justify-content-center">
        <button type="button" className="btn btn-primary btn-lg custom-button" onClick={handleLeaveRequestClick_3}>
          Supervisor
        </button>
      </div>
    </div>
  );
}

export default PageEMP;
