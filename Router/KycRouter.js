const express = require('express');
const Utils = require('../Utility');
const dbConn = require('../dbAdapter');
const fileUpload = require('express-fileupload');
const router = express.Router();
const Path = require('path');
const mime = require('mime-types');
const fs = require('fs');

const KycController = require('../Controllers/KycController');


const AllowedMimeTypes = ['image/jpeg', 'image/jpg', 'image/png'];
const MaxFileSize = 2 * (1024 * 1024);
router.use(fileUpload({
    useTempFiles: true,
    tempFileDir: '/tmp/',
}));



router.post('/aadharimage', async function (req, res) {
    //console.log('aadhar: ');
    //console.log('req.body: ', req.body.dt);
    let Data_Packet = new Utils.mdl_Data_Packet();
    Data_Packet = JSON.parse(req.body.dt);
    let ValidResult = await Utils.ValidateUserUploads(Data_Packet, req);
    //console.log('ValidResult: ', ValidResult);
    if (ValidResult !== true) {
        return res.status(400).send({ stat: " aadhar ValidResult failed" });
    }

    if (!req.files || Object.keys(req.files).length === 0) {
        return res.status(400).send('No files were uploaded.');
    }
    if (!AllowedMimeTypes.includes(mime.lookup(req.files.imf.name)) || !AllowedMimeTypes.includes(mime.lookup(req.files.imb.name))) {
        return res.status(400).send({ stat: "look upfailed" });
    }
    if (fs.statSync(req.files.imf.tempFilePath).size > MaxFileSize || fs.statSync(req.files.imb.tempFilePath).size > MaxFileSize) {
        fs.unlinkSync(req.files.imf.tempFilePath);
        fs.unlinkSync(req.files.imb.tempFilePath);
        return res.status(400).send({ stat: " file size failed" });
    }

    let uploadPath = __dirname;
    uploadPath = uploadPath.split('\\');
    uploadPath[0] += '\\';
    let prefixpath = uploadPath.pop();
    let suffixpath = '\\uploads\\aadhar\\';

    prefixpath = uploadPath.join('\\');
    let ext = Path.extname(req.files.imf.name);

    if (! Utils.ValidateDirectory(prefixpath + suffixpath, Data_Packet.Identity.userid)) {
        fs.unlinkSync(req.files.imf.tempFilePath);
        fs.unlinkSync(req.files.imb.tempFilePath);
        return res.status(500).send({ stat: "ValidateDirectory failed" });
    }

    let imffinalpath = prefixpath + suffixpath + Data_Packet.Identity.userid + '\\' + Data_Packet.Identity.userid + '-front' + ext;
    ext = Path.extname(req.files.imb.name);
    let imbfinalpath = prefixpath + suffixpath + Data_Packet.Identity.userid + '\\' + Data_Packet.Identity.userid + '-back' + ext;

    req.files.imf.mv(imffinalpath, function (err) {
        if (err) {
            fs.unlinkSync(imffinalpath);
            return res.status(500).send(err);
        }
    });
    req.files.imb.mv(imbfinalpath, function (err) {
        if (err) {
            fs.unlinkSync(imffinalpath);
            fs.unlinkSync(imbfinalpath);
            return res.status(500).send(err);
        }
    });
    res.send({stat:"success"});
});


router.post('/aadhar', async function (req, res) {
    let Data_Packet = new Utils.mdl_Data_Packet();
    Data_Packet = JSON.parse(req.body.dt);
    let url = '/uploads/aadhar/' +Data_Packet.Identity.userid+'/';
    let Result = await KycController.SubmitUserKyc(req,url);
    //console.log('aadhar Result: '+Result);
    res.send(Result);
});


router.post('/panimage', async function (req, res) {
    let Data_Packet = new Utils.mdl_Data_Packet();
    Data_Packet = JSON.parse(req.body.dt);
    //console.log('req.body: ', req.body);

    let ValidResult = await Utils.ValidateUserUploads(Data_Packet, req);
    //console.log('ValidResult: ', ValidResult);
    if (ValidResult !== true) {
        return res.status(400).send({ stat: "pan ValidResult failed" });
    }

    if (!req.files || Object.keys(req.files).length === 0) {
        return res.status(400).send('No files were uploaded.');
    }
    if (!AllowedMimeTypes.includes(mime.lookup(req.files.im.name))) {
        return res.status(400).send({ stat: "look upfailed" });
    }
    if (fs.statSync(req.files.im.tempFilePath).size > MaxFileSize) {
        fs.unlinkSync(req.files.im.tempFilePath);
        return res.status(400).send({ stat: " file size failed" });
    }

    let uploadPath = __dirname;
    uploadPath = uploadPath.split('\\');
    uploadPath[0] += '\\';
    let prefixpath = uploadPath.pop();
    let suffixpath = '\\uploads\\pan\\';

    prefixpath = uploadPath.join('\\');
    let ext = Path.extname(req.files.im.name);

    if (!Utils.ValidateDirectory(prefixpath + suffixpath, Data_Packet.Identity.userid)) {
        fs.unlinkSync(req.files.im.tempFilePath);
        return res.status(500).send({ stat: "ValidateDirectory failed" });
    }

    let imffinalpath = prefixpath + suffixpath + Data_Packet.Identity.userid + '\\' + Data_Packet.Identity.userid + '-pan' + ext;

    req.files.im.mv(imffinalpath, function (err) {
        if (err) {
            fs.unlinkSync(imffinalpath);
            return res.status(500).send(err);
        }
    });
    
    res.send({stat:"success"});
});

router.post('/pan', async function (req, res) {
    let Data_Packet = new Utils.mdl_Data_Packet();
    Data_Packet = JSON.parse(req.body.dt);
    let url = '/uploads/pan/' +Data_Packet.Identity.userid+'/';
    let Result = await KycController.SubmitUserKyc(req,url);
    //console.log('pan Result: '+Result);
    res.send(Result);
});


 
  


module.exports = router
