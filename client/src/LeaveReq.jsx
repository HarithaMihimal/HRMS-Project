import React from "react";
import { useState } from "react";
import "./style.css";
import Axios from "axios";
import { useParams } from 'react-router-dom';

function LeaveReq() {
  const { id_to_transfer } = useParams();
  console.log('id_to_transfer in LeaveReq:', id_to_transfer);
  const [id, setid] = useState("");
  const [startDate, setStartDate] = useState(new Date());
  const [day_no, setNumDays] = useState(0);
  const [type, setType] = useState("");

  const addEmployee = () => {
    Axios.post("http://localhost:3000/createLeaveReq", {
      id: id,
      startDate: startDate,
      day_no: day_no,
      type: type,
    }).then(() => {
      console.log("success");
    });
  };

  return (
    <div className="container mt-5">
      <div className="information">
        <div className="mb-3">
          <label htmlFor="employeeId" className="form-label">
            Employee ID:
          </label>
          <input
            type="text"
            className="form-control"
            id="employeeId"
            onChange={(event) => {
              setid(event.target.value);
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
        <button className="btn btn-primary" onClick={addEmployee}>Submit Request</button>
      </div>
    </div>
  );
}

export default LeaveReq;