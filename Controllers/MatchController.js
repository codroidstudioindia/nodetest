const Utils = require('../Utility');
const dbConn = require('../dbAdapter');

function Add_Created_Match(req, res) {
    let Data_Packet = new Utils.mdl_Data_Packet();
    Data_Packet = JSON.parse(req.body.dt);
    let matchSchema = new Utils.mdl_match_Schema();
    JData = Data_Packet.JData;
    let dbname = Utils.EDatabases.Match;

    let stmt = `CALL ${dbname}.sp_add_created_match(?, ?, ?, ?)`;
    //console.log("stmt: ", stmt);

    let ArrInfo = [Data_Packet.Identity.userid, matchSchema.roomid, matchSchema.tourid, matchSchema.gamecode]
    dbConn.query(stmt, ArrInfo, function (err, result) {
        if (err) {
            console.log("error: ", err);
            return res.status(400).send({ stat: 'failed', message: 'add match failed' });
        }
        else {
            console.log("RESULT:", result[0][0]);
            res.send(result[0][0]);
        }
    });

}

async function Change_Match_State(Data_Packet, req, res) {
    let matchSchema = new Utils.mdl_match_Schema();
    JData = Data_Packet.JData;
    let dbname = Utils.EDatabases.Match;

    let stmt = `CALL ${dbname}.sp_change_match_state(?, ?, ?, ?)`;
    //console.log("stmt: ", stmt);

    let ArrInfo = [Data_Packet.Identity.userid, matchSchema.roomid, matchSchema.gamecode, matchSchema.matchstate]

    let result = await dbConn.query(stmt, ArrInfo, function (err, result) {
        if (err) {
            console.log(err);
        }
        else {
            console.log("RESULT:", result[0][0]);
            return (result[0][0]);
        }
    });

    let playerstate;
    let score = '';

    if (result.stat === 'success') {
        if (result.matchstat === 'LIVE' || result.matchstat === 'CONCLUDED') {
            if (result.matchstat === 'LIVE') {
                playerstate = 'PLAYING';
            } else if (result.matchstat === 'CONCLUDED') {
                playerstate = 'CONCLUDED';
            }
            stmt = `CALL ${dbname}.sp_update_player_match_info(?, ?, ?, ?, ?)`;
            console.log("stmt: ", stmt);

            ArrInfo = [Data_Packet.Identity.userid, matchSchema.roomid, matchSchema.gamecode, playerstate, score]
            result = await dbConn.query(stmt, ArrInfo, function (err, result) {
                if (err) {
                    console.log(err);
                }
                else {
                    console.log("RESULT:", result[0][0]);
                    return (result[0][0]);
                }
            });

        }
    } else if (matchStateResult.stat === 'distribute') {
        DistributeConcluded(matchSchema.roomid, matchSchema.gamecode)
    }
    res.send(result);
}

function DistributeConcluded(roomid, gamecode) {
    let dbname = Utils.EDatabases.Match;
    let stmt = `select * from ${dbname}.t_live_matches where ` + `room_id = '${roomid}'`;
    dbConn.query(stmt, function (err, result) {
        if (err) {
            reject(err);
        }
        else {
            console.log("RESULT:", result[0][0]);
            let tourdata = result[0][0];

            stmt = `select * from ${dbname}.lst_tournament_listing where ` + `id = '${tourdata.tournament_id}'`;
            console.log("DistributeConcluded stmt: ", stmt);
            dbConn.query(stmt, function (err, result) {
                if (err) {
                    reject(err);
                }
                else {
                    console.log("RESULT:", result[0][0]);
                    let tourdata = result[0][0];
                    let sharepercent = tourdata.shareschema.split(',');

                    stmt = `select * from ${dbname}.t_live_players_in_match where ` + `room_id = '${roomid}' AND player_state = 'CONCLUDED' order by score DESC`;

                    dbConn.query(stmt, function (err, result) {
                        if (err) {
                            reject(err);
                        }
                        else {
                            console.log("RESULT:", result[0][0]);
                            let tourdata = result[0][0];
                            let sharepercent = tourdata.shareschema.split(',');
                            let live_players = result[0];

                            let count = 0;
                            let wonamount = 0;
                            live_players.forEach(element => {
                                wonamount = tourdata.price_pool * sharepercent[count];
                                stmt = `CALL ${dbname}.sp_distribute_pricepool(?, ?, ?, ?)`;
                                let ArrInfo = [element.userid, element.roomid, wonamount, count];
                                dbConn.query(stmt, ArrInfo, function (err, result) {
                                    if (err) {
                                        console.log(err);
                                    }
                                    else {
                                        console.log("RESULT:", result[0][0]);
                                        return (result[0][0]);
                                    }
                                });
                            });
                        }
                    });
                }
            });
        }
    });
}


