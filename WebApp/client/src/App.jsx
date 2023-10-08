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
import AddDependent from './AddDependent';

function App() {
  return (
    <BrowserRouter>
      <Routes>
        <Route path="/" element={<Login />} />
        <Route path="/PageHR/:id_to_transfer" element={<PageHR />} />
      <Route path="/PageEMP/:id_to_transfer" element={<PageEMP />} />
        <Route path="/PageEMP/:id_to_transfer/LeaveReq" element={<LeaveReq />} />
        <Route path="/PageEMP/:id_to_transfer/PasswordChange" element={<PasswordChange />} />
        <Route path="/PageEMP/:id_to_transfer/Supervisor" element={<Supervisor />} />
        <Route path="/PageHR/:id_to_transfer/AddEmployee" element={<AddEmployee />} />
        <Route path="/PageHR/:id_to_transfer/AddEmployee/AddDependent" element={<AddDependent />} />
        <Route path="/PageHR/:id_to_transfer/AddCustom" element={<AddCustom />} />
      </Routes>
    </BrowserRouter>
  );
}


export default App;
