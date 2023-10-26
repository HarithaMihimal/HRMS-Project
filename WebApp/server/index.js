const express = require("express");
const app = express();
const mysql = require("mysql");
const cors = require("cors");

require("dotenv").config();

app.use(cors());

app.use(express.json());

const db = mysql.createConnection({
  user: process.env.DB_USER,
  host: process.env.DB_HOST,
  password: process.env.DB_PASSWORD,
  database: process.env.DB_NAME,
});

app.post("/createCustomAttribute", (req, res) => {
  const attributeName = req.body.attributeName;

  db.query(
    "INSERT INTO Custom_Attribute_Definition (Attribute_Name) VALUES (?)",
    [attributeName],
    (err, result) => {
      if (err) {
        console.log(err);
        res.status(500).send("Error creating custom attribute");
      } else {
        res.status(200).send("Custom attribute created successfully");
      }
    }
  );
});

app.post("/associateCustomAttribute", (req, res) => {
  const employeeID = req.body.employeeID;
  const attributeID = req.body.attributeID;
  const value = req.body.value;

  db.query(
    "INSERT INTO Employee_Custom_Attribute (Attribute_ID, Employee_ID, Value) VALUES (?,?,?)",
    [attributeID, employeeID, value],
    (err, result) => {
      if (err) {
        console.log(err);
        res
          .status(500)
          .send("Error associating custom attribute with employee");
      } else {
        res
          .status(200)
          .send("Custom attribute associated with employee successfully");
      }
    }
  );
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

app.get("/emp_view/:id_to_transfer", (req, res) => {
  const id_to_transfer = req.params.id_to_transfer;
  console.log("id_to_transfer:", id_to_transfer);

  // Define the SQL query to retrieve the employee record based on the provided ID
  const sql =
    "SELECT Employee_ID, First_name, Last_name, Job_Title, Dept_name, Pay_Grade FROM emp_view WHERE Employee_ID = ?";

  db.query(sql, [id_to_transfer], (err, result) => {
    if (err) {
      console.error("Error fetching employee data:", err);
      res.status(500).json({ error: "Internal Server Error" });
    } else {
      if (result.length > 0) {
        res.status(200).json(result[0]); // Return the first record (should be unique by ID)
      } else {
        res.status(404).json({ error: "Employee not found" });
      }
    }
  }); // Missing closing parenthesis
});

app.get("/fetchSupervisors", (req, res) => {
  const sql = "SELECT DISTINCT Supervisor_ID FROM supervisor";

  db.query(sql, (error, results) => {
    if (error) {
      console.error("Error fetching supervisor data:", error);
      res.status(500).json({ error: "Internal server error" });
    } else {
      res.json(results);
    }
  });
});

app.post("/addEmployee", async (req, res) => {
  const { employeeData, haveDependent } = req.body;

  db.query('CALL AddEmployee(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)',
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

      haveDependent,

      employeeData.username,
      employeeData.password,

      JSON.stringify(employeeData.contact), // You may need to stringify the JSON object
    ],
    (error, results, fields) => {
      if (error) {
        console.error('Error updating employee data:', error);
      } else {
        console.log('Employee data inserted successfully.');
      }
  
    })
});

app.post("/AddEmployee/AddDependent", (req, res) => {
  const sql =
    "INSERT INTO `Dependent_Information` (`First_name`, `Last_name`, `Gender`, `Age`, `Relation`) VALUES (?)";
  const values = [
    req.body.firstName,
    req.body.lastName,
    req.body.gender,
    req.body.age,
    req.body.relation,
  ];

  db.query(sql, [values], (err, result) => {
    if (err) {
      console.log(err);
    } else {
      console.log("Dependent Data Inserted.");
    }
  });
});

app.get("/addEmployee/employmentStatus", (req, res) => {
  const sql = "SELECT * FROM Employment_Status";

  db.query(sql, (err, result) => {
    if (err) {
      console.log(err);
      res.status(500).send("Error fetching employment statuses");
    } else {
      res.status(200).send(result);
    }
  });
});

app.get("/addEmployee/payGrade", (req, res) => {
  const sql = "SELECT Pay_Grade_ID, Pay_Grade FROM Pay_Grade";

  db.query(sql, (err, result) => {
    if (err) {
      console.log(err);
      res.status(500).send("Error fetching pay grades");
    } else {
      res.status(200).send(result);
    }
  });
});

app.get("/addEmployee/department", (req, res) => {
  const sql = "SELECT Dept_ID, Dept_Name FROM Department";

  db.query(sql, (err, result) => {
    if (err) {
      console.log(err);
      res.status(500).send("Error fetching departments");
    } else {
      res.status(200).send(result);
    }
  });
});

app.get("/addEmployee/branch", (req, res) => {
  const sql = "SELECT Branch_ID, Branch_Name FROM Branch";

  db.query(sql, (err, result) => {
    if (err) {
      console.log(err);
      res.status(500).send("Error fetching branches");
    } else {
      res.status(200).send(result);
    }
  });
});

app.get("/employeeDetailForHR/:id", (req, res) => {
  const employeeId = req.params.id;
  const empQuery = "SELECT * FROM Employee_Details WHERE Employee_ID = ?";
  const contactQuery =
    "SELECT * FROM Contact_Number_Details WHERE Employee_ID = ?";

  // Perform the employee details query
  db.query(empQuery, [employeeId], (err, employeeResult) => {
    if (err) {
      console.error(err);
      res.status(500).json({ error: "Error fetching employee details" });
    } else {
      // Perform the contact details query
      db.query(contactQuery, [employeeId], (err, contactResult) => {
        if (err) {
          console.error(err);
          res.status(500).json({ error: "Error fetching contact details" });
        }

        // Combine the results into a single response
        const output = { employee: employeeResult[0], contact: contactResult };

        // Send the response with the combined data
        res.status(200).json(output);
      });
    }
  });
});

app.post("/editEmployee", async (req, res) => {
  db.query(
    "CALL Update_Employee_Data(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)",
    [
      req.body.employeeID,
      req.body.firstName,
      req.body.lastName,
      req.body.gender,
      req.body.maritalStatus,
      req.body.birthday,
      req.body.email,
      req.body.jobTitle,
      req.body.payGrade,
      req.body.branch,
      req.body.department,
      req.body.employmentStatus,

      req.body.dependentID,
      req.body.dFirstName,
      req.body.dLastName,
      req.body.dGender,
      req.body.age,
      req.body.relation,

      JSON.stringify(req.body.contact), // You may need to stringify the JSON object
    ],
    (error, results, fields) => {
      if (error) {
        console.error("Error updating employee data:", error);
      } else {
        console.log("Employee data updated successfully.");
      }
    }
  );
});

app.get("/employeeData", (req, res) => {
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
app.post("/changePassword/:id_to_transfer", (req, res) => {
  const id_to_transfer = req.params.id_to_transfer;
  const oldPassword = req.body.oldPassword;
  const newPassword = req.body.newPassword;
  console.log("userId:", id_to_transfer);

  db.query(
    "select password from employee_account where Employee_ID = ?",
    [id_to_transfer],
    (err, results) => {
      if (err) {
        console.log(err);
        res.status.apply(500).json({ message: "Internal server error" });
      } else if (results.length == 0) {
        res.status(404).json({ message: "User not found" });
      } else {
        const storedPassword = results[0].password;
        console.log(
          "Received request to change password for userId:",
          id_to_transfer
        );
        console.log("Old password provided:", oldPassword);

        // Check the stored password
        console.log("Stored password:", storedPassword);

        if (oldPassword == storedPassword) {
          db.query(
            "update employee_account set password =? where Employee_ID = ?",
            [newPassword, id_to_transfer],
            (err, updateResult) => {
              if (err) {
                console.log(err);
                res.status(500).json({ message: "Password update failed" });
              } else {
                res
                  .status(200)
                  .json({ message: "Password changed successfully" });
              }
            }
          );
        } else {
          console.log("Old password is incorrect");
          res.status(401).json({ message: "Old password is incorrect" });
        }
      }
    }
  );
});

// Route to fetch leave requests
app.get("/leave_request", (req, res) => {
  const id = req.query.id_to_transfer;
  console.log("id:", id);
  const query = "SELECT * FROM supervisor_leave_accept where Supervisor_ID = ?";
  db.query(query, [id], (error, results) => {
    if (error) {
      console.error("Error fetching leave requests:", error);
      res.status(500).json({ error: "Internal Server Error" });
    } else {
      res.status(200).json(results);
    }
  });
});

// Route to update the status of a leave request
app.put("/leave_request/:leaveReqID", (req, res) => {
  const { leaveReqID } = req.params;
  const { status } = req.body;

  const query = "UPDATE leave_request SET Status = ? WHERE Leave_Req_ID = ?";
  db.query(query, [status, leaveReqID], (error, results) => {
    if (error) {
      console.error("Error updating status:", error);
      res.status(500).json({ error: "Internal Server Error" });
    } else {
      res.status(200).json({ message: "Status updated successfully" });
    }
  });
});

app.get("/pendingLeaveRequests/:id_to_transfer", (req, res) => {
  const id_to_transfer = req.params.id_to_transfer; // Correctly access the parameter
  const query =
    "SELECT * FROM leave_request WHERE Employee_ID = ? and Status = 'Pending'";
  db.query(query, [id_to_transfer], (error, results) => {
    if (error) {
      console.error("Error fetching leave requests:", error);
      res.status(500).json({ error: "Internal Server Error" });
    } else {
      res.status(200).json(results);
    }
  });
});
app.get("/rejectedLeaveRequests/:id_to_transfer", (req, res) => {
  const id_to_transfer = req.params.id_to_transfer; // Correctly access the parameter
  const query =
    "SELECT * FROM leave_request WHERE Employee_ID = ? and Status = 'Rejected'";
  db.query(query, [id_to_transfer], (error, results) => {
    if (error) {
      console.error("Error fetching leave requests:", error);
      res.status(500).json({ error: "Internal Server Error" });
    } else {
      res.status(200).json(results);
    }
  });
});

app.get("/fetchAllLeaves/:id_to_transfer", (req, res) => {
  const id_to_transfer = req.params.id_to_transfer; // Correctly access the parameter
  const query = "SELECT * FROM leave_count_gender WHERE Employee_ID = ?";
  db.query(query, [id_to_transfer], (error, results) => {
    if (error) {
      console.error("Error fetching leave limits:", error);
      res.status(500).json({ error: "Internal Server Error" });
    } else {
      res.status(200).json(results);
    }
  });
});

app.get("/fetchtakenLeaves/:id_to_transfer", (req, res) => {
  const id_to_transfer = req.params.id_to_transfer; // Correctly access the parameter
  const query = "SELECT * FROM employee_leave_count WHERE Employee_ID = ?";
  db.query(query, [id_to_transfer], (error, results) => {
    if (error) {
      console.error("Error fetching leave limits:", error);
      res.status(500).json({ error: "Internal Server Error" });
    } else {
      res.status(200).json(results);
    }
  });
});

app.delete("/deleteLeaveRequest/:requestId", (req, res) => {
  const requestId = req.params.requestId;

  const query = "DELETE FROM leave_request WHERE Leave_Req_ID = ?";
  db.query(query, [requestId], (error, results) => {
    if (error) {
      console.error("Error deleting leave request:", error);
      res.status(500).json({ error: "Internal Server Error" });
    } else {
      res.status(200).json({ message: "Request deleted successfully" });
    }
  });
});

app.get("/fetchLeaveRequests", (req, res) => {
  const query = "SELECT * FROM leave_request";
  db.query(query, (error, results) => {
    if (error) {
      console.error("Error querying the database: " + error);
      res.status(500).json({ error: "Internal server error" });
    } else {
      res.json(results);
    }
  });
});
app.get("/fetchLeaveRequestsDept", (req, res) => {
  const time = req.query.time; // Assuming the "time" variable is sent from the front end as a query parameter
  console.log("time:", time);
  let interval = ""; // Define an empty interval string

  if (time === "month") {
    interval = "1 MONTH";
  } else if (time === "year") {
    interval = "1 YEAR";
  } else {
    // Handle invalid or missing "time" parameter
    return res
      .status(400)
      .json({ error: "Invalid or missing 'time' parameter" });
  }

  const query = `SELECT * FROM leave_req_dept_2 WHERE start_date BETWEEN DATE_SUB(CURDATE(), INTERVAL ${interval}) AND CURDATE()`;

  db.query(query, (error, results) => {
    if (error) {
      console.error("Error querying the database: " + error);
      res.status(500).json({ error: "Internal server error" });
    } else {
      res.json(results);
    }
  });
});

app.listen(3000, () => {
  console.log("Yey, your server is running on port 3000");
});
