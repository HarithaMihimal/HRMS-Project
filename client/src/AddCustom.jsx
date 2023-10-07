import React, { useState, useEffect } from 'react';
import axios from 'axios';
import { useParams } from 'react-router-dom';

function AddCustom() {
  const { id_to_transfer } = useParams();
  const [customAttributes, setCustomAttributes] = useState([]);
  const [selectedAttributeID, setSelectedAttributeID] = useState('');
  const [customAttributeValue, setCustomAttributeValue] = useState('');
  const [customAttributeName, setCustomAttributeName] = useState('');
  const [employeeID, setEmployeeID] = useState(''); // Specify employee ID here
  const [successMessage, setSuccessMessage] = useState('');
  const [successMessage2, setSuccessMessage2] = useState('');


  useEffect(() => {
    const storedSuccessMessage = localStorage.getItem('successMessage');

    if (storedSuccessMessage) {
      // Display the success message.
      setSuccessMessage(storedSuccessMessage);

      // Clear the success message from local storage.
      localStorage.removeItem('successMessage');
    }
    // Fetch the list of custom attribute definitions from your API or database
    // and set it in the customAttributes state.
    axios.get('http://localhost:3000/customAttributes')
      .then((response) => {
        setCustomAttributes(response.data);
      })
      .catch((error) => console.error('Error fetching custom attributes:', error));
  }, []);

  const handleAddCustomAttributeDefinition = () => {
    if (customAttributeName) {
      // Send a POST request to your API to add the custom attribute definition.
      axios.post('http://localhost:3000/createCustomAttribute', {
        attributeName: customAttributeName,
      })
        .then((response) => {
          // Handle success or show a notification to the user.
          console.log('Custom attribute definition added:', response.data);
          // You can also update the UI to reflect the added definition.
          // After adding the definition, it will appear in the dropdown for selection.
          setCustomAttributes([...customAttributes, response.data]);
          setSelectedAttributeID(response.data.Attribute_ID);
          localStorage.setItem('successMessage', 'The Attribute added successfully');
          window.location.reload();
          setSuccessMessage('The attribute was added successfully.');
         
        })
        .catch((error) => {
          console.error('Error adding custom attribute definition:', error);
          setSuccessMessage('Error adding custom attribute to employee.');
        });
    } else {
      // Handle validation or show an error message.
      console.error('Invalid input');
      setSuccessMessage('Invalid input. Please check your input fields.');
    }
  };

  const handleAddCustomAttributeToEmployee = () => {
    if (employeeID && selectedAttributeID && customAttributeValue) {
      // Send a POST request to your API to associate the custom attribute with the employee
      // and set its value.
      axios.post('http://localhost:3000/associateCustomAttribute', {
        employeeID: employeeID,
        attributeID: selectedAttributeID,
        value: customAttributeValue,
      })
        .then((response) => {
          // Handle success or show a notification to the user.
          console.log('Custom attribute added to employee:', response.data);
          // You can also update the UI to reflect the added custom attribute for the employee.
          setSuccessMessage2('Custom attribute value added to the employee successfully.');
        })
        .catch((error) => console.error('Error adding custom attribute to employee:', error));
    } else {
      // Handle validation or show an error message.
      console.error('Invalid input');
    }
  };

  return (
    <div>
      <h1>Add Custom Attribute</h1>
      <label>
        Custom Attribute Name:
        <input
          type="text"
          value={customAttributeName}
          onChange={(e) => setCustomAttributeName(e.target.value)}
        />
      </label>
      <br />
      <button onClick={handleAddCustomAttributeDefinition}>Add Custom Attribute Definition</button>
      <br />
      {successMessage && (
      <div className="success-message">
        {successMessage}
      </div>
    )}
      <label>
        EmployeeID:
        <input
          type="text"
          value={employeeID}
          onChange={(e) => setEmployeeID(e.target.value)}
        />
      </label>
      <br />
      <label>
        Select Attribute:
        <select
          value={selectedAttributeID}
          onChange={(e) => setSelectedAttributeID(e.target.value)}
        >
          <option value="">Select Attribute</option>
          {customAttributes.map((attribute) => (
            <option key={attribute.Attribute_ID} value={attribute.Attribute_ID}>
              {attribute.Attribute_Name}
            </option>
          ))}
        </select>
      </label>
      <br />
      <label>
        Custom Attribute Value:
        <input
          type="text"
          value={customAttributeValue}
          onChange={(e) => setCustomAttributeValue(e.target.value)}
        />
      </label>
      <br />
      <button onClick={handleAddCustomAttributeToEmployee}>Add Custom Attribute to Employee</button>
      {successMessage && (
        <div className="success-message">
          {successMessage2}
        </div>
      )}
    </div>
  );
}



export default AddCustom;
