var express = require('express');

var app = express();

app.set('port', process.env.PORT || 4000);

app.listen(app.get('port'), function(){
  console.log( 'Express started on http://localhost:' +
  app.get('port') + '; press Ctrl-C to terminate.' );
});

app.get('/', function(req, res){
  var response = {}
  response.street = '111 1st Street NE';
  response.city = 'Minneapolis';
  response.state = 'MN';
  response.postalCode = '55416';
  res.send(response);
});
