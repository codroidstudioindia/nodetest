'use strict';
const mysql = require('mysql');
//local mysql db connection
const dbConn = mysql.createConnection({
  host: 'private-db-mysql-blr1-85465-do-user-15622554-0.c.db.ondigitalocean.com',
  user: 'pb_user',
  password: 'AVNS_x16-L5jtjtCOjm61PcQ',
  database: '',
  port:25060
});


module.exports = dbConn;  

//?h=localhost&u=root&ps=ciai&p=3306
//?h=private-db-mysql-blr1-85465-do-user-15622554-0.c.db.ondigitalocean.com&u=pb_user&ps=AVNS_x16-L5jtjtCOjm61PcQ&p=25060