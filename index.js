const express = require("express");
const {Client} = require('pg');
const app = express();
const bodyParser = require("body-parser");
const cors = require("cors");
//const e = require("express");

const client = new Client({
    host: "localhost",
    user: "postgres",
    database: "assignment2",
    password: "200915Tima*",
});

client.connect();

app.use(cors());
app.use(express.json());
app.use(bodyParser.urlencoded({extended: true}));

app.get("/api/get/DiseaseType", (req, res) => {
    const postGet = "SELECT * FROM DiseaseType";
    client.query(postGet, (err,result) => {
        res.send(result.rows);
    })
})

app.get("/api/get/Country", (req, res) => {
    const postGet = "SELECT * FROM Country";
    client.query(postGet, (err,result) => {
        res.send(result.rows);
    })
})

app.get("/api/get/Disease", (req, res) => {
    const postGet = "SELECT * FROM Disease";
    client.query(postGet, (err,result) => {
        res.send(result.rows);
    })
})

app.get("/api/get/Discover", (req, res) => {
    const postGet = "SELECT * FROM Discover";
    client.query(postGet, (err,result) => {
        res.send(result.rows);
    })
})

app.get("/api/get/Users", (req, res) => {
    const postGet = "SELECT * FROM Users";
    client.query(postGet, (err,result) => {
        res.send(result.rows);
    })
})

app.get("/api/get/PublicServant", (req, res) => {
    const postGet = "SELECT * FROM PublicServant";
    client.query(postGet, (err,result) => {
        res.send(result.rows);
    })
})

app.get("/api/get/Doctor", (req, res) => {
    const postGet = "SELECT * FROM Doctor";
    client.query(postGet, (err,result) => {
        res.send(result.rows);
    })
})

app.get("/api/get/Specialize", (req, res) => {
    const postGet = "SELECT * FROM Specialize";
    client.query(postGet, (err,result) => {
        res.send(result.rows);
    })
})

app.get("/api/get/Record", (req, res) => {
    const postGet = "SELECT * FROM Record";
    client.query(postGet, (err,result) => {
        res.send(result.rows);
    })
})

app.post("/api/post/DiseaseType", (req, res) => {
    const {description} = req.body;
    const postInsert = 'INSERT INTO DiseaseType (description) VALUES($1);';
    client.query(postInsert,  [description], (err, result) => {
        if(err) {console.log(err); console.log(description);}
    })
})

app.post("/api/post/Country", (req, res) => {
    const {cname, population} = req.body;
    const postInsert = "INSERT INTO Country VALUES($1, $2)";
    client.query(postInsert,  [cname, population], (err, result) => {
        if(err) {console.log(err); console.log(cname, population);}
    })
})

app.post("/api/post/Disease", (req, res) => {
    const {disease_code, pathogen, description, id} = req.body;
    const postInsert = "INSERT INTO Disease VALUES($1, $2, $3, $4)";
    client.query(postInsert,  [disease_code, pathogen, description, id], (err, result) => {
        if(err) {console.log(err);}
    })
})

app.post("/api/post/Discover", (req, res) => {
    const {cname, disease_code, first_enc_date} = req.body;
    const postInsert = "INSERT INTO Discover VALUES($1, $2, $3)";
    client.query(postInsert,  [cname, disease_code, first_enc_date], (err, result) => {
        if(err) {console.log(err);}
    })
})

app.post("/api/post/Users", (req, res) => {
    const {email, name, surname, salary, phone, cname} = req.body;
    const postInsert = "INSERT INTO Users VALUES($1, $2, $3, $4, $5, $6)";
    client.query(postInsert,  [ email, name, surname, salary, phone, cname], (err, result) => {
        if(err) {console.log(err);}
    })
})

app.post("/api/post/PublicServant", (req, res) => {
    const {email, department} = req.body;
    const postInsert = "INSERT INTO PublicServant VALUES($1, $2)";
    client.query(postInsert,  [ email, department], (err, result) => {
        if(err) {console.log(err);}
    })
})

app.post("/api/post/Doctor", (req, res) => {
    const {email, degree} = req.body;
    const postInsert = "INSERT INTO Doctor VALUES($1, $2)";
    client.query(postInsert,  [ email, degree], (err, result) => {
        if(err) {console.log(err);}
    })
})

