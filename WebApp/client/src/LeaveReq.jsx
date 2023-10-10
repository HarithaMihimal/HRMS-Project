import React, { useState, useEffect } from "react";
import "./style.css";
import Axios from "axios";
import { useParams } from "react-router-dom";

function LeaveReq() {
  const { id_to_transfer } = useParams();
  const [id, setId] = useState("");
  const [startDate, setStartDate] = useState(new Date());
  const [day_no, setNumDays] = useState(0);
  const [type, setType] = useState("");
  const [errorMessage, setErrorMessage] = useState(""); // State variable for error message
  const [successMessage, setSuccessMessage] = useState(""); // State variable for success message
  const [pendingRequests, setPendingRequests] = useState([]); // State variable for pending leave requests

  useEffect(() => {
    // Fetch pending leave requests for the employee with the given ID
    const fetchPendingRequests = async () => {
      try {
        const response = await Axios.get(`http://localhost:3000/pendingLeaveRequests/${id_to_transfer}`);
        setPendingRequests(response.data);
      } catch (error) {
        console.error("Error fetching pending leave requests:", error);
      }
    };

    fetchPendingRequests();
  }, [id_to_transfer]);

  const addEmployee = async () => {
    try {
      if (id === id_to_transfer) {
        await Axios.post("http://localhost:3000/createLeaveReq", {
          id: id,
          startDate: startDate,
          day_no: day_no,
          type: type,
        });
        setSuccessMessage("Your request submitted");
        setErrorMessage("");
        window.location.reload();
      } else {
        setErrorMessage("Invalid ID");
        setSuccessMessage("");
      }
    } catch (error) {
      console.error("Error:", error);
      setSuccessMessage("");
      setErrorMessage("Failed to submit request");
    }
  };

  const deleteRequest = async (requestId) => {
    try {
      console.log(requestId);
      await Axios.delete(`http://localhost:3000/deleteLeaveRequest/${requestId}`);

      setPendingRequests((prevRequests) => prevRequests.filter((request) => request.Leave_Req_ID !== requestId));
      setSuccessMessage("Request deleted successfully");
    } catch (error) {
      console.error("Error deleting request:", error);
      setErrorMessage("Failed to delete request");
    }
  };

  return (
    <div className="container mt-5">
      <div className="information">
        {errorMessage && <p className="text-danger">{errorMessage}</p>}
        {successMessage && <p className="text-success">{successMessage}</p>}
        <div className="mb-3">
          <label htmlFor="employeeId" className="form-label">
            Employee ID:
          </label>
          <input
            type="text"
            className="form-control"
            id="employeeId"
            onChange={(event) => {
              setId(event.target.value);
            }}
          />
        </div>
        <div className="mb-3">
          <label htmlFor="startDate" className="form-label">
            Start Date:
          </label>
          <input
            type="date"
            className="form-control"
            id="startDate"
            onChange={(event) => {
              setStartDate(event.target.value);
            }}
          />
        </div>
        <div className="mb-3">
          <label htmlFor="numDays" className="form-label">
            Number of Days:
          </label>
          <input
            type="number"
            className="form-control"
            id="numDays"
            onChange={(event) => {
              setNumDays(event.target.value);
            }}
          />
        </div>
        <div className="mb-3">
          <label htmlFor="leaveType" className="form-label">
            Leave Type:
          </label>
          <select
            className="form-control"
            id="leaveType"
            onChange={(event) => {
              setType(event.target.value);
            }}
          >
            <option value="">Select Leave Type</option>
            <option value="annual">Annual</option>
            <option value="casual">Casual</option>
            <option value="no_pay">No Pay</option>
            <option value="maternity">Maternity</option>
          </select>
        </div>
        <button className="btn btn-primary" onClick={addEmployee}>
          Submit Request
        </button>
      </div>

      <div className="mt-5">
        <h2>Pending Leave Requests</h2>
        <ul>
          {pendingRequests.map((request, index) => (
            <li key={index}>
              ID: {request.Employee_ID}, Start Date: {request.start_Date},No of Days{request.No_of_Days}, Type: {request.Type}
              <button
                className="btn btn-danger"
                onClick={() => deleteRequest(request.Leave_Req_ID)}
              >
                Delete
              </button>
            </li>
          ))}
        </ul>
      </div>
    </div>
  );
}

export default LeaveReq;
