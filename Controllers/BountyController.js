const Utils = require('../Utility');
const dbConn = require('../dbAdapter');

function Create_new_Bounty(req, res) {
    let Data_Packet = new Utils.mdl_Data_Packet();
    Data_Packet = JSON.parse(req.body.dt);
    let bountySchema = new Utils.mdl_Bounty_Schema();
    JData = Data_Packet.JData;
    let dbname = Utils.EDatabases.Bounty;

    let stmt = `CALL ${dbname}.sp_created_bounty(?, ?, ?, ?, ?)`;
    //console.log("stmt: ", stmt);

    let ArrInfo = [Data_Packet.Identity.userid, bountySchema.roomid, bountySchema.gamecode, bountySchema.target, bountySchema.value_type];

    dbConn.query(stmt, ArrInfo, function (err, result) {
        if (err) {
            console.log(err);
        }
        else {
            console.log("RESULT:", result[0][0]);
            res.send(result[0][0]);
        }
    });
}


function Add_new_Participent(req, res) {
    let Data_Packet = new Utils.mdl_Data_Packet();
    Data_Packet = JSON.parse(req.body.dt);
    let bountySchema = new Utils.mdl_Bounty_Schema();
    JData = Data_Packet.JData;
    let dbname = Utils.EDatabases.Bounty;

    let stmt = `CALL ${dbname}.sp_add_participants_in_bounty(?, ?, ?, ?)`;
    //console.log("stmt: ", stmt);

    let ArrInfo = [Data_Packet.Identity.userid, bountySchema.roomid, bountySchema.target, bountySchema.value_type];

    dbConn.query(stmt, ArrInfo, function (err, result) {
        if (err) {
            console.log(err);
        }
        else {
            console.log("RESULT:", result[0][0]);
            res.send(result[0][0]);
        }
    });
}
function Bounty_Clamed(req, res) {

    let Data_Packet = new Utils.mdl_Data_Packet();
    Data_Packet = JSON.parse(req.body.dt);

    JData = Data_Packet.JData;
    let dbname = Utils.EDatabases.Bounty;

    let stmt = `CALL ${dbname}.sp_claim_bounty(?, ?, ?, ?, ?, ?)`;
    let ArrInfo = [Data_Packet.Identity.userid, JData.p1, JData.p2, JData.p3, JData.p4, JData.p5];

    dbConn.query(stmt, ArrInfo, function (err, result) {
        if (err) {
            console.log(err);
        }
        else {
            console.log("RESULT:", result[0][0]);
            res.send(result[0][0]);
        }
    });
}
function Bounty_Disqualified(req, res) {

    let Data_Packet = new Utils.mdl_Data_Packet();
    Data_Packet = JSON.parse(req.body.dt);
    let bountySchema = new Utils.mdl_Bounty_Schema();
    JData = Data_Packet.JData;
    let dbname = Utils.EDatabases.Bounty;

    let stmt = `CALL ${dbname}.sp_disqualify_bounty(?, ?)`;
    let ArrInfo = [Data_Packet.Identity.userid, bountySchema.roomid];

    dbConn.query(stmt, ArrInfo, function (err, result) {
        if (err) {
            console.log(err);
        }
        else {
            console.log("RESULT:", result[0][0]);
            let Result = result[0][0];
            if (Result.stat == 'success') {
                stmt = `select * from ${dbname}.t_live_players_in_bounty where ` + `id = '${bountySchema.roomid}'`;
                ArrInfo = [Data_Packet.Identity.userid, bountySchema.roomid];
                dbConn.query(stmt, ArrInfo, function (err, result) {
                    if (err) {
                        console.log(err);
                    }
                    else {
                        console.log("RESULT:", result[0]);
                        let live_players = result[0];
                        //let count =0;
                        live_players.forEach(element => {
                            stmt = `CALL ${dbname}.sp_disqualify_bounty(?, ?)`;
                            ArrInfo = [Data_Packet.Identity.userid, bountySchema.roomid];
                            dbConn.query(stmt, ArrInfo, function (err, result) {
                                if (err) {
                                    console.log(err);
                                }
                                else {
                                    console.log("RESULT:", result[0][0]);
                                    //  count++;
                                }
                            });
                        });
                    }
                });
            }
            res.send(result[0][0]);
        }
    });
}


module.exports = {
    Create_new_Bounty,
    Add_new_Participent,
    Bounty_Clamed,
    Bounty_Disqualified
}
