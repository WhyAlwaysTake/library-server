const express = require("express");
const {Client} = require('pg');
const app = express();
const bodyParser = require("body-parser");
const cors = require("cors");
const { application } = require("express");
//const e = require("express");

const client = new Client({
    host: "localhost", //PostgreSql hostname -- localhost
    user: "postgres", //PostgreSql username -- postgreSql
    database: "library", //PostgreSql dataabase -- 
    password: "200915Tima*", //PostgreSql password -- 200915Tima*
});

client.connect();

app.use(cors());
app.use(express.json());
app.use(bodyParser.urlencoded({extended: true}));

app.post("/api/create/user", (req,res) => {
    const { id, name, surname, age, email, phone, occupation } = req.body;
    console.log(id, name, surname, age, email, phone, occupation);
    const postInsert = `INSERT INTO Readers VALUES($1, $2, $3, $4, $5, $6, $7);`;
    client.query(postInsert, [id, name, surname, age, email, phone, occupation], (err, result) =>{
        if(err) {console.log(err);}
    })
})

app.post("/api/create/book", (req, res) => {
    const { bname, bauthor, byear, bamount} = req.body;
    const postPut = `INSERT INTO Books(bname, bauthor, byear, bamount) VALUES($1, $2, $3, $4);`;
    client.query(postPut, [bname, bauthor, byear, bamount], (err, result) => {
        if(err) {console.log(err);}
    })
})

app.post("/api/create/borrow", (req, res) => {
    const { id, bid, date} = req.body;
    const postPut = `INSERT INTO Borrow VALUES($1, $2, $3)`; //put join there

    client.query(postPut, [id, bid, date], (err, result) =>{
        if(err) {console.log(err);}
    })
    //create update available book amounts
    // const postUpdate = "UPDATE Books SET bamount = bamount - 1 WHERE bname = $1";
    // client.query(postUpdate, [bname], (err, result) => {
    //     if(err) {console.log(err);}
    // })
})

app.delete("api/return", (req,res) => {
    const { uname, bname} = req.body;
    const postDelete = "DELETE FROM Borrow WHERE "

    //create update available book amounts
})
app.put("/api/update/book", (req, res) => {
    const { bname, bamount} = req.body;
    const postUpdate = "UPDATE Books SET bamount = $1 WHERE bname = $2;";
    client.query(postUpdate, [bname, bamount], (err,result) => {
        if(err) {console.log(err);}
    })
})

app.delete("/api/delete/book", (req, res) => {
    const { bname, byear} = req.body;
    const postDelete = "DELETE FROM Books WHERE bname = $1 AND byear = $2;";
    client.query(postDelete, [bname, byear], (err, result) =>{
        if(err) {console.log(err);}
    })
})


app.get("/", (req, res) => {
})

app.listen(process.env.Port || 4000, () => {
    console.log("Your port is 4000");
})
