const express = require('express');
const app = express();
const port = 8080;

const dbConn = require('./dbAdapter.js');

const AppRouter = require('./Router/AppRouter.js');
const AuthRouter = require('./Router/AuthRouter.js');
const ProfileRouter = require('./Router/ProfileRouter.js');
const KycRouter = require('./Router/KycRouter.js');
const TicketRouter = require('./Router/TicketRouter.js');
const MatchRouter = require('./Router/MatchRouter.js');
const BountyRouter = require('./Router/BountyRouter.js');
const OrderRouter = require('./Router/OrderRouter.js');


app.use(express.json());
app.use(express.urlencoded({
  extended: true
}));

app.get('/',async  (req, res) => {
  res.send("welcome");
});




app.use('/AppRouter', AppRouter);
app.use('/AuthRouter', AuthRouter);
app.use('/ProfileRouter', ProfileRouter);
app.use('/KycRouter', KycRouter);
app.use('/TicketRouter', TicketRouter);
app.use('/MatchRouter', MatchRouter);
app.use('/OrderRouter', OrderRouter);
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



