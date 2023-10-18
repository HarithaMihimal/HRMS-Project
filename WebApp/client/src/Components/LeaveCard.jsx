import React from 'react';
import Card from 'react-bootstrap/Card';
import './LeaveCard.css'; // Import your CSS file

function LeaveCard({ title, days }) {
  return (
    <Card className="leave-card">
      <Card.Body>
        <h5 className="card-title">{title}</h5>
        <p className="card-text">{days} days</p>
      </Card.Body>
    </Card>
  );
}

export default LeaveCard;
