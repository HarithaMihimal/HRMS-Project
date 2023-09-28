import React from 'react';
import { BrowserRouter, Route, Routes } from 'react-router-dom';
import Login from './Login';
import PageEMP from './PageEMP'; 
import PageHR from './PageHR';
import LeaveReq from './LeaveReq';
import PasswordChange from './PasswordChange';
import Supervisor from './Supervisor';
import AddEmployee from './AddEmployee';
import AddCustom from './AddCustom';

function App() {
  return (
    <BrowserRouter>
      <Routes>
        <Route path="/" element={<Login />} />
        <Route path="/PageEMP" element={<PageEMP />} />
        <Route path="/PageHR" element={<PageHR />} />
        <Route path="/PageEMP/LeaveReq" element={<LeaveReq />} />
        <Route path="/PageEMP/PasswordChange" element={<PasswordChange />} />
        <Route path="/PageEMP/Supervisor" element={<Supervisor />} />
        <Route path="/PageHR/AddEmployee" element={<AddEmployee />} />
        <Route path="/PageHR/AddCustom" element={<AddCustom />} />
      </Routes>
    </BrowserRouter>
  );
}


export default App;
