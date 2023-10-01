const express = require("express");
const app = express();
const mysql = require("mysql");
const cors = require("cors");

app.use(cors());
//app.use(express.json());

const db = mysql.createConnection({
user: "root",
  host: "localhost",
  password: "1234",
  database: "hrms",
});


app.get("/employee_data", (req, res) => {
    db.query("SELECT * FROM employee_data", (err, result) => {
      if (err) 
      {
        console.log(err);
      } 
      else 
      {
        res.send(result);
      }
    });
  });