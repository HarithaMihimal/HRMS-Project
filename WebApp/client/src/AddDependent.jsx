import React, { useState } from "react";
import { useNavigate } from 'react-router-dom';
import Axios from 'axios';
import { useParams } from 'react-router-dom';
import * as Yup from 'yup';
import { useFormik, Formik, Form, Field, ErrorMessage } from 'formik';
import { addDependentSchema } from "./validations/AddDependentValidations";

function AddDependent() {
  const { id_to_transfer } = useParams();
  const navigate = useNavigate();

  const initialDependentData = {
    firstName: "",
    lastName: "",
    gender: "",
    age: "",
    relation: ""
  }

  const [dependentData, setDependentData] = React.useState(initialDependentData);

  const addDependentSchema = Yup.object({
    firstName: Yup.string().required(),
    lastName: Yup.string().required(),
    gender: Yup.string().required(),
    age: Yup.number().required(),
    relation: Yup.string().required()
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
      <Formik initialValues={initialDependentData} validationSchema={addDependentSchema}>
        {({errors}) => (
          <Form onSubmit={handleSubmit} style={{ padding: '20px', maxWidth: '800px', margin: '0 auto' }}>
            <div>
              <h4 style={{ marginBottom: '30px', marginTop: '50px' }}>Dependent Information</h4>
            </div>
            <div className="row">
              <div className="form-group col-md-6">
                <label htmlFor="inputDependentFirstName">First Name</label>
                <Field type="text" className="form-control" name="firstName" placeholder="Dependent's First Name" style={{ width: '100%', marginBottom: '15px' }} value={dependentData.firstName}
                onChange={(event) => setDependentData({...dependentData, firstName: event.target.value})} />
                <ErrorMessage name="firstName" component="div" className="error-message" />
              </div>
              
              <div className="form-group col-md-6">
                <label htmlFor="inputDependentLastName">Last Name</label>
                <Field type="text" className="form-control" id="inputDependentLastName" name="lastName" placeholder="Dependent's Last Name" style={{ width: '100%', marginBottom: '15px' }} value={dependentData.lastName}
                onChange={(event) => setDependentData({...dependentData, lastName: event.target.value})} />
                <ErrorMessage name="lastName" component="div" className="error-message" />
              </div>
              
            </div>
            <div className="form-group col-md-4">
              <label htmlFor="inputDependentGender">Gender</label>
              <Field as='select' id="inputDependentGender" name="gender" className="form-control" style={{ width: '100%', marginBottom: '15px' } } value={dependentData.gender}
              onChange={(event) => setDependentData({...dependentData, gender: event.target.value})} >
                <option>Choose...</option>
                <option>Male</option>
                <option>Female</option>
                <option>Other</option>
                <option>Prefer not to say</option>
              </Field>
              <ErrorMessage name="gender" component="div" className="error-message" />
            </div>
            
            <div className="form-group col-md-5">
              <label htmlFor="inputDependentAge">Age</label>
              <Field type="number" className="form-control" id="inputDependentAge" name="age" placeholder="Age" style={{ width: '100%', marginBottom: '15px' }} value={dependentData.age}
              onChange={(event) => setDependentData({...dependentData, age: event.target.value})} />
              <ErrorMessage name="age" component="div" className="error-message" />
            </div>
            
            <div className="form-group col-md-5">
              <label htmlFor="inputRelation">Relation</label>
              <Field type="text" className="form-control" id="inputRelation" name="relation" placeholder="Relation" style={{ width: '100%', marginBottom: '15px' }} value={dependentData.relation}
              onChange={(event) => setDependentData({...dependentData, relation: event.target.value})} />
              <ErrorMessage name="relation" component="div" className="error-message" />
            </div>
            

            <button type="submit" className="btn btn-primary" style={{ width: '100%', marginBottom: '30px', marginTop: '20px' }}>Submit</button>
          </Form>

        )}
        
      </Formik>
    </div>
  );
}

export default AddDependent;
