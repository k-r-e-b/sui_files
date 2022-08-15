//Import the 'assert' module to validate results.
var assert = require('assert');
var ip = ""

var options = {
    //Define endpoint URL.
    url: "http://" + ip + ":9000/",
    //Define New Relic API key and expected data type.
    body: '{ "jsonrpc":"2.0", "id":1, "method":"sui_getRecentTransactions", "params":[0] }',
    headers: {
        'Content-Type': 'application/json'
        }
};

//Define expected results using callback function.
function callback(error, response, body) {
    //Log status code to Synthetics console.
    console.log(response.statusCode + " status code")
    //Verify endpoint returns 200 (OK) response code.
    assert.ok(response.statusCode == 200, 'Expected 200 OK response');
    //Log end of script.
    console.log("End reached");
}

//Make POST request, passing in options and callback.
$http.post(options, callback);