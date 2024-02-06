const express = require('express');
const app = express();
const port = 80;
const mysql = require('mysql2');


app.get('/', async (req, res) => {

 res.status(200).send('heloo');

});

var server = app.listen(port, function (error) {

  // Checking any error occur while listening on port
  if (error) {
    console.log('heloo', error);
  }
  // Else sent message of listening
  else {
    console.log('Server is listening on port http://localhost:'+server.address().port);
  }
});



