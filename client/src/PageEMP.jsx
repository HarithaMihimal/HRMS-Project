import React from 'react';
import { useNavigate } from 'react-router-dom';

function PageEMP() {
  const navigate = useNavigate(); // Define the navigate function

  const [employee,setEmployee]=useState([]);

  const getEmployee = () => {
    Axios.get("http://localhost:3000/employee_data").then((response) => {
      setEmployee(response.data[0]);
    })
    .catch((error)=>{
        console.error("Error fectching employee data")
    });
  };

  useEffect(() => {
    getEmployee(); // Fetch employee data when the component mounts
  }, []);


  // Handler for the "Leave Request" button click
  const handleLeaveRequestClick_1 = () => {
    navigate('/PageEMP/LeaveReq'); // Navigate to the '/LeaveReq' route
  };
  const handleLeaveRequestClick_2 = () => {
    navigate('/PageEMP/PasswordChange'); 
  };
  const handleLeaveRequestClick_3 = () => {
    navigate('/PageEMP/Supervisor');
  };

  return (
    <div>
      <h1>Page for the Employee</h1>

        <h2> Employee Details</h2>
          <div className='employee'>
            <h3>Employee ID: {employee.Employee_ID}</h3>
            <h3>First Name: {employee.First_name}</h3>
            <h3>Last Name: {employee.Last_name}</h3>
            <h3>Marital Status: {employee.Marital_status}</h3>
            <h3>Birthday: {employee.Birthday}</h3>
            <h3>Email: {employee.Email}</h3>
            <h3>Status: {employee.Employment_status}</h3>
            <h3>Job title: {employee.Job_Title}</h3>
            <h3>Pay Grade ID: {employee.Pay_Grade_ID}</h3>
            <h3>Branch Number: {employee.Branch_No}</h3>
            <h3>Dept ID: {employee.Dept_ID}</h3>
            <h3>Dependent ID: {employee.Dependent_ID}</h3>

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
        <button type="button" className="btn btn-primary btn-lg custom-button" onClick={handleLeaveRequestClick_3}>
          Supervisor
        </button>
      </div>
    </div>
  );
}

export default PageEMP;
