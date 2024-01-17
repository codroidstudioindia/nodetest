const Utils = require('../Utility');
const dbConn = require('../dbAdapter');


function App_Install(req, res) {
    let Data_Packet = new Utils.mdl_Data_Packet();
    Data_Packet = JSON.parse(req.body.dt);
    let JData = new Utils.mdl_App_Init();
    JData = Data_Packet.JData;
    let dbname = Utils.EDatabases.App;

    let stmt = `CALL ${dbname}.sp_app_install(?, ?, ?, ?, ?,?,?,?)`;
    //console.log("stmt: ", stmt);

    let ArrInfo = [JData.game_key, JData.app_secrete_key, JData.app_platform_name, JData.endUser_Device.device_id, JData.endUser_Device.device_type, JData.endUser_Device.device_model, JData.endUser_Device.device_imei, JData.endUser_Device.device_srno]
    dbConn.query(stmt, ArrInfo, function (err, result) {
        if (err) {
            //console.log("error: ", err);
        }
        else {
            //console.log("RESULT:", result[0][0]);
            res.send(result[0][0]);
        }
    });
}


function Register(Data_Packet) {
    let JData = new Utils.mdl_EndUser_Register();
    let dbname = Utils.EDatabases.EndUser;

    //console.log("reg:" + JSON.stringify(Data_Packet));

    JData = Data_Packet.JData;

    let stmt = `CALL ${dbname}.sp_enduser_register (?, ?)`;
    let ArrInfo = [JData.phone_number, Data_Packet.Identity.device_token]
    let userid;

    return new Promise(function (resolve, reject) {

        dbConn.query(stmt, ArrInfo, function (err, result) {
            if (err) {
                //console.log("error: ", err);
                reject(err);
            }
            else {
                let SqlResult = result[0][0];
                if (SqlResult.stat === 'success') {
                    userid = SqlResult.userid;

                    //console.log(" Register (Result): ", result[0][0]);
                    resolve(result[0][0]);
                }
            }
        });
    });
}

function Enduser_login(req, res) {
    let Data_Packet = new Utils.mdl_Data_Packet();
    Data_Packet.JData = new Utils.mdl_EndUser_Login();
    Data_Packet = JSON.parse(req.body.dt);
    let dbname = Utils.EDatabases.EndUser;

    let stmt = `CALL ${dbname}.sp_enduser_login (?, ?, ?, ?)`;
    let ArrInfo = [Data_Packet.Identity.userid, Data_Packet.JData.phone_number, Data_Packet.JData.otp, Data_Packet.Identity.device_token];


    dbConn.query(stmt, ArrInfo, function (err, result) {
        if (err) {
            reject(err);
        }
        else {
            let SqlResult = result[0][0];
            let data;

            if (SqlResult.stat === 'success') {
                data = { "stat": SqlResult.stat, "auth_token": SqlResult.auth_token }
            } else {
                data = { "stat": SqlResult.stat }
            }
            //console.log("data: ", data);
            res.send(data);
        }
    });
}

function gen_new_OTP(userid, number) {
    let JData = new Utils.mdl_EndUser_Register();
    let otp;
    let dbname = Utils.EDatabases.EndUser;
    let stmt = `CALL ${dbname}.sp_gen_otp (?, ?)`;
    let ArrInfo = [userid, number];
    return new Promise(function (resolve, reject) {
        dbConn.query(stmt, ArrInfo, function (err, result) {
            if (err) {
                //console.log("error: ", err);
                return reject(err);
            }
            else {
                //console.log("otp: ", result[0]);
                resolve(result[0][0].otp);
            }
        });
    });
}

function Re_OTP(req, res) {
    let Data_Packet = new Utils.mdl_Data_Packet();
    Data_Packet = JSON.parse(req.body.dt);
    let dbname = Utils.EDatabases.EndUser;

    let otp;
    let stmt = `CALL ${dbname}.sp_gen_otp (?, ?)`;
    let ArrInfo = [Data_Packet.Identity.userid, Data_Packet.Identity.phone_number]
    dbConn.query(stmt, ArrInfo, function (err, result) {
        if (err) {
            //console.log("error: ", err);
        }
        else {
            //console.log("otp: ", result[0][0]);
            res.send(result[0][0]);
        }
    });
}

function logout(req, res) {
    let Data_Packet = new Utils.mdl_Data_Packet();
    let dbname = Utils.EDatabases.EndUser;
    Data_Packet = JSON.parse(req.body.dt);
    let stmt = `CALL ${dbname}.sp_enduser_logout(?)`;
    //console.log("stmt: ", stmt);

    let ArrInfo = [Data_Packet.Identity.userid];


    dbConn.query(stmt, ArrInfo, function (err, result) {
        if (err) {
            //console.log("error: ", err);
        }
        else {
            //console.log("RESULT:", result[0][0]);
            res.send(result[0][0]);
        }
    });
}



module.exports = {
    App_Install,
    Register,
    gen_new_OTP,
    Re_OTP,
    Enduser_login,
    logout
}