let http = require('http');
let express = require('express');


let serverGroupingMunch = express();
serverGroupingMunch.listen(8888);
console.log('Server is running on port 8888');
let fileName = __dirname + "/groupingMunch.xml"

serverGroupingMunch.use(express.static(__dirname));

serverGroupingMunch.get('/', function (req, res) {
    res.sendFile(fileName);
});
