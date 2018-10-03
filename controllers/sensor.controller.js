const methods = require('./methods.controller');
const sensor = require('../models/sensor');

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


sensorController.getDataSensor = async (req, res) => {
  var sensor_id = req.body.id;
  var limit_data = req.body.limit;
  var adv_1, adv_2, ale_1, ale_2;          

  await mysql.query("call getThresholdOfSensor("+ sensor_id +")", function (error, thresholds, fields) {
    if (!methods.isError(error, res)) {
      adv_1 = thresholds[0][0];
      adv_2 = thresholds[0][1];
      ale_1 = thresholds[0][2];
      ale_2 = thresholds[0][3];
      
      sensor.findOne({id: sensor_id}, function (error, document) {
        if (error) {
          res.status(500);
          res.json({
            "status": 500,
            "error": error
          });
        } else {
          if (document) {
            var xAxis = [];
            var yAxis = [];
            var maxValue = document.measures[0];
            var minValue = document.measures[0];        
            
            document.measures.forEach(measure => {          
              if (measure.value >= maxValue.value) {
                maxValue = measure;                        
              }
              if (measure.value <= minValue.value) {
                minValue = measure;            
              }          
              xAxis.push(measure.timestamp);
              yAxis.push(measure.value);
            });       
    
            res.status(200);
            res.json({
              "status": 200,
              "response": {
                "xAxis": xAxis,
                "yAxis": yAxis,
                "thresholds": {
                  "adv1": adv_1,
                  "adv2": adv_2,
                  "ale1": ale_1,
                  "ale2": ale_2
                },
                "historical": {
                  "maxValue": maxValue,
                  "minValue": minValue
                }
              }
            });
          } else {
            res.status(200)
            res.json({
              "status": 200,
              "response": []
            });
          }
        }
      });  
    }
  });

}

sensorController.createSensor = function() {}

sensorController.editSensor = function() {}

sensorController.deleteSensor = function() {}


module.exports = sensorController;