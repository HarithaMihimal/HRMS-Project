import React from 'react';
import Button from 'react-bootstrap/Button';
import Card from 'react-bootstrap/Card';
import { useNavigate, useParams } from 'react-router-dom';

function ReportCard4() {
  const { id_to_transfer } = useParams();
  const navigate = useNavigate();

  const handleGenerateReport = () => {
    navigate(`/PageHR/${id_to_transfer}/ReportGenaration/Report4`);
  };

  return (
    <Card style={{ width: '18rem' }}>
      <Card.Body>
        <Card.Title className="text-center">Salary Report</Card.Title>
        <Card.Text>Generate a report for the employee records based on the salary (pay grade) of each employee</Card.Text>
        <Button variant="primary" onClick={handleGenerateReport}>Generate Report</Button>
      </Card.Body>
    </Card>
  );
}

export default ReportCard4;
