const express = require("express");
const app = express();
const mysql = require("mysql");
const cors = require("cors");

app.use(cors());

app.use(express.json());

const db = mysql.createConnection({
  user: "root",
  host: "localhost",
  password: "1234",
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


app.get("/getPass", (req, res) => {
  db.query("SELECT * FROM password_check", (err, result) => {
    if (err) {
      console.log(err);
    } else {
      res.send(result);
    }
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
