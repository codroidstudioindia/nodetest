const express = require('express');
const Utils = require('../Utility');
const dbConn = require('../dbAdapter');
const router = express.Router();
const BountyController = require('../Controllers/BountyController');

router.post('/bounty', function (req, res) {
    console.log("match: ");
    BountyController.Add_Created_Match(req, res);
});

router.post('/participant', function (req, res) {
    console.log("match: ");
    BountyController.Add_new_Participent(req, res);
});

router.post('/claim', function (req, res) {
    console.log("match: ");
    BountyController.Bounty_Clamed(req, res);
});
router.post('/cancel', function (req, res) {
    console.log("match: ");
    BountyController.Bounty_Disqualified(req, res);
});