app.post("/api/post/Specialize", (req, res) => {
    const {id, email} = req.body;
    const postInsert = "INSERT INTO Specialize VALUES($1, $2)";
    client.query(postInsert,  [id, email], (err, result) => {
        if(err) {console.log(err);}
    })
})

app.post("/api/post/Record", (req, res) => {
    const {email, cname, disease_code, total_deaths, total_patients} = req.body;
    const postInsert = "INSERT INTO Record VALUES($1, $2, $3, $4, $5)";
    client.query(postInsert,  [ email, cname, disease_code, total_deaths, total_patients], (err, result) => {
        if(err) {console.log(err);}
    })
})

app.delete("/api/remove/DiseaseType/:id", (req, res) => {
    const {id} = req.params;
    const postDelete = "DELETE FROM DiseaseType WHERE id = $1";
    client.query(postDelete, [id], (err, result) => {
        if(err) {console.log(err);}
    })
})

app.delete("/api/remove/Country/:cname", (req, res) => {
    const {cname} = req.params;
    const postDelete = 'DELETE FROM Country WHERE cname = $1';
    client.query(postDelete, [cname], (err, result) => {
        if(err) {console.log(err);}
        console.log(cname);
    })
})

app.delete("/api/remove/Disease/:disease_code", (req, res) => {
    const {disease_code} = req.params;
    const postDelete = "DELETE FROM Disease WHERE disease_code = $1";
    client.query(postDelete, [disease_code], (err, result) => {
        if(err) {console.log(err);}
        console.log(disease_code);
    })
})

app.delete("/api/remove/Discover/:disease_code", (req, res) => {
    const {disease_code} = req.params;
    const postDelete = "DELETE FROM Discover WHERE disease_code = $1";
    client.query(postDelete, [disease_code], (err, result) => {
        if(err) {console.log(err);}
    })
})

app.delete("/api/remove/Users/:email", (req, res) => {
    const {email} = req.params;
    const postDelete = "DELETE FROM Users WHERE email = $1";
    client.query(postDelete, [email], (err, result) => {
        if(err) {console.log(err);}
    })
})

app.delete("/api/remove/Doctor/:email", (req, res) => {
    const {email} = req.params;
    const postDelete = "DELETE FROM Doctor WHERE email = $1";
    client.query(postDelete, [email], (err, result) => {
        if(err) {console.log(err);}
    })
})

app.delete("/api/remove/PublicServant/:email", (req, res) => {
    const {email} = req.params;
    const postDelete = "DELETE FROM PublicServant WHERE email = $1";
    client.query(postDelete, [email], (err, result) => {
        if(err) {console.log(err);}
    })
})

app.delete("/api/remove/Specialize/:email", (req, res) => {
    const {email} = req.params;
    const postDelete = "DELETE FROM Specialize WHERE email = $1";
    client.query(postDelete, [email], (err, result) => {
        if(err) {console.log(err);}
    })
})

app.delete("/api/remove/Record/:email", (req, res) => {
    const {email} = req.params;
    const postDelete = "DELETE FROM Record WHERE email = $1";
    client.query(postDelete, [email], (err, result) => {
        if(err) {console.log(err);}
    })
})

app.get("/api/get/DiseaseType/:id", (req, res) => {
    const {id} = req.params;
    const postGet = "SELECT * FROM DiseaseType WHERE id = $1";
    client.query(postGet, [id], (err,result) => {
        res.send(result);
    })
})

app.get("/api/get/Country/:cname", (req, res) => {
    const {cname} = req.params;
    const postGet = "SELECT * FROM Country WHERE cname = $1";
    client.query(postGet, [cname], (err,result) => {
        res.send(result);
    })
})

app.get("/api/get/Disease/:disease_code", (req, res) => {
    const {disease_code} = req.params;
    const postGet = "SELECT * FROM Disease WHERE disease_code = $1";
    client.query(postGet, [disease_code], (err,result) => {
        res.send(result);
    })
})

app.get("/api/get/Discover/:disease_code", (req, res) => {
    const {disease_code} = req.params;
    const postGet = "SELECT * FROM Discover WHERE disease_code = $1";
    client.query(postGet,[disease_code], (err,result) => {
        res.send(result);
    })
})

app.get("/api/get/Users/:email", (req, res) => {
    const {email} = req.params;
    const postGet = "SELECT * FROM Users WHERE email = $1";
    client.query(postGet,[email], (err,result) => {
        res.send(result);
    })
})

