import React from 'react';
import { useNavigate } from 'react-router-dom';
import { useParams } from 'react-router-dom';

function PageHR() {
  const { id_to_transfer } = useParams();
  console.log('id_to_transfer in PageHR:', id_to_transfer);
  const navigate = useNavigate(); // Define the navigate function

  // Handler for the "Leave Request" button click
  const handleLeaveRequestClick_1 = () => {
    navigate(`/PageHR/${id_to_transfer}/EmployeeManagement`);
  };
  const handleLeaveRequestClick_2 = () => {
    navigate(`/PageHR/${id_to_transfer}/AddCustom`); 
  };
  const handleLeaveRequestClick_3 = () => {
    navigate(`/PageHR/${id_to_transfer}/ReportGenaration`); 
  };

  return (
    <div>
      <h1>Page for the HR</h1>
      <div className="d-flex justify-content-center">
        <button type="button" className="btn btn-primary btn-lg custom-button" onClick={handleLeaveRequestClick_1}>
          Employee Management
        </button>
      </div>
      <div className="d-flex justify-content-center">
        <button type="button" className="btn btn-primary btn-lg custom-button" onClick={handleLeaveRequestClick_2}>
          Add Custom Attribute
        </button>
      </div>
      <div className="d-flex justify-content-center">
        <button type="button" className="btn btn-primary btn-lg custom-button" onClick={handleLeaveRequestClick_3}>
          Report Generation
        </button>
      </div>
    </div>
  );
}

export default PageHR;
