import React, { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import Axios from 'axios';
import { useParams } from 'react-router-dom';

function PageEMP() {
  const { id_to_transfer } = useParams();
  console.log('id_to_transfer in PageEMP:', id_to_transfer);
  const navigate = useNavigate();

  const [employee, setEmployee] = useState([]);
  const [supervisors, setSupervisors] = useState([]);

  useEffect(() => {
    const fetchData = async () => {
      try {
        console.log('id_to_transfer in PageEMP:', id_to_transfer);

        const [employeeResponse, supervisorsResponse] = await Promise.all([
          Axios.get(`http://localhost:3000/emp_view/${id_to_transfer}`),
          Axios.get(`http://localhost:3000/fetchSupervisors`)
        ]);

        setEmployee(employeeResponse.data);
        console.log('employee:', employeeResponse.data);
        setSupervisors(supervisorsResponse.data);
      } catch (error) {
        console.error("Error fetching data", error);
      }
    };
    fetchData();
  }, [id_to_transfer]);

  const handleLeaveRequestClick_1 = () => {
    navigate(`/PageEMP/${id_to_transfer}/LeaveReq`);
  };

  const handleLeaveRequestClick_2 = () => {
    navigate(`/PageEMP/${id_to_transfer}/PasswordChange`);
  };

  const handleLeaveRequestClick_3 = () => {
    if (supervisors.some(supervisor => supervisor.Supervisor_ID === id_to_transfer)) {
      navigate(`/PageEMP/${id_to_transfer}/Supervisor`);
    }
  };

  return (
    <div>
      <h1>Page for the Employee</h1>

      <h2> Employee Details</h2>
      <div className='employee'>
        <h3>Employee ID: {employee.Employee_ID}</h3>
        <h3>First Name: {employee.First_name}</h3>
        <h3>Last Name: {employee.Last_name}</h3>
        <h3>Job title: {employee.Job_Title}</h3>
        <h3>Department: {employee.dept_name}</h3>
        <h3>Pay Grade: {employee.pay_grade}</h3>
      </div>
      <div className="d-flex justify-content-center">
        <button type="button" className="btn btn-primary btn-lg custom-button" onClick={handleLeaveRequestClick_1}>
          Leave Request
        </button>
      </div>
      <div className="d-flex justify-content-center">
        <button type="button" className="btn btn-primary btn-lg custom-button" onClick={handleLeaveRequestClick_2}>
          Change your password
        </button>
      </div>
      <div className="d-flex justify-content-center">
        <button
          type="button"
          className="btn btn-primary btn-lg custom-button"
          onClick={handleLeaveRequestClick_3}
          disabled={!supervisors.some(supervisor => supervisor.Supervisor_ID === id_to_transfer)}
        >
          Supervisor
        </button>
      </div>
    </div>
  );
}

export default PageEMP;
