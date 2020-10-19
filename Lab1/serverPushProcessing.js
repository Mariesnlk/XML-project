let http = require('http');
let express = require('express');


let serverPushProcessing = express();
serverPushProcessing.listen(8888);
console.log('Server is running on port 8888');
let fileName = __dirname + "/pushProcessing.xml"

serverPushProcessing.use(express.static(__dirname));

serverPushProcessing.get('/', function (req, res) {
    res.sendFile(fileName);
});
