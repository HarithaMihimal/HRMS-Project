import React, { useState } from "react";
import { useNavigate } from 'react-router-dom';
import Axios from 'axios';

function AddDependent() {
const navigate = useNavigate();

  const [dependentData, setDependentData] = React.useState({
    firstName: "",
    lastName: "",
    gender: "",
    age: "",
    relation: ""
  });

  const handleSubmit = (event) => {
    event.preventDefault();
    localStorage.setItem('haveDependent', JSON.stringify(true));

    Axios.post("http://localhost:3000/addEmployee/addDependent", dependentData)
    .then(res => console.log(res.data))
    .catch(err => console.log(err));
    navigate(-1);
  }

  return (
    <div>
      <form onSubmit={handleSubmit} style={{ padding: '20px', maxWidth: '800px', margin: '0 auto' }}>
        <div>
          <h4 style={{ marginBottom: '30px', marginTop: '50px' }}>Dependent Information</h4>
        </div>
        <div className="row">
          <div className="form-group col-md-6">
            <label htmlFor="inputDependentFirstName">First Name</label>
            <input type="text" className="form-control" id="inputDependentFirstName" placeholder="Dependent's First Name" style={{ width: '100%', marginBottom: '15px' }} 
            onChange={(event) => setDependentData({...dependentData, firstName: event.target.value})} />
          </div>
          <div className="form-group col-md-6">
            <label htmlFor="inputDependentLastName">Last Name</label>
            <input type="text" className="form-control" id="inputDependentLastName" placeholder="Dependent's Last Name" style={{ width: '100%', marginBottom: '15px' }} 
            onChange={(event) => setDependentData({...dependentData, lastName: event.target.value})} />
          </div>
        </div>
        <div className="form-group col-md-4">
          <label htmlFor="inputDependentGender">Gender</label>
          <select id="inputDependentGender" className="form-control" style={{ width: '100%', marginBottom: '15px' } } defaultValue="Choose..."
          onChange={(event) => setDependentData({...dependentData, gender: event.target.value})} >
            <option>Choose...</option>
            <option>Male</option>
            <option>Female</option>
            <option>Other</option>
            <option>Prefer not to say</option>
          </select>
        </div>
        <div className="form-group col-md-5">
          <label htmlFor="inputDependentAge">Age</label>
          <input type="number" className="form-control" id="inputDependentAge" placeholder="Age" style={{ width: '100%', marginBottom: '15px' }} 
          onChange={(event) => setDependentData({...dependentData, age: event.target.value})} />
        </div>
        <div className="form-group col-md-5">
          <label htmlFor="inputRelation">Relation</label>
          <input type="text" className="form-control" id="inputRelation" placeholder="Relation" style={{ width: '100%', marginBottom: '15px' }} 
          onChange={(event) => setDependentData({...dependentData, relation: event.target.value})} />
        </div>

        <div className="form-group">
          <div className="form-check" style={{ marginTop: '30px', marginBottom: '10px' }}>
            <input className="form-check-input" type="checkbox" id="gridCheck" />
            <label className="form-check-label" htmlFor="gridCheck">
              Check me out
            </label>
          </div>
        </div>
        <button type="submit" className="btn btn-primary" style={{ width: '100%', marginBottom: '30px' }}>Submit</button>
      </form>
    </div>
  );
}

export default AddDependent;
