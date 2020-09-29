let http = require('http');
let express = require('express');


let xmlserverpush=express();
xmlserverpush.listen(8888);
console.log('Server is running on port 8888');
let fileName=__dirname+"/firstxmlpush.xml"

xmlserverpush.use(express.static(__dirname));

xmlserverpush.get('/', function(req, res){
    res.sendFile(fileName);
});
