const jsonfile = require('jsonfile');

const methods = require('./methods.controller');
const Sensor = require('../models/sensor');

const uploadDataController = {};

uploadDataController.uploadDataOfSensors = (req, res) => {

  
  const data = req.body;  
  
  data.structure.daq.forEach(daq => {
    var nodes = daq.node;    
    nodes.forEach(node => {
      var sensors = node.sensor;
      sensors.forEach(sensor => {        
        // Actualiza el sensor si se encuentra su ID, 
        // de lo contrario lo crea.
        Sensor.updateOne(
          { id: sensor.id },
          { 
            $setOnInsert: {
              status: sensor.status
            },
            $push: {
              measures: {
                $each: sensor.measures
              }               
            }           
          },
          { upsert: true }, 
          (err, theSensor) => {
          if (err) {
            console.error("Error generado al buscar un sensor. Error: ", err);
            res.status(500);
            res.json({"status": 500, "response": "¡Error!"})
          } else {
            // Se debe analizar si existe algún valor sobre los umbrales
            searhAlert(sensor.id, sensor.measures[0].timestamp, res);            
          }
        });
      });
    });
  });
  
  const file = './tmp/data.json';
  jsonfile.writeFile(file, req.body, { flag: 'a' }, function(err) {
    if (err) console.log(err)
    else console.log("Documento json actualizado");
  });
  /*
  res.status(200);
  res.json({
    "status": 200,
    "message": "Información recepcionada correctamente",
    "sensors": sensors
  });
  */
}

module.exports = uploadDataController;


/**
 * Busca entre los nuevos valores si existe alguno
 * que se encuentre fuera del umbral de seguridad.
 * Si existe una alerta o advertencia genera el mensaje al cliente
 * y almacena la información en la BD MySQL
 * @param {*} sensorId - identificador del sensor a buscar sus umbrales.
 * @param {*} oldDate  - fecha desde la cual se comenzara a comparar los valores con los umbrales.
 * @param {*} res - objeto response de la consulta realizada.
 */
function searhAlert(sensorId, oldDate, res) { 
  // Reetorna los umbrales; 4 total, 2 para advertencia y 2 para alerta; positivos y negativos con sus caracteristicas. 
  // Primero estan los dos de advertencia y luego los dos de alerta.
  mysql.query("call getThresholdOfSensor("+ sensorId +")", async function (error, thresholds, fields) {
    if (!methods.isError(error, res)) {
      var adv_1, adv_2, ale_1, ale_2;
      
      // Buscar nueva forma de validar esta sección
      adv_1 = thresholds[0][0];
      adv_2 = thresholds[0][1];
      ale_1 = thresholds[0][2];
      ale_2 = thresholds[0][3];      
      // Buscar nueva forma de validar esta sección

      // Se consulta a MongoDB por lo valores fuera de la zona segura.
      // Se extraen todos para luego revisar uno a uno si es adv o ale.      
      const cursor = await Sensor.aggregate([
        { $match: { id: sensorId } },
        {
          $project: {        
            measures: {
              $filter: {
                input: "$measures",
                as: "measure",
                cond: {
                  $or: [
                    { $and: [
                      { $lte: [ "$$measure.value", adv_1["value"] ] },
                      { $gte: [ "$$measure.timestamp", new Date(oldDate) ] }
                    ] },
                    { $and: [
                      { $gte: [ "$$measure.value", adv_2["value"] ] },
                      { $gte: [ "$$measure.timestamp", new Date(oldDate) ] }
                    ] }
                  ]              
                }
              }
            }
          }
        }
      ]);

      // Recorremos cada valor y se genera la alerta o advertencia correspondiente.     
      cursor.map( function(document) {
        document.measures.forEach(measure => {
          var threshold_id = 0;
          var threshold_type;       
          if (measure.value <= ale_1["value"] || measure.value >= ale_2["value"]) {
            console.log("Alerta: ", measure.value);
            threshold_type = ale_1["type_threshold_name"];
            if (measure.value <= ale_1["value"]) {
              threshold_id = ale_1["type_threshold_id"];
            } else {
              threshold_id = ale_2["type_threshold_id"];
            }
          } else {
            console.log("Advertencia: ", measure.value);
            threshold_type = adv_1["type_threshold_name"];
            if (measure.value <= adv_1["value"] && measure.value > ale_1["value"]) {
              threshold_id = adv_1["type_threshold_id"];
            } else {
              threshold_id = adv_2["type_threshold_id"];
            }
          }               

          // Insertamos la alerta en MySQL
          mysql.query(
            `call setAlert(
              ${measure.value}, 
              '${measure.timestamp.getFullYear()}-${(measure.timestamp.getMonth()+1)}-${measure.timestamp.getDate()} ${measure.timestamp.getHours()}:${measure.timestamp.getMinutes()}:${measure.timestamp.getSeconds()}', 
              ${sensorId}, 
              ${threshold_id})`,
            function(error, result, fields) {
              if (!methods.isError(error, res)) {
                console.log("Alerta agregada exitosamente a MySQL");
                if (threshold_type == "Alerta") {
                  console.log("Whatsapp");
                } else {
                  console.log("Email");
                }
              }
            }
          );

        });
      });
      res.status(202);
      res.json({
        "status": 202,
        "response": "Información recbida y almacenada exitosamente"
      });
    } //Fin if (!methods.isError(error, res))
  });
}