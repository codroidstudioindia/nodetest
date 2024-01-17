const express = require('express');
const Utils = require('../Utility');
const dbConn = require('../dbAdapter');
const router = express.Router();

const fileUpload = require('express-fileupload');
const Path = require('path');
const mime = require('mime-types');
const fs = require('fs');

const AllowedMimeTypes = ['image/jpeg', 'image/jpg', 'image/png'];
const MaxFileSize = 2 * (1024 * 1024);
router.use(fileUpload({
    useTempFiles: true,
    tempFileDir: '/tmp/',
}));


router.post('/ticket', async (req, res) => {
    let Data_Packet = new Utils.mdl_Data_Packet();
    Data_Packet = JSON.parse(req.body.dt);
    console.log('req.body: ', req.body);

    let dbname = Utils.EDatabases.EndUser_Complaint;
    let stmt;
    let ArrInfo;

    if (Data_Packet.comtype == Utils.CommandType.Get) {
        stmt = `CALL ${dbname}.sp_get_user_raised_tickets (?)`;
        ArrInfo = [Data_Packet.Identity.userid];
        dbConn.query(stmt, ArrInfo, function (err, result) {
            if (err) {
                console.log("error: ", err);
                res.send({ stat: "ticket get failed" });
            }
            else {
                console.log(" Get_ticket: ", result[0]);
                res.send(result[0]);
            }
        });
    } else if (Data_Packet.comtype == Utils.CommandType.Set) {
        let result;
        if (req.files && Object.keys(req.files).length !== 0) {
            result = await TicketImageUpload(Data_Packet, req, res);
            console.log("req.files result: ", result);

            if (result.stat === 'failed' || result.stat !== 'success') {
                console.log("if result: ", result);
                return ({ stat: 'failed', message: result });
            }
        }

        console.log(result.url);
        let ticket = new Utils.mdl_Ticket();
        ticket = Data_Packet.JData;
        stmt = `CALL ${dbname}.sp_raise_new_issue_ticket (?,?,?,? )`;
        ArrInfo = [Data_Packet.Identity.userid, ticket.issue_id, ticket.message,result.url];
        dbConn.query(stmt, ArrInfo, function (err, result) {
            if (err) {
                console.log("error: ", err);
                res.send({ stat: "ticket set failed" });
            }
            else {
                console.log(" Set_ticket: ", result[0][0]);
                res.send(result[0][0]);
            }
        });
    }
});

async function TicketImageUpload(Data_Packet, req, res) {
    let ValidResult = await Utils.ValidateUserUploads(Data_Packet, req);
    //console.log('ValidResult: ', ValidResult);
    if (ValidResult !== true) {
        return ({ stat: 'failed', message: 'Auth' });
    }
    if (!req.files || Object.keys(req.files).length === 0) {
        return ({ stat: 'failed', message: 'No files were uploaded.' });
    }
    if (!AllowedMimeTypes.includes(mime.lookup(req.files.im.name))) {
        return ({ stat: 'failed', message: 'Improper file format' });
    }
    if (fs.statSync(req.files.im.tempFilePath).size > MaxFileSize) {
        fs.unlinkSync(req.files.im.tempFilePath);
        return ({ stat: 'failed', message: 'file size too large' });
    }
    let uploadPath = __dirname;
    uploadPath = uploadPath.split('\\');
    uploadPath[0] += '\\';
    let prefixpath = uploadPath.pop();
    let suffixpath = '\\uploads\\ticket\\';

    prefixpath = uploadPath.join('\\');
    let ext = Path.extname(req.files.im.name);

    if (!Utils.ValidateDirectory(prefixpath + suffixpath, Data_Packet.Identity.userid)) {
        fs.unlinkSync(req.files.im.tempFilePath);
        return ({ stat: 'failed', message: 'Directory not found' });
    }

    let imffinalpath = prefixpath + suffixpath + Data_Packet.Identity.userid + '\\'+'-'+Math.floor((new Date()).getTime() / 1000)+'-ticket' + ext;

    req.files.im.mv(imffinalpath, function (err) {
        if (err) {
            fs.unlinkSync(imffinalpath);
            return ({ stat: 'failed', message: 'Move failed' });

        }
    });
    return ({ stat: 'success', url:`uploads/ticket/${Data_Packet.Identity.userid}-${Math.floor((new Date()).getTime() / 1000)}-ticket${ext}`});
}






module.exports = router;