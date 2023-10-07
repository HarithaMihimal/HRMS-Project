import React, { useState } from 'react';
import Axios from 'axios';
import { useParams } from 'react-router-dom';

function PasswordChange() {
  const { id_to_transfer } = useParams();
  // State variables
  const [oldPassword, setOldPassword] = useState('');
  const [newPassword, setNewPassword] = useState('');
  const [confirmPassword, setConfirmPassword] = useState('');
  const [message, setMessage] = useState('');

  // Handle form submission
  const handleFormSubmit = (e) => {
    e.preventDefault();

    // Check if new password and confirm password match
    if (newPassword !== confirmPassword) {
      setMessage('New password and confirm password do not match.');
      return;
    }

    // Send a POST request to change the password
    Axios.post('http://localhost:3000/changePassword', {
      userId: 'accountant22',
      oldPassword: oldPassword,
      newPassword: newPassword,
    })
      .then((response) => {
        if (response.status === 200) {
          // Password change successful
          setMessage('Password changed successfully.');
          setOldPassword('');
          setNewPassword('');
          setConfirmPassword('');
        } else if (response.status === 401) {
          // Old password is incorrect
          setMessage('Old password is incorrect.');
        } else {
          // Password change failed for other reasons
          setMessage('Password change failed. Please try again.');
        }
      })
      .catch((error) => {
        console.error(error);
        setMessage('An error occurred. Please try again later.');
      });
  };

  return (
    <div>
      <h1>Here you can change your password</h1>
      {message && <p>{message}</p>}
      <form onSubmit={handleFormSubmit}>
        <div>
          <label>Old password: </label>
          <input
            type="password"
            placeholder="Enter your old password"
            value={oldPassword}
            onChange={(e) => setOldPassword(e.target.value)}
            required
          />
        </div>
        <div>
          <label>New password: </label>
          <input
            type="password"
            placeholder="Enter your new password"
            value={newPassword}
            onChange={(e) => setNewPassword(e.target.value)}
            required
          />
        </div>
        <div>
          <label>Confirm Password:</label>
          <input
            type="password"
            placeholder="Confirm your new password"
            value={confirmPassword}
            onChange={(e) => setConfirmPassword(e.target.value)}
            required
          />
        </div>
        <button type="submit">Change the password</button>
      </form>
    </div>
  );
}

export default PasswordChange;
