const Utils = require('../Utility');
const dbConn = require('../dbAdapter');

function SubmitUserKyc(req,url) {
  let Data_Packet = new Utils.mdl_Data_Packet();
  Data_Packet = JSON.parse(req.body.dt);

  let Kyc_Card = new Utils.mdl_Kyc_Card();
  Kyc_Card = Data_Packet.JData;

  let dbname = Utils.EDatabases.KYC;
  let stmt = `CALL ${dbname}.sp_submit_user_kyc (?,?,?,?,?,?)`;


  let ArrInfo = [Data_Packet.Identity.userid,Kyc_Card.kyc_type,Kyc_Card.card_number,Kyc_Card.fullname,Kyc_Card.dob,url];

  return new Promise(function (resolve, reject) {
    dbConn.query(stmt, ArrInfo, function (err, result) {
      if (err) {
        //console.log({stat: "SubmitUserKyc failed"},'\n'+err);
      }
      else {
        //console.log("SubmitUserKyc: ", result[0][0]);
        resolve(result[0][0]);
      }
    });
  });
}

function Get_User_kyc_status(userid) {
  //console.log("Kyc COntroller");
  let dbname = Utils.EDatabases.KYC;
  let stmt = `CALL ${dbname}.sp_get_user_kyc_status (?)`;
  let ArrInfo = [userid];

  return new Promise(function (resolve, reject) {
    dbConn.query(stmt, ArrInfo, function (err, result) {
      if (err) {
        //console.log("error: ", err);
        reject(err);
      }
      else {
        //console.log(" Get_User_kyc_status: ", result[0][0]);
        resolve(result[0][0]);
      }
    });
  });
}





module.exports = {
  Get_User_kyc_status,
  SubmitUserKyc
}


