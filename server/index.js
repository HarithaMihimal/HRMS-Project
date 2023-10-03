const express = require("express");
const app = express();
const mysql = require("mysql");
const cors = require("cors");

app.use(cors());

app.use(express.json());

const db = mysql.createConnection({
  user: "root",
  host: "localhost",
  password: "dg@Root623",
  database: "hrms",
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

app.post("/addEmployee", (req, res) => {
  const { employeeData, dependentData, accountData } = req.body;

  const sql = "INSERT INTO `Employee_Data` (`First_name`, `Last_name`, `Gender`, `Marital_status`, `Birthday`, `Email`, `Employment_status`, `Job_Title`, `Pay_Grade_ID`, `Branch_No`, `Dept_ID`, `Dependent_ID`) VALUES (?)";
  const values = [req.body.employeeData.firstName,
                  req.body.employeeData.lastName,
                  req.body.employeeData.gender,
                  req.body.employeeData.maritalStatus,
                  req.body.employeeData.birthday,
                  req.body.employeeData.email,
                  req.body.employeeData.employmentStatus,
                  req.body.employeeData.jobTitle,
                  req.body.employeeData.payGrade,
                  req.body.employeeData.branch,
                  req.body.employeeData.department ];
  
})

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

