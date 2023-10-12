import React from "react";
import { useNavigate } from 'react-router-dom';
import { useParams } from 'react-router-dom';


function ReportGenaration() {
    const { id_to_transfer } = useParams();
    const navigate = useNavigate(); // Define the navigate function
    const handleLeaveRequestClick_1 = () => {
        navigate(`/PageHR/${id_to_transfer}/ReportGenaration/Report1`);
      };
    const handleLeaveRequestClick_2 = () => {
        navigate(`/PageHR/${id_to_transfer}/ReportGenaration/Report2`);      };
    const handleLeaveRequestClick_3 = () => {
        navigate(`/PageHR/${id_to_transfer}/ReportGenaration/Report3`);      };
    const handleLeaveRequestClick_4 = () => {
            navigate(`/PageHR/${id_to_transfer}/ReportGenaration/Report4`);      };
    const handleLeaveRequestClick_5 = () => {
                navigate(`/PageHR/${id_to_transfer}/ReportGenaration/Report5`);      };

  return (
    <div>
      <h1>Here we can generate reports</h1>
      <div className="d-flex justify-content-center">
        <button type="button" className="btn btn-primary btn-lg custom-button" onClick={handleLeaveRequestClick_1}>
          Report 1
        </button>
      </div>
      <div className="d-flex justify-content-center">
        <button type="button" className="btn btn-primary btn-lg custom-button" onClick={handleLeaveRequestClick_2}>
        Report 2
        </button>
      </div>
      <div className="d-flex justify-content-center">
        <button type="button" className="btn btn-primary btn-lg custom-button" onClick={handleLeaveRequestClick_3}>
        Report 3
        </button>
      </div>
      <div className="d-flex justify-content-center">
        <button type="button" className="btn btn-primary btn-lg custom-button" onClick={handleLeaveRequestClick_4}>
        Report 4
        </button>
      </div>
      <div className="d-flex justify-content-center">
        <button type="button" className="btn btn-primary btn-lg custom-button" onClick={handleLeaveRequestClick_5}>
        Report 5
        </button>
      </div>
    </div>
  );
}

export default ReportGenaration;
