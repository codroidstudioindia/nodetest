const express = require('express');
const Utils = require('../Utility');
const dbConn = require('../dbAdapter');
const router = express.Router();
const MatchController = require('../Controllers/MatchController');


router.post('/match', function (req, res) {
    console.log("match: ");
    MatchController.Add_Created_Match(req, res);
});

router.post('/matchstat', async function (req, res) {
    let Data_Packet = new Utils.mdl_Data_Packet();
    Data_Packet = JSON.parse(req.body.dt);

    MatchController.Change_Match_State(Data_Packet);
});
router.post('/playerstat', async function (req, res) {
    let Data_Packet = new Utils.mdl_Data_Packet();
    Data_Packet = JSON.parse(req.body.dt);

    MatchController.Change_Player_State(req, res);
});
router.post('/participant', async function (req, res) {
    let Data_Packet = new Utils.mdl_Data_Packet();
    Data_Packet = JSON.parse(req.body.dt);

    MatchController.Join_Created_Match(req, res);
});
router.post('/join', async function (req, res) {
    let Data_Packet = new Utils.mdl_Data_Packet();
    Data_Packet = JSON.parse(req.body.dt);

    MatchController.Join_Created_Match(req, res);
});
router.post('/turn', async function (req, res) {
    let Data_Packet = new Utils.mdl_Data_Packet();
    Data_Packet = JSON.parse(req.body.dt);

    MatchController.Register_NewUser(req, res);
});
router.post('/rolldice', async function (req, res) {
    let Data_Packet = new Utils.mdl_Data_Packet();
    Data_Packet = JSON.parse(req.body.dt);

    MatchController.Rolldice(req, res);
});



module.exports = router;

