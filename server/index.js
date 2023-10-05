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

  db.query(
    "INSERT INTO leave_request (Employee_ID, Start_Date, No_of_Days, Type, Status) VALUES (?,?,?,?,'Pending')",
    [id, startDate, day_no, type],
    (err, result) => {
      if (err) {
        console.log(err);
      } else {
        res.send("Values Inserted");
      }
    }
  );
});

//fetching emplyee details
app.get("/emp_view", (req, res) => {
  db.query("select employee_id,first_name,last_name,job_title,dept_name,pay_grade from emp_view", (err, result) => {
    if (err) {
      console.log(err);
    } else {
      res.send(result);
    }
  });
});

app.post("/addEmployee", async (req, res) => {
  const { employeeData, accountData, haveDependent } = req.body;
  console.log("haveDependent:", haveDependent);

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

    let dependentId = null; // Default to null
    if (haveDependent === true) {
      const dependentQuery = "SELECT Dependent_ID FROM Dependent_Information ORDER BY Timestamp DESC LIMIT 1";
      const dependentResult = await queryDatabase(dependentQuery);

      // Check if dependentResult exists and has a valid Dependent_ID property
      if (dependentResult && dependentResult[0] && dependentResult[0].Dependent_ID !== undefined) {
        dependentId = dependentResult[0].Dependent_ID;
      } else {
        console.error("Error fetching Dependent_ID or no dependent found.");
        // Handle the error or provide a default value if needed.
      }
    }

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
        dependentId
      ],
    ];

    await queryDatabase(sql, [values]);

    const employeeIDQuery = "SELECT Employee_ID FROM Employee_Data ORDER BY Timestamp DESC LIMIT 1";
    const employeeIDResult = await queryDatabase(employeeIDQuery);
    const employeeID = employeeIDResult[0].Employee_ID;

    const accountSql = "INSERT INTO `Employee_account` (`Employee_ID`, `User_ID`, `Password`) VALUES ?";
    const accountValues = [[employeeID, accountData.username, accountData.password]];
    await queryDatabase(accountSql, [accountValues]);

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

app.get("/getPass", (req, res) => {
  db.query("SELECT * FROM password_check", (err, result) => {
    if (err) {
      console.log(err);
    } else {
      res.send(result);
    }
  });
});

// password changing
app.post("/changePassword",(req,res)=>
{
  const userId = req.body.userId;
  const oldPassword = req.body.oldPassword;
  const newPassword = req.body.newPassword;

  db.query
  (
    "select password from employee_account where user_id =?",
    [userId],
    (err, results)=>
    {
      if (err){
        console.log(err);
        res.status.apply(500).json({message:"Internal server error"});
      }
      else if(results.length==0)
      {
        res.status(404).json({message:"User not found"});
      }
      else
      {
        const storedPassword = results[0].password;
        console.log("Received request to change password for userId:", userId);
        console.log("Old password provided:", oldPassword);

        // Check the stored password
        console.log("Stored password:", storedPassword);

        if (oldPassword == storedPassword)
        {
          db.query(
            "update employee_account set password =? where user_id = ?",
            [newPassword,userId],
            (err,updateResult)=> 
            {
              if(err){
                console.log(err);
                res.status(500).json({message:"Password update failed"});
              }
              else{
                res.status(200).json({message:"Password changed successfully"});
              }
        
            }
          );
        }
        else{
          console.log("Old password is incorrect");
          res.status(401).json({message:"Old password is incorrect"})
        }
      }
    }
  )

});

app.listen(3000, () => {
  console.log("Yey, your server is running on port 3000");
});
