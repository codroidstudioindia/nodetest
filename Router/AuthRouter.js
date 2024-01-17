const express = require('express');
const Utils = require('../Utility');
const router = express.Router();
const AauthController = require('../Controllers/AuthController');
const KycController = require('../Controllers/KycController');

router.get('/', (req, res) => {
  res.send('AuthController home page');
});

//Install
router.post('/install', async (req, res) => {
  //console.log("install Router");
  let Result = await AauthController.App_Install(req, res);
  //console.log("install Router Result:" + Result);
});

//register
router.post('/register', async (req, res) => {
  let Data_Packet = new Utils.mdl_Data_Packet();

  Data_Packet = JSON.parse(req.body.dt);
  //console.log("register Data_Packet: ", Data_Packet);

  const registerResult = await AauthController.Register(Data_Packet);
  //console.log("await Register:" + JSON.stringify(registerResult));
  const otpResult = await AauthController.gen_new_OTP(registerResult.userid, Data_Packet.JData.phone_number);
  //console.log("await otpResult:" + JSON.stringify(registerResult));

  let Result = {
    stat: registerResult.stat,
    userid: registerResult.userid,
    gamename: registerResult.gamename,
    emailid: registerResult.emailid,
    avatarname: registerResult.avatarname,
    referalcode: registerResult.referalcode,
    otp: otpResult
  };

  //console.log("registerResult: ", Result);
  res.send(Result);

});

//reotp
router.post('/reotp', (req, res) => {
  //console.log("reotp Router");
  let Result = AauthController.Re_OTP(req, res);
  //console.log("Router Result:" + JSON.stringify(Result));

});

//login
router.post('/login', (req, res) => {
  //console.log("login Router logout");
  let Result = AauthController.Enduser_login(req, res);
  //console.log("login Router Result:" + Result);
});


//logout
router.post('/logout', (req, res) => {
  //console.log("Auth Router logout");
  let Result = AauthController.logout(req, res);
  //console.log("Auth Router Result:" + Result);
});


module.exports = router