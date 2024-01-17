var express = require('express');
var app = express();

app.use(function(req, res, next) {
    next(createError(404));
  });

module.exports = app;
