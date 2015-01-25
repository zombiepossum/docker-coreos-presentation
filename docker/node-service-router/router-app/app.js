var express = require('express');
var app = express();

var httpProxy = require('http-proxy');
var proxy = httpProxy.createProxyServer();

app.set('port', process.env.PORT || 3000);

app.listen(app.get('port'), function(){
  console.log( 'Express started on http://localhost:' +
  app.get('port') + '; press Ctrl-C to terminate.' );
});

app.get('/', function(req, res){
  proxy.web(req,res, {
    target: 'http://www.google.com'
  });
});

app.get('/yahoo', function(req, res){
  console.log("Original URL: " + req.url);
  req.url = req.url.replace(/yahoo/, '');
  console.log("New URL: " + req.url);
  proxy.web(req,res, {
    target: 'http://localhost:4000'
  });
});
