const MongoClient = require('mongodb').MongoClient;
const assert = require('assert');

// Connection URL
const url = 'mongodb://pontinel:XqgABXscwAgwxdM8maZt@127.0.0.1:27017/pontinel';

// Use connect method to connect to the Server  
MongoClient.connect(url, { useNewUrlParser: true }, function(err, client) {
  assert.equal(null, err);
  console.log("Connected successfully to MongoDB");
  //client.close();  
  return client.db("pontinel");
});

module.exports = mongoMethods;


