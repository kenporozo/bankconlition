const mysql = require("mysql");

const connection = mysql.createPool({
  connectionLimit: 10,
  host: process.env.DB_HOST,
  database: process.env.DB_SCHEMA,
  user: process.env.DB_USER,
  password: process.env.DB_PASS
});

module.exports = connection;