app.get("/api/get/PublicServant/:email", (req, res) => {
    const {email} = req.params;
    const postGet = "SELECT * FROM PublicServant WHERE email = $1";
    client.query(postGet,[email], (err,result) => {
        res.send(result);
    })
})

app.get("/api/get/Doctor/:email", (req, res) => {
    const {email} = req.params;
    const postGet = "SELECT * FROM Doctor WHERE email = $1";
    client.query(postGet, [email], (err,result) => {
        res.send(result);
    })
})

app.get("/api/get/Specialize/:email", (req, res) => {
    const{email} = req.params;
    const postGet = "SELECT * FROM Specialize WHERE email = $1";
    client.query(postGet, [email], (err,result) => {
        res.send(result);
    })
})

app.get("/api/get/Record/:email", (req, res) => {
    const {email} = req.params;
    const postGet = "SELECT * FROM Record WHERE email = $1";
    client.query(postGet,[email],(err,result) => {
        res.send(result);
    })
})

app.put("/api/put/DiseaseType/:id", (req, res) => {
    const {id} = req.params;
    const {description} = req.body;
    const postUpdate = "UPDATE DiseaseType SET description = $1  WHERE id = $2";
    client.query(postUpdate, [description, id], (err, result) => {
        if(err){
            console.log(err);
        }
    })
})

app.put("/api/put/Country/:cname", (req, res) => {
    const {cname} = req.params;
    const {population} = req.body;
    const postUpdate = "UPDATE Country SET population = $1  WHERE cname = $2";
    client.query(postUpdate, [population, cname], (err, result) => {
        if(err){
            console.log(err);
        }
    })
})

app.put("/api/put/Disease/:disease_code", (req, res) => {
    const {disease_code} = req.params;
    const {pathogen, description, id} = req.body;
    const postUpdate = "UPDATE Disease SET pathogen = $1, description = $2, id = $3 WHERE disease_code = $4";
    client.query(postUpdate, [pathogen, description, id, disease_code], (err, result) => {
        if(err){
            console.log(err);
        }
    })
})

app.put("/api/put/Discover/:disease_code", (req, res) => {
    const {disease_code} = req.params;
    const {cname, first_enc_date} = req.body;
    const postUpdate = "UPDATE Discover SET cname = $1, first_enc_date = $2 WHERE disease_code = $3";
    client.query(postUpdate, [cname, first_enc_date, disease_code], (err, result) => {
        if(err){
            console.log(err);
        }
    })
})

app.put("/api/put/Users/:email", (req, res) => {
    const {email} = req.params;
    const {name, surname, salary, phone, cname} = req.body;
    const postUpdate = "UPDATE Users SET name = $1, surname = $2, salary = $3, phone = $4, cname = $5 WHERE email = $6";
    client.query(postUpdate, [name, surname, salary, phone, cname, email], (err, result) => {
        if(err){
            console.log(err);
        }
    })
})

app.put("/api/put/Doctor/:email", (req, res) => {
    const {email} = req.params;
    const {degree} = req.body;
    const postUpdate = "UPDATE Doctor SET degree = $1 WHERE email = $2";
    client.query(postUpdate, [degree, email], (err, result) => {
        if(err){
            console.log(err);
        }
    })
})

app.put("/api/put/PublicServant/:email", (req, res) => {
    const {email} = req.params;
    const {department} = req.body;
    const postUpdate = "UPDATE PublicServant SET department = $1 WHERE email = $2";
    client.query(postUpdate, [department, email], (err, result) => {
        if(err){
            console.log(err);
        }
    })
})

app.put("/api/put/Specialize/:email", (req, res) => {
    const {email} = req.params;
    const {id} = req.body;
    const postUpdate = "UPDATE Specialize SET id = $1 WHERE email = $2";
    client.query(postUpdate, [id, email], (err, result) => {
        if(err){
            console.log(err);
        }
    })
})

app.put("/api/put/Record/:email", (req, res) => {
    const {email} = req.params;
    const {cname, disease_code, total_deaths, total_patients} = req.body;
    const postUpdate = "UPDATE Record SET cname = $1, disease_code = $2, total_deaths = $3, total_patients = $4 WHERE email = $5";
    client.query(postUpdate, [name, disease_code, total_deaths, total_patients,email], (err, result) => {
        if(err){
            console.log(err);
        }
    })
})

app.get("/", (req, res) => {

})
app.listen(process.env.Port ||4000, () => {
    console.log("Your port is 4000");
})