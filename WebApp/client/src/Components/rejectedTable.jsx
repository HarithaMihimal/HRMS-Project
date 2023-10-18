import React from 'react';
import Table from 'react-bootstrap/Table';

function RejectTable({ rejectedRequests }) {
  return (
    <div className="mt-5">
      <h2 style={{ textAlign: 'center' }}>Rejected Leave Requests</h2>
      <Table striped bordered hover size="sm">
        <thead>
          <tr>
            <th>#</th>
            <th>Employee ID</th>
            <th>Start Date</th>
            <th>No of Days</th>
            <th>Type</th>
          </tr>
        </thead>
        <tbody>
          {rejectedRequests.map((request, index) => (
            <tr key={index}>
              <td>{index + 1}</td>
              <td>{request.Employee_ID}</td>
              <td>{request.Start_Date}</td>
              <td>{request.No_of_Days}</td>
              <td>{request.Type}</td>
            </tr>
          ))}
        </tbody>
      </Table>
    </div>
  );
}

export default RejectTable;
