import React, { useState, useEffect } from 'react';
import './style.css';
import axios from 'axios';
import { useNavigate } from 'react-router-dom';

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
  };

  function handleInputChange(event) {
    const { name, value } = event.target;
    setFormData({ ...formData, [name]: value });
  }

  return (
    <div className='d-flex justify-content-center align-items-center vh-100 loginPage'>
      <div className='p-3 rounded w-25 border loginForm'>
        <h2 style={{ textAlign: 'center' }}>Jupiter Apparels</h2>
        <h2 style={{ textAlign: 'center' }}>Login</h2>
        <form>
          <div className='mb-3'>
            <label htmlFor='User_ID'><strong>Username</strong></label> {/* Change 'email' to 'User_ID' */}
            <input
              type='text' // Change 'email' to 'text'
              placeholder='Enter Username' // Change 'Email' to 'Username'
              name='User_ID' // Change 'email' to 'User_ID'
              className='form-control rounded-0'
              autoComplete='off'
              value={formData.User_ID}
              onChange={handleInputChange}
            />
          </div>
          <div className='mb-3'>
            <label htmlFor='password'><strong>Password</strong></label>
            <input
              type='password'
              placeholder='Enter Password'
              name='password'
              className='form-control rounded-0'
              value={formData.password}
              onChange={handleInputChange}
            />
          </div>
          <button type='submit' className='btn btn-success w-100 rounded-0' onClick={handleSubmit}>Log in</button>
          <p>You agree to our terms and policies</p>
        </form>
      </div>
      <div>
      </div>
    </div>
  );
}

export default Login;
