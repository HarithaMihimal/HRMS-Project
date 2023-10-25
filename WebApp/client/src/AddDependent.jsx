import React from "react";
import { useNavigate } from 'react-router-dom';
import Axios from 'axios';
import { useParams } from 'react-router-dom';
import { Formik, Form, Field, ErrorMessage } from 'formik';
import { addDependentSchema } from './validations/AddDependentValidations';

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

  return (
    <div>
      <Formik 
        initialValues={initialDependentData} 
        validationSchema={addDependentSchema}
        onSubmit={(dependentData) => {
          localStorage.setItem('haveDependent', JSON.stringify(true));

          Axios.post("http://localhost:3000/addEmployee/addDependent", dependentData)
          .then(res => console.log(res.data))
          .catch(err => console.log(err));
          console.log("Dependent data added successfully!");
          navigate(-1);
        }}
      >
        {({props}) => (
          <Form style={{ padding: '20px', maxWidth: '800px', margin: '0 auto' }}>
            <div>
              <h4 style={{ marginBottom: '30px', marginTop: '50px' }}>Dependent Information</h4>
            </div>
            <div className="row">
              <div className="form-group col-md-6">
                <label htmlFor="inputDependentFirstName" style={{ marginTop: '15px' }}>First Name</label>
                <Field type="text" className="form-control" id="inputDependentFirstName" name="firstName" placeholder="Dependent's First Name" />
                <ErrorMessage name="firstName" component="div" className="error-message" />
              </div>
              
              <div className="form-group col-md-6">
                <label htmlFor="inputDependentLastName" style={{ marginTop: '15px' }}>Last Name</label>
                <Field type="text" className="form-control" id="inputDependentLastName" name="lastName" placeholder="Dependent's Last Name" />
                <ErrorMessage name="lastName" component="div" className="error-message" />
              </div>
              
            </div>
            <div className="form-group col-md-4">
              <label htmlFor="inputDependentGender" style={{ marginTop: '15px' }}>Gender</label>
              <Field as='select' id="inputDependentGender" name="gender" className="form-control" >
                <option>Choose...</option>
                <option>Male</option>
                <option>Female</option>
                <option>Other</option>
                <option>Prefer not to say</option>
              </Field>
              <ErrorMessage name="gender" component="div" className="error-message" />
            </div>
            
            <div className="form-group col-md-5">
              <label htmlFor="inputDependentAge" style={{ marginTop: '15px' }}>Age</label>
              <Field type="number" className="form-control" id="inputDependentAge" name="age" placeholder="Age" />
              <ErrorMessage name="age" component="div" className="error-message" />
            </div>
            
            <div className="form-group col-md-5">
              <label htmlFor="inputRelation" style={{ marginTop: '15px' }}>Relation</label>
              <Field type="text" className="form-control" id="inputRelation" name="relation" placeholder="Relation" />
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
