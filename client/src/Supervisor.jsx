import React from "react";
import { useParams } from 'react-router-dom';

function Supervisor() {
  const { id_to_transfer } = useParams();
  return (
    <div>
      <h1>This is the page for supervisor</h1>
      <h1>Here we have a dashboard and leave accept/reject option </h1>
    </div>
  );
}

export default Supervisor;
