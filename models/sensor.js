const mongoose = require('mongoose');
const Schema = mongoose.Schema;

const sensorSchema = new Schema({
  id: Number,
  status: String,
  measures: [
    {
      timestamp: Date,
      value: Number
    }
  ]
});

module.exports = mongoose.model('sensor', sensorSchema);