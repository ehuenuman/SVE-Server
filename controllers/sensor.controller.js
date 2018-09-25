const methods = require('./methods.controller');

const sensorController = {};

sensorController.getSensors = (req, res) => {
  connection.query("call getSensorsOfStructure(" + req.body.structure_id + ")", function (error, result, fields) {
    if (!methods.isError(error, res)) {
      res.status(200);
      res.json({
        "status": 200,
        "error": null,
        "response": result[0]
      });
    }
  });
}

sensorController.getSensor = function() {}

sensorController.createSensor = function() {}

sensorController.editSensor = function() {}

sensorController.deleteSensor = function() {}


module.exports = sensorController;