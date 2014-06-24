var port = 8080;

require('http').createServer(function (req, res) {
	res.writeHead(200, {'Content-Type': 'text/plain'});
	res.end('Hello World');
}).listen(port);

console.log('HTTP server listening on port ' + port);
