import React from "react";
import { useParams } from 'react-router-dom';
import ReportCard1 from "./Components/ReportCard1";
import ReportCard2 from "./Components/ReportCard2";
import ReportCard3 from "./Components/ReportCard3";
import ReportCard4 from "./Components/ReportCard4";
import ReportCard5 from "./Components/ReportCard5";

function ReportGeneration() {
  const { id_to_transfer } = useParams();

  return (
    <div>
      <h1>Here we can generate reports</h1>
      <div className="d-flex justify-content-center">
        <ReportCard1 />
      </div>
      <div className="d-flex justify-content-center">
        <ReportCard2 />
      </div>
      <div className="d-flex justify-content-center">
        <ReportCard3 />
      </div>
      <div className="d-flex justify-content-center">
        <ReportCard4 />
      </div>
      <div className="d-flex justify-content-center">
        <ReportCard5 />
      </div>
    </div>
  );
}

export default ReportGeneration;
