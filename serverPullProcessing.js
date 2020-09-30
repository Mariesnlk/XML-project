let http = require('http');
let express = require('express');


let serverPullProcessing=express();
serverPullProcessing.listen(8888);
console.log('Server is running on port 8888');
let fileName=__dirname+"/pullProcessing.xml"

serverPullProcessing.use(express.static(__dirname));

serverPullProcessing.get('/', function(req, res){
    res.sendFile(fileName);
});
