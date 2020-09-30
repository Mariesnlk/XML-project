let http = require('http');
let express = require('express');


let xmlserverpull=express();
xmlserverpull.listen(8888);
console.log('Server is running on port 8888');
let fileName=__dirname+"/firstxmlpull.xml"

xmlserverpull.use(express.static(__dirname));

xmlserverpull.get('/', function(req, res){
    res.sendFile(fileName);
});
