const express = require('express');
const Utils = require('../Utility');
const dbConn = require('../dbAdapter');
const router = express.Router();
const fileUpload = require('express-fileupload');
const Path = require('path');
const mime = require('mime-types');
const fs = require('fs');

const KycController = require('../Controllers/KycController');
const profileController = require('../Controllers/ProfileController');

const AllowedMimeTypes = ['image/jpeg', 'image/jpg', 'image/png'];
const MaxFileSize = 2 * (1024 * 1024);
router.use(fileUpload({
    useTempFiles: true,
    tempFileDir: '/tmp/',
}));


router.post('/profiledp', async function (req, res) {
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
  let suffixpath = '\\uploads\\profiledp\\';

  prefixpath = uploadPath.join('\\');
  let ext = Path.extname(req.files.im.name);

  if (!Utils.ValidateDirectory(prefixpath + suffixpath, Data_Packet.Identity.userid)) {
      fs.unlinkSync(req.files.im.tempFilePath);
      return res.status(500).send({ stat: "ValidateDirectory failed" });
  }

  let imffinalpath = prefixpath + suffixpath + Data_Packet.Identity.userid + '\\' + Data_Packet.Identity.userid + '-profiledp' + ext;

  req.files.im.mv(imffinalpath, function (err) {
      if (err) {
          fs.unlinkSync(imffinalpath);
          return res.status(500).send(err);
      }
      res.send('File uploaded!');
  });
});

router.post('/profile', async (req, res) => {
  //console.log("ProfileController post:");
  let Data_Packet = new Utils.mdl_Data_Packet();
  Data_Packet = JSON.parse(req.body.dt);
  let Result;
  if (Data_Packet.comtype == Utils.CommandType.Get) {
    const profileResult = await profileController.Get_User_profile_data(Data_Packet);
    const kycResult = await KycController.Get_User_kyc_status(Data_Packet.Identity.userid);
    const referralResult = await profileController.Get_Isrefferal_reedem(Data_Packet.Identity.userid);
    const vipResult = await profileController.Get_IsUserVip(Data_Packet.Identity.userid);

    Result = {
      prf: profileResult,
      kyc: kycResult,
      refrm: referralResult,
      vip: vipResult
    }
  } else if (Data_Packet.comtype == Utils.CommandType.Update) {
    let profileData = new Utils.mdl_EndUser_Profile();
    profileData = Data_Packet.JData;
    Result = await profileController.UpdateUser_ProfileDetails(Data_Packet.Identity, profileData);
    if (Result["stat"] == "success") {
      const profileResult = await profileController.Get_User_profile_data(Data_Packet);
      Result = {
        stat: "success",
        prf: profileResult
      }
    }
  }
  res.send(Result);
});

router.get('/refferal', async (req, res) => {
  let Data_Packet = new Utils.mdl_Data_Packet();
  Data_Packet = JSON.parse(req.body.dt);
  let dbname = Utils.EDatabases.App;
  let stmt = `CALL ${dbname}.sp_refferal_reedem (?, ?)`;
  let ArrInfo = [userid, Data_Packet.JData];

  return new Promise(function (resolve, reject) {
    dbConn.query(stmt, ArrInfo, function (err, result) {
      if (err) {
        //console.log("error: ", err);
        return reject(err);
      }
      else {
        //console.log(" Get_IsUserVip: ", result[0]);
        resolve(result[0]);
      }
    });
  });
});



module.exports = router;