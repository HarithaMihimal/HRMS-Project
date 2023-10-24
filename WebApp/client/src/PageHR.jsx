import React from 'react';
import { useNavigate, NavLink, Outlet } from 'react-router-dom';
import { useParams } from 'react-router-dom';
import './styles/PageHR.css'; // Import the CSS file

function PageHR() {
  const { id_to_transfer } = useParams();
  console.log('id_to_transfer in PageHR:', id_to_transfer);
  const navigate = useNavigate(); // Define the navigate function

  // Handler for the sidebar navigation
  const handleSidebarLinkClick = (path) => {
    navigate(path);
  };

  return (
    <div className="page-container">
      <div className="sidebar">
      <div style={{ marginTop: '20px',marginBottom:'40px',display: 'flex',alignItems: 'center',textAlign: 'center' }}>
        <h2>Jupiter Apparels</h2></div>
        <ul>
          <li>
            <NavLink to={`/PageHR/${id_to_transfer}/EmployeeManagement`} activeClassName="active-link">
              Employee Management
            </NavLink>
          </li>
          <li>
            <NavLink to={`/PageHR/${id_to_transfer}/AddCustom`} activeClassName="active-link">
              Add Custom Attribute
            </NavLink>
          </li>
          <li>
            <NavLink to={`/PageHR/${id_to_transfer}/ReportGenaration`} activeClassName="active-link">
              Report Generation
            </NavLink>
          </li>
        </ul>
      </div>
      <div className="content">
        <h1>Isara</h1>
        <Outlet />
      </div>
    </div>
  );
}

export default PageHR;