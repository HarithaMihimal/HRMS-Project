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

app.post("/addEmployee", async (req, res) => {
  const { employeeData, accountData } = req.body;

  try {
    const employmentStatusQuery = "SELECT Status_ID FROM Employment_Status WHERE Status = ?";
    const payGradeQuery = "SELECT Pay_Grade_ID FROM Pay_Grade WHERE Pay_Grade = ?";
    const branchQuery = "SELECT Branch_No FROM Branch WHERE Branch_Name = ?";
    const departmentQuery = "SELECT Dept_ID FROM Department WHERE Dept_name = ?";

    const employmentStatusResult = await queryDatabase(employmentStatusQuery, [employeeData.employmentStatus]);
    const payGradeResult = await queryDatabase(payGradeQuery, [employeeData.payGrade]);
    const branchResult = await queryDatabase(branchQuery, [employeeData.branch]);
    const departmentResult = await queryDatabase(departmentQuery, [employeeData.department]);

    employeeData.employmentStatus = employmentStatusResult[0].Status_ID;
    employeeData.payGrade = payGradeResult[0].Pay_Grade_ID;
    employeeData.branch = branchResult[0].Branch_No;
    employeeData.department = departmentResult[0].Dept_ID;

    const sql = "INSERT INTO `Employee_Data` (`First_name`, `Last_name`, `Gender`, `Marital_status`, `Birthday`, `Email`, `Employment_status`, `Job_Title`, `Pay_Grade_ID`, `Branch_No`, `Dept_ID`, `Dependent_ID`) VALUES ?";
    const values = [
      [
        employeeData.firstName,
        employeeData.lastName,
        employeeData.gender,
        employeeData.maritalStatus,
        employeeData.birthday,
        employeeData.email,
        employeeData.employmentStatus,
        employeeData.jobTitle,
        employeeData.payGrade,
        employeeData.branch,
        employeeData.department,
        1,
      ],
    ];

    await queryDatabase(sql, [values]);
    console.log("Employee Data Inserted.");
    res.status(200).json({ message: "Employee data inserted successfully" });
  } catch (err) {
    console.error("Error:", err.message);
    res.status(500).json({ error: "Internal server error" });
  }
});

// Utility function to perform database queries with a Promise-based API
function queryDatabase(sql, params) {
  return new Promise((resolve, reject) => {
    db.query(sql, params, (err, result) => {
      if (err) {
        reject(err);
      } else {
        resolve(result);
      }
    });
  });
}

app.post("/AddEmployee/AddDependent", (req, res) => {
  const sql = "INSERT INTO `Dependent_Information` (`First_name`, `Last_name`, `Gender`, `Age`, `Relation`) VALUES (?)";
  const values = [req.body.firstName, req.body.lastName, req.body.gender, req.body.age, req.body.relation];

  db.query(sql, [values], (err, result) => {
    if (err) {
      console.log(err);
    } else {
      console.log("Dependent Data Inserted.")
    }
  })
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

