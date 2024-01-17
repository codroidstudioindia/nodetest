const express = require('express');
var bodyParser = require('body-parser');
const app = express();
// const helmet = require('helmet');
//const dbConn = require('./dbAdapter.js');
//#region Routers Region
/*
const AppRouter = require('./Router/AppRouter.js');
const AuthRouter = require('./Router/AuthRouter.js');
const ProfileRouter = require('./Router/ProfileRouter.js');
const KycRouter = require('./Router/KycRouter.js');
const TicketRouter = require('./Router/TicketRouter.js');
const MatchRouter = require('./Router/MatchRouter.js');
const BountyRouter = require('./Router/BountyRouter.js');
const OrderRouter = require('./Router/OrderRouter.js');
*/
//#endregion

app.use(express.json());
app.use(express.urlencoded({
  extended: true
}));
// app.use(helmet());
// app.disable('x-powered-by');

app.get('/',async  (req, res) => {
  res.send("welcome");
});
/*
app.use('/AppRouter', AppRouter);
app.use('/AuthRouter', AuthRouter);
app.use('/ProfileRouter', ProfileRouter);
app.use('/KycRouter', KycRouter);
app.use('/TicketRouter', TicketRouter);
app.use('/MatchRouter', MatchRouter);
app.use('/OrderRouter', OrderRouter);*/
// app.listen(80);

