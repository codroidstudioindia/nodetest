const express = require('express');
const router = express.Router()
const AppController = require('../Controllers/AppController.js');

//serverstate
router.post('/serverstate', (req, res) => {
  //console.log("serverstate Router");
  let Result = AppController.Server_state(req, res);
  //console.log("serverstate Router Result:" + Result);

});

//appdata
router.post('/appdata',async (req, res) => {

  let stat = "success";
  let gameslist = await AppController.Get_Games_List();
  let vippacklist = await AppController.Get_Vip_Pack_List();
  let bountylist = await AppController.Get_Bounty_List();

  if (gameslist == null) {
    //console.log("gameslist is null");
  } else if (vippacklist == null) {
    //console.log("vippacklist is null");
  } else if (bountylist == null) {
    //console.log("bountylist is null");
  } else {
    //console.log(result);
  }
  let result = {stat:'success', gameslist:gameslist, vippacklist:vippacklist, bountylist:bountylist};
  res.send(result);
});

//support
router.post('/support', (req, res) => {
  //console.log("support Router");
  let Result = AppController.Get_All_issue_entities(req, res);
  //console.log("support Router Result:" + Result);
});

//tour
router.post('/tour', (req, res) => {
  //console.log("tour Router");
  let Result = AppController.Get_Tournaments_List(req, res);
  //console.log("tour Router Result:" + Result);
 
});




module.exports = router