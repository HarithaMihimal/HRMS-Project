import React, { useState, useEffect } from 'react';
import axios from 'axios';
import { useLocation } from 'react-router-dom';

const LeaveRequest = () => {
  const location = useLocation();
  const queryParams = new URLSearchParams(location.search);
  const id_to_transfer = queryParams.get('id_to_transfer');
  console.log('id_to_transfer in Page Supervisor:', id_to_transfer);

  // State to store the leave request data
  const [leaveRequests, setLeaveRequests] = useState([]);

  // Function to fetch leave requests from your API
  const fetchLeaveRequests = async () => {
    try {
      const response = await axios.get('http://localhost:3000/leave_request', {
        params: { id_to_transfer }
      }); // Replace with your API endpoint
      setLeaveRequests(response.data);
    } catch (error) {
      console.error('Error fetching leave requests:', error);
    }
  };

  // Function to update the status of a leave request
  const updateStatus = async (leaveReqID, newStatus) => {
    try {
      await axios.put(`http://localhost:3000/leave_request/${leaveReqID}`, {
        status: newStatus
      }); // Replace with your API endpoint
      // Update the status locally without making another request
      setLeaveRequests((prevLeaveRequests) =>
        prevLeaveRequests.map((request) =>
          request.Leave_Req_ID === leaveReqID
            ? { ...request, Status: newStatus }
            : request
        )
      );
    } catch (error) {
      console.error('Error updating status:', error);
    }
  };

  useEffect(() => {
    fetchLeaveRequests();
  }, []); // Fetch leave requests when the component mounts

  return (
    <div className="d-flex flex-column align-items-center">
      <div style={{ marginTop: '20px',marginBottom:'20px' }}>
      <h1>Leave Requests</h1></div>
      <table className="table table-striped custom-table " style={{ width: '90%', margin: '0 auto' }}>
        <thead>
          <tr>
            <th>Leave Request ID</th>
            <th>Employee ID</th>
            <th>Start Date</th>
            <th>No. of Days</th>
            <th>Type</th>
            <th>Status</th>
            <th>Action</th>
          </tr>
        </thead>
        <tbody>
          {leaveRequests.map((request) => (
            <tr key={request.Leave_Req_ID}>
              <td>{request.Leave_Req_ID}</td>
              <td>{request.Employee_ID}</td>
              <td>{request.Start_Date}</td>
              <td>{request.No_of_Days}</td>
              <td>{request.Type}</td>
              <td>{request.Status}</td>
              <td>
                {request.Status === 'Pending' && (
                  <div>
                    <button
                      className="btn btn-success"
                      onClick={() => updateStatus(request.Leave_Req_ID, 'Approved')}
                    >
                      Approve
                    </button>
                    <button
                      className="btn btn-danger"
                      onClick={() => updateStatus(request.Leave_Req_ID, 'Rejected')}
                    >
                      Reject
                    </button>
                  </div>
                )}
              </td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
};

export default LeaveRequest;
