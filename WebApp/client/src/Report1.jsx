import React, { useEffect, useState } from "react";
import axios from "axios";

function Report1() {
  const [leaveRequests, setLeaveRequests] = useState([]);

  useEffect(() => {
    async function fetchLeaveRequests() {
      try {
        const response = await axios.get("http://localhost:3000/fetchLeaveRequests");
        setLeaveRequests(response.data);
      } catch (error) {
        console.error("Error fetching data:", error);
      }
    }

    fetchLeaveRequests();
  }, []);

  return (
    <div>
      <h1>Total leaves in a given period by department</h1>
      <table>
        <thead>
          <tr>
          
            <th>Employee ID</th>
            <th>Start Date</th>
            <th>No of Days</th>
            <th>Type</th>
            <th>Status</th>
          </tr>
        </thead>
        <tbody>
          {leaveRequests.map((request) => (
            <tr key={request.Leave_Req_ID}>
              <td>{request.Employee_ID}</td>
              <td>{request.Start_Date}</td>
              <td>{request.No_of_Days}</td>
              <td>{request.Type}</td>
              <td>{request.Status}</td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
}

export default Report1;
