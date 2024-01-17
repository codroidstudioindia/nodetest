const express = require('express');
const Utils = require('../Utility');
const dbConn = require('../dbAdapter');
const router = express.Router();

const OrderController = require('../Controllers/OrderController');


router.get('/', function (req, res) {
    console.log('OrderController: ');

    OrderController.AddMoneyRequest(req,res);
});

module.exports = router;




/*


    let Data_packet = new Utils.mdl_Data_Packet();
    Data_packet = Buffer.from(req.query.t, 'base64').toString('ascii');
    console.log('Data_packet: ', Data_packet, '\n\n');



    let orderid = OrderController.OrderIdGen();
    let payload = {
        merchantId: 'PLAYBEEUAT',
        merchantTransactionId: orderid,
        merchantUserId: 'PBasdad66a',
        amount: Data_packet.JData * 100.00,
        callbackUrl: 'https://playbeegames.com/appcode/appgate/Controllers/PayGate/PhonePay/paycback.php',
        mobileNumber: `'Data_packet.Identity.phone_number'`,
        deviceContext: {
            deviceOS: 'ANDROID'
        },
        paymentInstrument: {
            type: 'UPI_INTENT',
            targetApp: 'com.phonepe.app'
        }
    }
    let base64 = Buffer.from(Data_packet).toString('base64');
    console.log('payload', payload);
    console.log('base64', base64);

    return;



    console.log('Data_packet: ', Data_packet, '\n\n');

    base64 = Buffer.from(Data_packet).toString('base64');
    console.log('base64: ', base64, '\n\n');

    let txt = Buffer.from(base64, 'base64').toString('ascii');
    console.log('txt: ', txt, '\n\n');
    res.send('');

    return;
    console.log("OrderData: ", OrderData);
    console.log("Jdata: ", Jdata);
    OrderController.AddMoneyRequest(req, res);
*/