function Change_Player_State(req, res) {
    let Data_Packet = new Utils.mdl_Data_Packet();
    Data_Packet = JSON.parse(req.body.dt);
    let playerSchema = new Utils.mdl_Player_Match_Schema();
    JData = Data_Packet.JData;
    let dbname = Utils.EDatabases.Match;

    let stmt = `CALL ${dbname}.sp_update_player_match_info(?, ?, ?, ?, ?)`;
    //console.log("stmt: ", stmt);

    let ArrInfo = [Data_Packet.Identity.userid, playerSchema.roomid, playerSchema.gamecode, playerSchema.playerstate, playerSchema.score];

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

function Join_Created_Match(req, res) {
    let Data_Packet = new Utils.mdl_Data_Packet();
    Data_Packet = JSON.parse(req.body.dt);
    let playerSchema = new Utils.mdl_Player_Match_Schema();
    JData = Data_Packet.JData;
    let dbname = Utils.EDatabases.Match;

    let stmt = `CALL ${dbname}.sp_add_participants_in_match(?, ?, ?)`;
    //console.log("stmt: ", stmt);

    let ArrInfo = [Data_Packet.Identity.userid, playerSchema.roomid, playerSchema.tourid];

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
function Validate_User_Join_Match(req, res) {
    let Data_Packet = new Utils.mdl_Data_Packet();
    Data_Packet = JSON.parse(req.body.dt);
    let matchSchema = new Utils.mdl_match_Schema();
    JData = Data_Packet.JData;
    let dbname = Utils.EDatabases.Match;

    let stmt = `CALL ${dbname}.sp_validate_joining(?, ?, ?)`;
    //console.log("stmt: ", stmt);

    let ArrInfo = [Data_Packet.Identity.userid, matchSchema.tourid, matchSchema.gamecode];

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

function Register_NewUser(req, res) {


}

function Rolldice(req, res) {
    let Data_Packet = new Utils.mdl_Data_Packet();
    Data_Packet = JSON.parse(req.body.dt);
    let dbname = Utils.EDatabases.EndUser;

    let stmt = `CALL ${dbname}.sp_check_endUser_isloggedin(?, ?, ?)`;
    let ArrInfo = [Data_Packet.Identity.userid, Data_Packet.Identity.auth_token, Data_Packet.Identity.device_token];
    let resultstat = 0;
    dbConn.query(stmt, ArrInfo, function (err, result) {
        if (err) {
            console.log(err);
        }
        else {
            console.log("RESULT:", result[0][0]);
            resultstat = result[0][0];

            if (resultstat === 1) {
                let rndInt = randomDiceNumber();
                console.log(rndInt);
                res.send({ stat: resultstat, dicenumber: rndInt });
            } else {
                res.send({ stat: 'failed' });

            }
        }
    });

}
function randomDiceNumber() {
    return (Math.floor(Math.random() * 6) + 1);
}


function Save_to_History($RoomId) {}




module.exports = {
    Add_Created_Match,
    Change_Match_State,
    Change_Player_State,
    Join_Created_Match,
    Validate_User_Join_Match,
    Register_NewUser,
    Rolldice
}


/*
php function
function Save_to_History($RoomId) {
    $dcon = dbcon::GetDbCon_playbee(Database::History_Activity->toString());
    $dbname = Database::Match->toString();
    $GameState = '';
    $AllPlayersList = '';

    $stmt = $dcon->prepare("SELECT * FROM `$dbname`.`t_live_matches` where `room_id` = '$RoomId';");
    $stmt->execute();
    $GameState = $stmt->fetch(PDO::FETCH_ASSOC);

    $stmt = $dcon->prepare("SELECT * FROM `$dbname`.`t_live_players_in_match` where `room_id` = '$RoomId';");
    $stmt->execute();
    $AllPlayersList = $stmt->fetchAll(PDO::FETCH_ASSOC);

    $tourid = $GameState["tournament_id"];
    $gamecode = $GameState["gamecode"];
    $match_state = $GameState["match_state"];
    $matchcreatedon = $GameState["createdon"];
    $matchendon = $GameState["endon"];

    $puserid = '';
    $player_state = '';
    $score = '';
    $playerjoinon = '';
    $playerleavedon = '';
    $dbname = Database::History_Activity->toString();
    $Instmt = "INSERT INTO `$dbname`.`t_history_player_matches`
(`userid`,`roomid`,`last_state`,`score`,`wonamount`,`player_joinon`,`player_leaveon`,`tourid`,`gamecode`,`match_last_state`,`match_createdon`,`match_endon`)
VALUES";

    foreach ($AllPlayersList as $row) {

        $Instmt .= "('" . $row['userid'] . "',";
        $Instmt .= "('" . $RoomId . "',";
        $Instmt .= "('" . $row['player_state'] . "',";
        $Instmt .= "('" . $row['score'] . "',";
        $Instmt .= "('" . $row['wonamount'] . "',";
        $Instmt .= "('" . $row['joinon'] . "',";
        $Instmt .= "('" . $row['leavedon'] . "',";

        $Instmt .= "('" . $tourid . "',";
        $Instmt .= "('" . $gamecode . "',";
        $Instmt .= "('" . $match_state . "',";
        $Instmt .= "('" . $matchcreatedon . "',";
        $Instmt .= "('" . $matchendon . "',";
        $Instmt .= "('" . $matchendon . "',),";

        echo $value;
    }
    $dbname = Database::Match->toString();
    $stmt = $dcon->prepare("SELECT * FROM `$dbname`.`t_live_players_in_match` where `room_id` = '$RoomId';");
    $stmt->execute();
    $AllPlayersList = $stmt->fetch(PDO::FETCH_ASSOC);
}

*/