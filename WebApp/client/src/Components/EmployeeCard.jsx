import React from 'react';
import Button from 'react-bootstrap/Button';
import Card from 'react-bootstrap/Card';
import './EmployeeCard.css'; // Import the CSS file

function EmployeeCard({ employee }) {
  const cardStyle = {
    maxWidth: '1000px', // Adjust the width as needed
  };

  const cardBodyStyle = {
    display: 'flex',
    flexDirection: 'column',
    alignItems: 'right',
    justifyContent: 'left',
    fontSize: '20px',
  };

  return (
    <Card style={cardStyle}>
      <Card.Header as="h5">Employee Data</Card.Header>
      <Card.Body>
        <Card.Text style={cardBodyStyle}>
          <div>
            Employee ID: {employee.Employee_ID}
          </div>
          <div>
            First Name: {employee.First_name}
          </div>
          <div>
            Last Name: {employee.Last_name}
          </div>
          <div>
            Job title: {employee.Job_Title}
          </div>
          <div>
            Department: {employee.dept_name}
          </div>
          <div>
            Pay Grade: {employee.pay_grade}
          </div>
        </Card.Text>
      </Card.Body>
    </Card>
  );
}

export default EmployeeCard;
