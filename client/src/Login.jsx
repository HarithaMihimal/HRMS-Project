import React, { useState } from 'react';
import './style.css';
import axios from 'axios';
import { useNavigate } from 'react-router-dom';

function Login() {
  const navigate = useNavigate();
  const [formData, setFormData] = useState({
    email: '',
    password: '',
  });

  const [passwordList, setPasswordList] = useState([]);

  const getPasswords = () => {
    axios.get("http://localhost:3000/getPass").then((response) => {
      setPasswordList(response.data);
    });
  };

  function handleSubmit(event) {
    event.preventDefault();
    if (formData.email === 'emp@gmail.com') {
      // Navigate to page one
      navigate('/PageEMP');
    } else if (formData.email === 'HR@gmail.com') {
      // Navigate to page two
      navigate('/PageHR');
    } else {
      alert('Invalid username');
    }
  }

  function handleInputChange(event) {
    const { name, value } = event.target;
    setFormData({ ...formData, [name]: value });
  }

  return (
    <div className='d-flex justify-content-center align-items-center vh-100 loginPage'>
      <div className='p-3 rounded w-25 border loginForm'>
        <h2 style={{ textAlign: 'center' }}>Jupiter Apparels</h2>

        <h2 style={{ textAlign: 'center' }}>Login</h2>
        <form onSubmit={handleSubmit}>
          <div className='mb-3'>
            <label htmlFor="email"><strong>Email</strong></label>
            <input
              type="email"
              placeholder='Enter Email'
              name='email'
              className='form-control rounded-0'
              autoComplete='off'
              value={formData.email}
              onChange={handleInputChange}
            />
          </div>
          <div className='mb-3'>
            <label htmlFor="password"><strong>Password</strong></label>
            <input
              type="password"
              placeholder='Enter Password'
              name='password'
              className='form-control rounded-0'
              value={formData.password}
              onChange={handleInputChange}
            />
          </div>
          <button type='submit' className='btn btn-success w-100 rounded-0'>Log in</button>
          <p>You agree to our terms and policies</p>
          </form>
      </div>

      <button onClick={getPasswords}>Show Passwords</button>

      {passwordList.map((val, key) => (
        <div>
          <div>
          <h3>Username: {val.User_ID}</h3>
          <h3>Password: {val.Password}</h3>
          </div>
        </div>
          
      ))}

    </div>

  );
}

export default Login;
