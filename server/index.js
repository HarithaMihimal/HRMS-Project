const express = require("express");
const app = express();
const mysql = require("mysql");
const cors = require("cors");

app.use(cors());

app.use(express.json());

const db = mysql.createConnection({
  user: "root",
  host: "localhost",
  password: "s2000r@P",
  database: "hrms",
});

app.post("/createCustomAttribute", (req, res) => {
  const attributeName = req.body.attributeName;

  db.query("INSERT INTO Custom_Attribute_Definition (Attribute_Name) VALUES (?)",
    [attributeName],
    (err, result) => {
      if (err) {
        console.log(err);
        res.status(500).send("Error creating custom attribute");
      } else {
        res.status(200).send("Custom attribute created successfully");
      }
  });
});

app.post("/associateCustomAttribute", (req, res) => {
  const employeeID = req.body.employeeID;
  const attributeID = req.body.attributeID;
  const value = req.body.value;

  db.query("INSERT INTO Employee_Custom_Attribute (Attribute_ID, Employee_ID, Value) VALUES (?,?,?)",
    [attributeID, employeeID, value],
    (err, result) => {
      if (err) {
        console.log(err);
        res.status(500).send("Error associating custom attribute with employee");
      } else {
        res.status(200).send("Custom attribute associated with employee successfully");
      }
  });
});

app.get("/customAttributes", (req, res) => {
  db.query("SELECT * FROM Custom_Attribute_Definition", (err, result) => {
    if (err) {
      console.log(err);
      res.status(500).send("Error fetching custom attributes");
    } else {
      res.status(200).send(result);
    }
  });
});

app.post("/createLeaveReq", (req, res) => {
  const id = req.body.id;
  const startDate = req.body.startDate;
  const day_no = req.body.day_no;
  const type = req.body.type;

  console.log(id, startDate, day_no, type);

  db.query("INSERT INTO leave_request (Employee_ID, Start_Date, No_of_Days, Type, Status) VALUES (?,?,?,?,'Pending')",
    [id, startDate, day_no, type],
    (err, result) => {
      if (err) {
        console.log(err);
      } else {
        res.send("Values Inserted");
      }
  });
});

app.get("/employee_data", (req, res) => {
  db.query("SELECT * FROM employee_data", (err, result) => {
    if (err) {
      console.log(err);
    } else {
      res.send(result);
    }
  });
});


app.listen(3000, () => {
  console.log("Yey, your server is running on port 3000");
});
