const mysql      = require('mysql');
const connection = mysql.createConnection({
  host     : 'localhost',
  user     : 'pontinel',
  password : '8.S@Sk{8U[hFh{%c',
  database : 'pontinel'
});

connection.connect(function(err) {
    if (err) {
        console.log('Error connecting: ' + err.stack);
        return;
    } 
    console.log('Connected as id ' + connection.threadId);
});

module.exports = connection;

/**
connection.query('SELECT 1 + 1 AS solution', function(err, rows, fields) {
  if (err) throw err;
  console.log('The solution is: ', rows[0].solution);
});
**/
//connection.end(); 