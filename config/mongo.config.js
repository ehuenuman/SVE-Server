const mongoose = require('mongoose');

// Connection URL
const uri = 'mongodb://pontinel:XqgABXscwAgwxdM8maZt@localhost:27017/pontinel';

mongoose.connect(uri, {useNewUrlParser: true})
  .then(db => console.log("Connected successfully to MongoDB"))
  .catch(err => console.error(err));

module.exports = mongoose;


