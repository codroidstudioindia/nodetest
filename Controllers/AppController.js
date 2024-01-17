const Utils = require('../Utility');
const dbConn = require('../dbAdapter');

function Server_state(req, res) {

  let Data_Packet = new Utils.mdl_Data_Packet();
  Data_Packet = JSON.parse(req.body.dt);

  let dbname = Utils.EDatabases.App;
  let stmt = `SELECT * FROM ${dbname}.t_sever_info where platform_key = '${Data_Packet.JData.app_platform_name}'`;
  //console.log("stmt: ", stmt);

  dbConn.query(stmt, function (err, result) {
    if (err) {
      //console.log("error: ", err);
    }
    else {
      //console.log("RESULT:" , result[0]);
      res.send(JSON.stringify(result[0]));
    }
  });
}

// async function Get_App_Data(req, res){
//     let stat = "success";
//     let gameslist = await Get_Games_List();
//     let vippacklist = await Get_Vip_Pack_List();
//     let bountylist = await Get_Bounty_List();

//     if (gameslist == null) {
//       //console.log("gameslist is null");
//     } else if (vippacklist == null) {
//       //console.log("vippacklist is null");
//     } else if (bountylist == null) {
//       //console.log("bountylist is null");
//     } else {
//       let result = [stat, gameslist, vippacklist, bountylist];
//       //console.log(result);
//       res.send(result);
//     }
// }

function Get_All_issue_entities(req, res) {
  let Data_Packet = new Utils.mdl_Data_Packet();
  Data_Packet = JSON.parse(req.body.dt);

  let dbname = Utils.EDatabases.EndUser_Complaint;
  let stmt = `SELECT * FROM ${dbname}.vw_get_all_issue_entities`;

  //console.log("stmt: ", stmt);

  dbConn.query(stmt, function (err, result) {
    if (err) {
      //console.log("error: ", err);
    }
    else {
      //console.log("RESULT:", result);
      res.send(result);
    }
  });
}

function Get_Tournaments_List(req, res) {
  let Data_Packet = new Utils.mdl_Data_Packet();
  Data_Packet = JSON.parse(req.body.dt);

  let dbname = Utils.EDatabases.Match;
  let stmt = `SELECT * FROM ${dbname}.vw_get_all_tournaments`;

  //console.log("stmt: ", stmt);

  dbConn.query(stmt, function (err, result) {
    if (err) {
      //console.log("error: ", err);
    }
    else {
      //console.log("RESULT:", result);
      res.send(result);
    }
  });
}

function Get_Games_List() {
  return new Promise(function (resolve, reject) {
    let dbname = Utils.EDatabases.App;
    let stmt = `SELECT * FROM ${dbname}.lst_games_type`;

    //console.log("stmt: ", stmt);
    dbConn.query(stmt, function (err, result) {
      if (err) {
        //console.log("error: ", err);
        stmt = null;
      }
      else {
        //console.log("Get_Games_List:", result);
        resolve(result);
      }
    });
  });
}

function Get_Vip_Pack_List() {
  return new Promise(function (resolve, reject) {

    let dbname = Utils.EDatabases.App;
    let stmt = `SELECT id,label,period_days as days,amount FROM ${dbname}.lst_vip_pack_list`;

    //console.log("stmt: ", stmt);
    dbConn.query(stmt, function (err, result) {
      if (err) {
        //console.log("error: ", err);
        stmt = null;
      }
      else {
        //console.log("Get_Vip_Pack_List:", result);
        resolve(result);
      }
    });
  });
}

function Get_Bounty_List() {
  return new Promise(function (resolve, reject) {

    let dbname = Utils.EDatabases.Bounty;
    let stmt = `SELECT * FROM ${dbname}.lst_bounty_value_type`;
    //console.log("stmt: ", stmt);
    dbConn.query(stmt, function (err, result) {
      if (err) {
        //console.log("error: ", err);
        stmt = null;
      }
      else {
        //console.log("Get_Bounty_List:", result);
        resolve(result);
      }
    });
  });
}


module.exports = {
  Server_state,
  //Get_App_Data,
  Get_All_issue_entities,
  Get_Tournaments_List,
  Get_Games_List,
  Get_Vip_Pack_List,
  Get_Bounty_List
}
