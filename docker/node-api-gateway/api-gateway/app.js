var express = require('express');
var app = express();

var http = require('http');

app.set('port', process.env.PORT || 3000);


var serviceGatewayAddress = process.env.SERVICE_GATEWAY_PORT_80_TCP_ADDR || '172.17.8.105'
var serviceGatewayPort = process.env.SERVICE_GATEWAY_PORT_80_TCP_PORT || "8080"

console.log("Service Gateway Address: " + serviceGatewayAddress)
console.log("Service Gateway Port: " + serviceGatewayPort)


app.listen(app.get('port'), function(){
  console.log( 'Express started on http://localhost:' +
  app.get('port') + '; press Ctrl-C to terminate.' );
});

app.get('/addresses', function(req, res){

  var requestOptions = {
    host: serviceGatewayAddress,
    path: "/address",
    //since we are listening on a custom port, we need to specify it by hand
    port: serviceGatewayPort,
    //This is what changes the request to a POST request
    method: 'GET'
  };

  console.log("request for addresses");
  var req = http.request(requestOptions, function(res1) {
    var data = "";
    console.log('STATUS: ' + res1.statusCode);
    console.log('HEADERS: ' + JSON.stringify(res1.headers));
    res1.setEncoding('utf8');
    res1.on('data', function (chunk) {
      console.log('Data: ' + chunk);
      data += chunk;
    });
    res1.on('end', function(){

      console.log("finished and sending " + JSON.parse(data));
      res.json(JSON.parse(data));
    });
  });

  req.end();
});

app.get('/users', function(req, res){
  var requestOptions = {
    host: serviceGatewayAddress,
    path: '/users',
    //since we are listening on a custom port, we need to specify it by hand
    port: serviceGatewayPort,
    //This is what changes the request to a POST request
    method: 'GET'
  };

  console.log("request for users");
  var req = http.request(requestOptions, function(res1) {
    var data = "";
    console.log('STATUS: ' + res1.statusCode);
    console.log('HEADERS: ' + JSON.stringify(res1.headers));
    res1.setEncoding('utf8');
    res1.on('data', function (chunk) {
      console.log('Data: ' + chunk);
      data += chunk;
    });
    res1.on('end', function(){

      console.log("finished and sending " + JSON.parse(data));
      res.json(JSON.parse(data));
    });
  });

  req.end();
});

app.get('/', function(req, res){
  res.json({msg: "hello world"});
});
