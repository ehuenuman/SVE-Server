const methods = require('./methods.controller');

const sensorController = {};

sensorController.getSensors = (req, res) => {
  connection.query("call getSensorsOfStructure(" + req.params.id + ")", function (error, result, fields) {        
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

sensorController.getSensorOfStructure = (req, res) => {
  let structure_id = req.params.structure_id;
  let sensor_id = req.params.sensor_id;

  connection.query("call getSensorOfStructure(" + sensor_id + "," + structure_id + ")", function(error, result, fields) {
    if (!methods.isError(error, res)) {
      if (result[0].length == 0) {
        res.status(404);
        res.json({
          "status": 404,
          "error": "La estructura no utiliza el sensor.",
          "response": []
        });
      } else {
        res.status(200);
        res.json({
          "status": 200,
          "error": null,
          "response": result[0]
        });
      }
    }
  });
}

sensorController.createSensor = function() {}

sensorController.editSensor = function() {}

sensorController.deleteSensor = function() {}


module.exports = sensorController;