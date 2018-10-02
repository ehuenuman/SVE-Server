const methods = require('./methods.controller');

const sensorController = {};

sensorController.getSensors = (req, res) => {
  mysql.query("call getSensorsOfStructure(" + req.params.id + ")", function (error, result, fields) {        
    if (!methods.isError(error, res)) {
      var sensors = [];
      var data = result[0];      
      data.forEach(sensor => {
        if (sensors.length == 0) {
          sensors.push(sensor);
        } else {
          var id = sensor.id;
          var adv_count = sensor.adv_count;
          var ale_count = sensor.ale_count;
          var temp_sensor = sensors[sensors.length-1]
          if (temp_sensor.id == id) {
            if (temp_sensor['adv_count'] > 0 && temp_sensor['ale_count'] == 0) {
              sensors[sensors.length-1]['ale_count'] = ale_count;
            } 
            if (temp_sensor['adv_count'] == 0 && temp_sensor['ale_count'] > 0) {
              sensors[sensors.length-1]['adv_count'] = adv_count;
            }
          } else {
            sensors.push(sensor);
          }
        }
      });

      res.status(200);
      res.json({
        "status": 200,
        "error": null,
        "response": sensors
      });
    }
  });
}

sensorController.getSensorOfStructure = (req, res) => {
  let structure_id = req.params.structure_id;
  let sensor_id = req.params.sensor_id;

  mysql.query("call getSensorOfStructure(" + sensor_id + "," + structure_id + ")", function(error, result, fields) {
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
          "response": result[0][0]
        });
      }
    }
  });
}

sensorController.createSensor = function() {}

sensorController.editSensor = function() {}

sensorController.deleteSensor = function() {}


module.exports = sensorController;