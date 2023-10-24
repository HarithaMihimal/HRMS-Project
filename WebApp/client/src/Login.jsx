import React, { useState, useEffect } from 'react';
import './styles/Login.css'; // Import the Login.css file
import axios from 'axios';
import { useNavigate } from 'react-router-dom';
import { MDBBtn, MDBContainer, MDBRow, MDBCol, MDBCard, MDBCardBody, MDBInput, MDBCheckbox, MDBIcon } from 'mdb-react-ui-kit';

function Login() {
  const navigate = useNavigate();
  const [formData, setFormData] = useState({
    User_ID: '', // Change 'email' to 'User_ID'
    password: '',
  });

  const [passwordList, setPasswordList] = useState([]);

  useEffect(() => {
    getPasswords();
  }, []);

  const getPasswords = async () => {
    try {
      const response = await axios.get("http://localhost:3000/getPass");
      setPasswordList(response.data);
    } catch (error) {
      console.error("Error fetching passwords:", error);
    }
  };

  const handleSubmit = async (event) => {
    event.preventDefault();

    if (formData.User_ID === 'Admin' && formData.password === 'Admin') {
      navigate(`/PageAdmin`);
    }    

    const user_0 = passwordList.find((user) => user.User_ID === formData.User_ID); // Use 'User_ID' instead of 'email'
    const id_to_transfer = user_0.Employee_ID;
    console.log(formData.User_ID);

    if (user_0 && formData.password === user_0.Password) {
      if (user_0.Job_Title === 'HR Manager') {
        navigate(`/PageHR/${id_to_transfer}`);
      } else {
        navigate(`/PageEMP/${id_to_transfer}`);
      }
    } else {
      alert('Invalid username or password');
    }
  }

  function handleInputChange(event) {
    const { name, value } = event.target;
    setFormData({ ...formData, [name]: value });
  }

  return (
    <MDBContainer fluid className='p-4 background-radial-gradient overflow-hidden'>
  
      <MDBRow>
  
        <MDBCol md='6' className='text-center text-md-start d-flex flex-column justify-content-center'>
          <h1 className="my-5 display-3 fw-bold ls-tight px-3" style={{ color: 'hsl(218, 81%, 95%)' }}>
            Jupiter <br />
            <span style={{ color: 'hsl(218, 81%, 75%)' }}>Apparels (Pvt) Ltd</span>
          </h1>
  
          <p className='px-3' style={{ color: 'hsl(218, 81%, 85%)' }}>
            Jupiter Apparels is a multinational apparel corporation operating across Sri Lanka, Bangladesh, and Pakistan. With a workforce of over 1000 employees, they are a prominent player in the fashion industry.
          </p>
        </MDBCol>
  
        <MDBCol md='6' className='text-center position-relative'>
  
          <div id="radius-shape-1" className="position-absolute rounded-circle shadow-5-strong" style={{ top: '8%', right: '20%' }}></div>
          <div id="radius-shape-2" className="position-absolute shadow-5-strong" style={{ top: '60%', right: '10%' }}></div>
  
          <MDBCard className='my-5 bg-glass' style={{ maxWidth: '400px', height: '450px'}}>
            <MDBCardBody className='p-5 justify-content-center ' style={{ maxWidth: '400px', height: '450px'}}>
              <form>
                <div className='mb-4'> {/* Increased margin-bottom */}
                  <input
                    type='text'
                    placeholder='Enter Username'
                    name='User_ID'
                    className='form-control rounded-0'
                    autoComplete='off'
                    value={formData.User_ID}
                    onChange={handleInputChange}
                  />
                </div>
                <div className='mb-4'> {/* Increased margin-bottom */}
                  <input
                    type='password'
                    placeholder='Enter Password'
                    name='password'
                    className='form-control rounded-0'
                    value={formData.password}
                    onChange={handleInputChange}
                  />
                </div>
              </form>
  
              <div className='d-flex justify-content-center mb-4'>
                <MDBCheckbox name='flexCheck' value='' id='flexCheckDefault' label='Subscribe to our newsletter' />
              </div>
  
              <button type='submit' className='btn btn-primary w-100 rounded-0' onClick={handleSubmit}>Log in</button>
              <div className="text-center">
                <p>You agree to our terms and conditions</p>
                <MDBBtn tag='a' color='none' className='mx-3' style={{ color: '#1266f1' }}>
                  <MDBIcon fab icon='facebook-f' size="sm" />
                </MDBBtn>
                <MDBBtn tag='a' color='none' className='mx-3' style={{ color: '#1266f1' }}>
                  <MDBIcon fab icon='twitter' size="sm" />
                </MDBBtn>
                <MDBBtn tag='a' color='none' className='mx-3' style={{ color: '#1266f1' }}>
                  <MDBIcon fab icon='google' size="sm" />
                </MDBBtn>
                <MDBBtn tag='a' color='none' className='mx-3' style={{ color: '#1266f1' }}>
                  <MDBIcon fab icon='github' size="sm" />
                </MDBBtn>
              </div>
            </MDBCardBody>
          </MDBCard>
        </MDBCol>
  
      </MDBRow>
    </MDBContainer>
  );
}

export default Login;
