var test = require('tape');

require(__dirname + '/app.js');

test('http response', function (t) {
	require('http').get("http://localhost:8080", function (res) {
		res.on('data', function (chunk) {
			t.equal(chunk.toString(), "Hello World");
			t.end();
			process.exit(0);
		});
	});
});
