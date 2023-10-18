import React from 'react';
import Table from 'react-bootstrap/Table';

function ReportOneTable({ allRequests }) {
  return (
    <div className="mt-5">
      <Table striped bordered hover size="sm">
        <thead>
          <tr>
            <th>#</th>
            <th>Employee ID</th>
            <th>Start Date</th>
            <th>No of Days</th>
            <th>Type</th>
            <th>Status</th>
          </tr>
        </thead>
        <tbody>
          {allRequests.map((request, index) => (
            <tr key={index}>
              <td>{index + 1}</td>
              <td>{request.Employee_ID}</td>
              <td>{request.Start_Date}</td>
              <td>{request.No_of_Days}</td>
              <td>{request.Type}</td>
              <td>{request.Status}</td>
            </tr>
          ))}
        </tbody>
      </Table>
    </div>
  );
}

export default ReportOneTable;
