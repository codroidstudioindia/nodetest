const { json } = require('express');
const Utils = require('../Utility');
const dbConn = require('../dbAdapter');
const axios = require('axios');
const crypto = require('crypto');

async function AddMoneyRequest(req, res) {

  let Data_packet = new Utils.mdl_Data_Packet();
  Data_packet = JSON.parse(Buffer.from(req.query.t, 'base64').toString('ascii'));
  console.log('Data_packet: ', Data_packet);

  let orderid = OrderIdGen();
  console.log('orderid: ', orderid);

  let orderType = "ADDMONEY";
  let Amount = Data_packet.JData;

  let PrePayLoad;
  if (!Number.isInteger(Amount)) {
    console.log('Data_packet.JData is not interger');
    res.send({ stat: 'failed', message: 'not an integer' });
    return;
  }
  let orderStatus = '';
  let dbname = Utils.EDatabases.EndUser;
  let stmt = `CALL ${dbname}.sp_update_order_status(?, ?, ?, ?, ?)`;

  let ArrInfo = [Data_packet.Identity.userid, orderid, orderStatus, orderType, Amount];

  dbConn.query(stmt, ArrInfo, function (err, result) {
    if (err) {
      console.log(err);
    }
    else {
      console.log("RESULT:", result[0][0]);
      let Result = result[0][0];
      if (Result.stat === 'success') {
        PrePayLoad = { userid: Data_packet.Identity.userid, orderid: orderid, amount: Amount };
        switch (req.query.pt) {
          case 'intent':

            break;
          case 'web':
            GotoPhonePay(Data_packet, PrePayLoad, res);
            break;

        }
      }
      else {
        console.log({ stat: 'Imporper amount format' });
        res.send({ stat: 'Imporper amount format' });
      }
      // res.send(result[0][0]);
    }
  });
  //res.send(OrderIdGen());
}

async function GotoPhonePay(Data_packet, PrePayLoad, res) {

  let payload = `{
  "merchantId": "PLAYBEEUAT",
  "merchantTransactionId": "${PrePayLoad.orderid}",
  "merchantUserId": "${PrePayLoad.userid}",
  "amount": 10000,
  "redirectUrl": "https://playbeegames.com/appcode/appgate/Controllers/PayGate/PhonePay/payresp.php?o=${PrePayLoad.orderid}",
  "redirectMode": "GET",
  "callbackUrl": "https://playbeegames.com/appcode/appgate/Controllers/PayGate/PhonePay/paycback.php",
  "mobileNumber": "9999999999",
  "paymentInstrument": {
    "type": "PAY_PAGE"
  }
}`;
  console.log('payload: \n', payload);


  let ApiEndpoint = '/pg/v1/pay';
  console.log('ApiEndpoint: ', ApiEndpoint);

  let saltkey = '44b40a00-f9eb-40d6-b7a6-d446d3873cef';
  console.log('saltkey: ', saltkey);

  let saltIndex = 1;
  console.log('saltIndex: ', saltIndex);

  let base64 = Buffer.from(payload).toString('base64');
  console.log('base64: ', base64);

  let data = base64 + ApiEndpoint + saltkey;

  var sha256hash = crypto.createHash('sha256').update(data).digest('hex');// crypto.createHash('sha256');
  console.log('sha256hash: ', sha256hash);

  console.log('data: ', data);

  let XVERIFY = sha256hash + '###' + saltIndex;

  console.log("XVERIFY : ", XVERIFY);

  const options = {
    method: 'post',
    url: 'https://api-preprod.phonepe.com/apis/merchant-simulator/pg/v1/pay',
    headers: {
      accept: 'text/plain',
      'Content-Type': 'application/json',
      'X-VERIFY': XVERIFY
    },
    data: {
      "request": base64
    }
  };


  axios.request(options).then(function (response) {
    console.log(response.data);
    res.send(response.data);
    //return(response.data);
  }).catch(function (error) {
    console.error(error);
    res.send(error);
    //return(error);
  });



}



/*

async function GotoPhonePay(Data_packet, PrePayLoad, res) {
  let payload = {
    merchantId: 'PLAYBEEUAT',
    merchantTransactionId: PrePayLoad.orderid,
    merchantUserId: PrePayLoad.userid,
    amount: PrePayLoad.amount*100.00,
    redirectUrl: 'https://playbeegames.com/appcode/appgate/Controllers/PayGate/PhonePay/payresp.php?o=' + PrePayLoad.orderid,
    redirectMode: 'GET',
    callbackUrl: 'https://playbeegames.com/appcode/appgate/Controllers/PayGate/PhonePay/paycback.php',
    mobileNumber: Data_packet.Identity.phone_number.toString(),
    paymentInstrument: {
      type: 'PAY_PAGE',
    }
  }

  console.log('payload: ', payload);


  let ApiEndpoint = '/pg/v1/pay';
  console.log('ApiEndpoint: ', ApiEndpoint);

  let saltkey = '44b40a00-f9eb-40d6-b7a6-d446d3873cef';
  console.log('saltkey: ', saltkey);

  let saltIndex = 1;
  console.log('saltIndex: ', saltIndex);

  let base64 = Buffer.from(JSON.stringify(payload)).toString('base64');
  console.log('base64: ', base64);

  var hash = crypto.createHash('sha256');
  console.log('hash: ', hash);

  data = hash.update(base64 + ApiEndpoint + saltkey, 'utf-8');
  console.log('data: ', data);

  gen_hash = data.digest('hex');
  console.log("hash : ", gen_hash);

  let XVERIFY = gen_hash + '###' + saltIndex;

  console.log("XVERIFY : ", XVERIFY);

  const options = {
    method: 'post',
    url: 'https://api-preprod.phonepe.com/apis/pg-sandbox/pg/v1/pay',
    headers: {
      accept: 'text/plain',
      'Content-Type': 'application/json',
      'X-VERIFY': XVERIFY
    },
    data: {
      request: base64
    }
  };


  axios.request(options).then(function (response) {
    console.log(response.data);
    res.send(response.data);
    //return(response.data);
  }).catch(function (error) {
    console.error(error);
    res.send(error);
    //return(error);
  });



}



*/
/*
function IntentLoad(Data_packet, orderid) {
  let payload = {
    merchantId: 'PLAYBEEUAT',
    merchantTransactionId: orderid,
    merchantUserId: 'PBasdad66a',
    amount: Data_packet.JData * 100.00,
    callbackUrl: 'https://playbeegames.com/appcode/appgate/Controllers/PayGate/PhonePay/paycback.php',
    mobileNumber: Data_packet.Identity.phone_number.toString(),
    deviceContext: {
      deviceOS: 'ANDROID'
    },
    paymentInstrument: {
      type: 'UPI_INTENT',
      targetApp: 'com.phonepe.app'
    }
  }
  let base64 = Buffer.from(payload).toString('base64');

  let ApiEndpoint = '/pg/v1/pay';
  let saltkey = '44b40a00-f9eb-40d6-b7a6-d446d3873cef';
  let saltIndex = 1;

}
*/



function OrderIdGen() {
  return "PB" + Date.now();
}
module.exports = {
  AddMoneyRequest,
  OrderIdGen
}

