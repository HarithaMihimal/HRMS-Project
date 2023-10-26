import React from "react";
import { useNavigate } from "react-router-dom";

function PageAdmin() {
    const navigate = useNavigate(); // Define the navigate function

    // Handler for the "Leave Request" button click
    const handleLeaveRequestClick_1 = () => {
      navigate(`/PageAdmin/AddHR`);
    };

    return (
      <div>
        <h1>Page for the Admin</h1>
        <div className="d-flex justify-content-center">
          <button type="button" className="btn btn-primary btn-lg custom-button" onClick={handleLeaveRequestClick_1}>
            Add HR Manager
          </button>
        </div>
      </div>
    );
}

export default PageAdmin;