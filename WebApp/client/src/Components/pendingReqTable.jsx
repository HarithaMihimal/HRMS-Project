import React from 'react';
import Table from 'react-bootstrap/Table';

function LeaveTable({ pendingRequests, deleteRequest }) {
  return (
    <div className="mt-5">
      <h2 style={{ textAlign: 'center' }}>Pending Leave Requests</h2>
      <Table striped bordered hover size="sm">
        <thead>
          <tr>
            <th>#</th>
            <th>Employee ID</th>
            <th>Start Date</th>
            <th>No of Days</th>
            <th>Type</th>
            <th>Action</th>
          </tr>
        </thead>
        <tbody>
          {pendingRequests.map((request, index) => (
            <tr key={index}>
              <td>{index + 1}</td>
              <td>{request.Employee_ID}</td>
              <td>{request.Start_Date}</td>
              <td>{request.No_of_Days}</td>
              <td>{request.Type}</td>
              <td>
                <button
                  className="btn btn-danger"
                  onClick={() => deleteRequest(request.Leave_Req_ID)}
                >
                  Delete
                </button>
              </td>
            </tr>
          ))}
        </tbody>
      </Table>
    </div>
  );
}

export default LeaveTable;
