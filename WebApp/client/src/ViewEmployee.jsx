import React, { useState, useEffect } from "react";
import { useParams } from 'react-router-dom';
import Axios from 'axios';

function ViewEmployee() {
  const { id_to_view } = useParams();
  const [employeeData, setEmployeeData] = useState(null); // State to store employee data
  const [contactNumbers, setContactNumbers] = useState([]); // State to store contact numbers

  useEffect(() => {
    Axios.get(`http://localhost:3000/employeeDetailForHR/${id_to_view}`)
    .then((response) => {
        setEmployeeData(response.data.employee);
        setContactNumbers(response.data.contact);
    })
    .catch((error) => {
        console.error('Error fetching employee data:', error);
    });
  }, [id_to_view]);

  const date = new Date(employeeData?.Birthday);

  return (
    <div style={{marginLeft: '20px', marginRight: '20px'}}>
      <h1>This is the view employee page</h1>
      <div className="d-flex flex-column align-items-center" style={{
        border: '2px solid black',
        padding: '20px',
        marginTop: '50px',
        marginBottom: '50px',
        marginLeft: 'auto',
        marginRight: 'auto',
        borderRadius: '5px',
        width: '50%',
        display: 'flex',
        flexDirection: 'column',
        alignItems: 'center',
      }}>
        <h3 style={{marginBottom: '20px'}}>Employee Details</h3>
        {employeeData ? (
          <div>
            <h5>Employee ID: {employeeData.Employee_ID}</h5>
            <h5>Name: {employeeData.First_Name} {employeeData.Last_Name}</h5>
            <h5>Username: {employeeData.User_ID}</h5>
            <h5>Gender: {employeeData.Gender}</h5>
            <h5>Marital Status: {employeeData.Marital_Status}</h5>
            <h5>Birthday: {date.toLocaleDateString()}</h5>
            <h5>Contact Numbers:</h5>
                <ul>
                {contactNumbers.map((contact, index) => (
                    <li key={index}><h5>{contact.Contact_Number}</h5></li>
                ))}
                </ul>
            <h5>Email: {employeeData.Email}</h5>
            <h5>Employment_Status: {employeeData.Employment_Status}</h5>
            <h5>Job Title: {employeeData.Job_Title}</h5>
            <h5>Pay Grade: {employeeData.Pay_Grade}</h5>
            <h5>Branch: {employeeData.Branch_Name}</h5>
            <h5>Department: {employeeData.Dept_Name}</h5>
          </div>
        ) : (
          <h5>Loading employee data...</h5>
        )}
      </div>
      <div className="d-flex flex-column align-items-center" style={{
        border: '2px solid black',
        padding: '20px',
        marginTop: '50px',
        marginBottom: '50px',
        marginLeft: 'auto',
        marginRight: 'auto',
        borderRadius: '5px',
        width: '50%',
        display: 'flex',
        flexDirection: 'column',
        alignItems: 'center',
      }}>
        <h3 style={{marginBottom: '20px'}}>Dependent Details</h3>
        {employeeData && employeeData.Dependent_ID ? (
          <div>
            <h5>Dependent ID: {employeeData.Dependent_ID}</h5>
            <h5>Dependent's Name: {employeeData.dFirst_Name} {employeeData.dLast_Name}</h5>
            <h5>Age: {employeeData.Age}</h5>
            <h5>Gender: {employeeData.dGender}</h5>
            <h5>Relation: {employeeData.Relation}</h5>
          </div>
        ) : (
          <h5>Doesn't have a dependent...</h5>
        )}
      </div>
    </div>
  );
}

export default ViewEmployee;
