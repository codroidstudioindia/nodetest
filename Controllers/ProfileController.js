const Utils = require('../Utility');
const dbConn = require('../dbAdapter');

function Get_User_profile_data(Data_Packet) {
    let dbname = Utils.EDatabases.EndUser;
    let Identity = Data_Packet.Identity;
  
    let stmt = `CALL ${dbname}.sp_get_user_profile_dtl (?)`;
    let ArrInfo = [Identity.userid];
  
    return new Promise(function (resolve, reject) {
      dbConn.query(stmt, ArrInfo, function (err, result) {
        if (err) {
          //console.log("error: ", err);
          return reject(err);
        }
        else {
          //console.log(" Get_User_profile_data: ", result[0][0]);
          resolve(result[0][0]);
        }
      });
    });
  }
  
  function UpdateUser_ProfileDetails(Identity, profileData) {
    let dbname = Utils.EDatabases.EndUser;
    let stmt = `CALL ${dbname}.sp_update_user_profile (?,?,?,?)`;
    let ArrInfo = [Identity.userid, profileData.gamename, profileData.email, profileData.avatar_name];
  
    return new Promise(function (resolve, reject) {
      dbConn.query(stmt, ArrInfo, function (err, result) {
        if (err) {
          //console.log("error: ", err);
          return reject(err);
        }
        else {
          //console.log(" UpdateUser_ProfileDetails: ", result[0][0]);
          resolve(result[0][0]);
        }
      });
    });
  
  }
  
  function Get_Isrefferal_reedem(userid) {
    let dbname = Utils.EDatabases.App;
    let stmt = `CALL ${dbname}.sp_get_refferal_reeedem (?)`;
    let ArrInfo = [userid];
  
    return new Promise(function (resolve, reject) {
      dbConn.query(stmt, ArrInfo, function (err, result) {
        if (err) {
          //console.log("error: ", err);
          return reject(err);
        }
        else {
          //console.log(" Get_Isrefferal_reedem: ", result[0][0]);
          resolve(result[0][0]);
        }
      });
    });
  }
  
  function Get_IsUserVip(userid) {
    let dbname = Utils.EDatabases.EndUser;
    let stmt = `CALL ${dbname}.sp_get_vip_status (?)`;
    let ArrInfo = [userid];
  
    return new Promise(function (resolve, reject) {
      dbConn.query(stmt, ArrInfo, function (err, result) {
        if (err) {
          //console.log("error: ", err);
          return reject(err);
        }
        else {
          //console.log(" Get_IsUserVip: ", result[0]);
          resolve(result[0][0]);
        }
      });
    });
  }

  module.exports = {
    Get_User_profile_data,
    UpdateUser_ProfileDetails,
    Get_Isrefferal_reedem,
    Get_IsUserVip

  }