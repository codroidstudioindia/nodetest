const dbConn = require('./dbAdapter');
const fs = require('fs');

class PlayBee_User {
  userid;
  phone_number;
  auth_token;
  device_token;
  constructor(userid, phone_number, auth_token, device_token) {
    this.userid = userid;
    this.phone_number = phone_number;
    this.auth_token = auth_token;
    this.device_token = device_token;
  }
}

class mdl_Data_Packet {

  Identity = new PlayBee_User();//PlayBee_User
  comtype;
  JData;
  constructor(Identity, comtype, JData) {
    this.Identity = Identity;
    this.comtype = comtype;
    this.JData = JData;
  }
}

class mdl_EndUser_Device {

  device_id;
  device_type;
  device_model;
  device_imei;
  device_srno;

  constructor(device_id, device_type, device_model, device_imei, device_srno) {

    this.device_id = device_id;
    this.device_type = device_type;
    this.device_model = device_model;
    this.device_imei = device_imei;
    this.device_srno = device_srno;
  }

}
class mdl_App_Init {

  game_key;
  app_secrete_key;
  app_platform_name;
  endUser_Device = new mdl_EndUser_Device();
  constructor(game_key, spp_secrete_key, app_platform_name, endUser_Device) {
    this.game_key = game_key;
    this.spp_secrete_key = spp_secrete_key;
    this.app_platform_name = app_platform_name;
    this.endUser_Device = endUser_Device;
  }
}

class mdl_EndUser_Register {

  phone_number;
  device_token;
  endUser_Device = new mdl_EndUser_Device();
  constructor(phone_number, device_token, endUser_Device) {
    this.phone_number = phone_number;
    this.device_token = device_token;
    this.endUser_Device = endUser_Device;
  }

}

class mdl_EndUser_Login {

  game_key;
  app_secrete_Key;
  app_platform_name;
  userid;
  phone_number;
  otp;
  device_token;
  constructor(game_key, app_secrete_Key, app_platform_name, userid, phone_number, otp, device_token) {
    this.game_key;
    this.app_secrete_Key;
    this.app_platform_name;
    this.userid;
    this.phone_number;
    this.otp;
    this.device_token;
  }
}

class mdl_Kyc_Card {

  kyc_type;
  phone_number;
  card_number;
  fullname;
  dob;
  constructor(kyc_type, phone_number, card_number, fullname, dob) {
    this.kyc_type = kyc_type;
    this.phone_number = phone_number;
    this.card_number = card_number;
    this.fullname = fullname;
    this.dob = dob;

  }
}

class mdl_EndUser_Profile {

  gamename;
  email;
  avatar_name;
  referalcode;
  isvip;
  vipexpireon;
  constructor(gamename, email, avatar_name, referalcode, isvip, vipexpireon) {
    this.gamename = gamename;
    this.email = email;
    this.avatar_name = avatar_name;
    this.referalcode = referalcode;
    this.isvip = isvip;
    this.vipexpireon = vipexpireon;
  }
}

class mdl_Ticket {
  issue_id;
  message;
  constructor(issue_id, message) {
    this.issue_id = issue_id;
    this.message = message;
  }
}

class mdl_match_Schema {

  roomid;
  tourid;
  gamecode;
  matchstate;
  constructor(roomid, tourid, gamecode, matchstate) {

    this.roomid = roomid;
    this.tourid = tourid;
    this.gamecode = gamecode;
    this.matchstate = matchstate;
  }
}

class mdl_Player_Match_Schema {

  roomid;
  tourid;
  gamecode;
  playerstate;
  score;
  constructor(roomid, tourid, gamecode, playerstate, score) {

    this.roomid = roomid;
    this.tourid = tourid;
    this.gamecode = gamecode;
    this.playerstate = playerstate;
    this.score = score;
  }
}
class mdl_Bounty_Schema {

  roomid;
  gamecode;
  target;
  value_type;
  constructor(roomid, gamecode, target, value_type) {
    this.roomid = roomid;
    this.gamecode = gamecode;
    this.target = target;
    this.value_type = value_type;
  }
}



let DatabasePrefix = "db_";
function GameKey() {
  return "d9791e3873eb74ff1a0ada96d3562f3c";
}
function App_Secrete_Key() {
  return "bdc9b3061cd61d6b308991fc56176eda";
}
function App_Platform_Name() {
  return "09721ab88e0a552087391be1ef0c6826";
}

function ValidateUserUploads(Data_Packet, req) {
  //console.log('req.body: ', req.body);
  if (req.body.p1 !== GameKey() && req.body.p2 !== App_Secrete_Key()) {
    return false;
  } else {
    return new Promise(function (resolve, reject) {
      let dbname = EDatabases.EndUser;
      let stmt = `CALL ${dbname}.sp_check_endUser_isloggedin (?,?,?)`;
      dbConn.query(stmt, [Data_Packet.Identity.userid, Data_Packet.Identity.auth_token, Data_Packet.Identity.device_token], function (err, result) {
        if (err) {
          reject(err);
        }
        else {
          //console.log("ValidateUserUploads Result:", result[0]);
          resolve((result[0][0].stat === 1));
        }
      });
    });
  }
}


function ValidateDirectory(root, userdir) {
  //console.log('dir', root + userdir);
  try {
    if (!fs.existsSync(root + userdir)) {
      fs.mkdirSync(root + userdir, { recursive: true });
    }
    return true;
  } catch (error) {
    //console.log('error', error);
    return false;
  }
}


const EDatabases = {
  App: DatabasePrefix + "app",
  Bounty: DatabasePrefix + "bounty",
  EndUser: DatabasePrefix + "enduser",
  EndUser_Complaint: DatabasePrefix + "enduser_complaint",
  KYC: DatabasePrefix + "kyc",
  Match: DatabasePrefix + "match",
  History_Activity: DatabasePrefix + "history_activity",
  PG_PhonePay: DatabasePrefix + "pg_phonepay"
};

const CommandType = {
  Create: "Create",
  Get: "Get",
  Set: "Set",
  Update: "Update",
  Remove: "Remove"
}

module.exports = {
  //Classes
  PlayBee_User,
  mdl_Data_Packet,
  mdl_EndUser_Device,
  mdl_App_Init,
  mdl_EndUser_Register,
  mdl_EndUser_Login,
  mdl_EndUser_Profile,
  mdl_Kyc_Card,
  mdl_Ticket,
  mdl_match_Schema,
  mdl_Player_Match_Schema,
  mdl_Bounty_Schema,

  
  //Functions
  GameKey,
  App_Secrete_Key,
  App_Platform_Name,
  ValidateDirectory,
  ValidateUserUploads,

  //Databases
  EDatabases,
  DatabasePrefix,
  CommandType
}
