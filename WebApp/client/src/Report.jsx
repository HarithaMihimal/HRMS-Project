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
      <div style={{ display: 'flex', alignItems: 'center', justifyContent: 'center', height: '20vh' }}>
        <h1>Report Generation Page</h1>
      </div>

      <div className="d-flex justify-content-center mb-4">
        <div className="dark-border"> {/* Apply the dark-border class */}
          <ReportCard1 />
        </div>
      </div>

      <div className="d-flex justify-content-center mb-4">
        <div className="dark-border"> {/* Apply the dark-border class */}
          <ReportCard2 />
        </div>
      </div>

      <div className="d-flex justify-content-center mb-4">
        <div className="dark-border"> {/* Apply the dark-border class */}
          <ReportCard3 />
        </div>
      </div>

      <div className="d-flex justify-content-center mb-4">
        <div className="dark-border"> {/* Apply the dark-border class */}
          <ReportCard4 />
        </div>
      </div>

      <div className="d-flex justify-content-center mb-4">
        <div className="dark-border"> {/* Apply the dark-border class */}
          <ReportCard5 />
        </div>
      </div>
    </div>
  );
}

export default ReportGeneration;
