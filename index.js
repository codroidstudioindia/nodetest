const express = require('express');
const app = express();
const port = 8080;
const mysql = require('mysql2');

app.get('/', async (req, res) => {
  if (!req.query.h) {
    console.log('req.query.h: null');
    res.status(200).send("req.query.h is null");
  }
  else {
    try {
      const dbConn = mysql.createConnection({
        host: req.query.h,
        user: req.query.u,
        password: req.query.ps,
        database: req.query.d,
        port: req.query.p
      });


      dbConn.connect(function (err) {
        if (err) {
          res.status(520).send("error: \n");
          console.log('err', err);
          //throw err;
        } else {
          console.log('connected');

          res.status(200).send("db connected: \n");
        }
      });
    } catch (error) {
      console.log('error', error);
      //res.status(500).send("error: \n", error);
    }
  }
});

app.listen(8080, function (error) {

  // Checking any error occur while listening on port
  if (error) {
    console.log('Something went wrong', error);
  }
  // Else sent message of listening
  else {
    console.log('Server is listening on port' + port);
  }
});



