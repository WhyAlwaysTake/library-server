const express = require("express");
const {Client} = require('pg');
const app = express();
const bodyParser = require("body-parser");
const cors = require("cors");
//const e = require("express");

const client = new Client({
    host: "", //PostgreSql hostname -- localhost
    user: "", //PostgreSql username -- postgreSql
    database: "", //PostgreSql dataabase -- 
    password: "", //PostgreSql password -- 200915Tima*
});

client.connect();

app.use(cors());
app.use(express.json());
app.use(bodyParser.urlencoded({extended: true}));

app.get("/", (req, res) => {

})
app.listen(process.env.Port ||4000, () => {
    console.log("Your port is 4000");
})