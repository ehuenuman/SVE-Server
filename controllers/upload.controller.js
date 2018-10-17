const jsonfile = require('jsonfile');

const methods = require('./methods.controller');
const Sensor = require('../models/sensor');

const uploadDataController = {};

uploadDataController.uploadDataOfSensors = async (req, res) => {
  
  const data = req.body;  
  
  await data.structure.daq.forEach(daq => {    
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
            //console.error("Error generado al buscar un sensor. Error: ", err);
            res.status(500);

          } else {
            // Se debe analizar si existe algún valor sobre los umbrales
            searchAlert(sensor.id, sensor.measures, res);            
          }
        });
      });
    });
  });

  res.status(200);
    res.json({
      "status": 200,
      "response": "Información recibida y almacenada exitosamente"
  });
  
  /*const file = './tmp/data.json';
  jsonfile.writeFile(file, req.body, { flag: 'a' }, function(err) {
    if (err) console.log(err)
    else console.log("Documento json actualizado");
  });
  */
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
 * @param {*} measures - valores que acaba de leer el sensor.
 * @param {*} res - objeto response de la consulta realizada.
 */
function searchAlert(sensorId, measures, res) { 
  
  var FACTOR_A = 1;
  var FACTOR_B = 0;

  mysql.query("select * from pontinel.sensor where id=" + sensorId + ";", function(error, sensor, fields) {
    if (!methods.isError(error, res)) {
      if (sensor[0].factor_a) {
        FACTOR_A = sensor[0].factor_a;
      }
      if (sensor[0].factor_b) {
        FACTOR_B = sensor[0].factor_b;
      }

      //console.log(FACTOR_A, FACTOR_B);
    }
  });
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

      //console.log(adv_1, adv_2, ale_1, ale_2);
      // Recorremos cada valor y se genera la alerta o advertencia correspondiente.     
        measures.forEach(measure => {
          //console.log((((measure.value)*FACTOR_A)+FACTOR_B));
          var threshold_id = 0;
          var threshold_type;       
          if ((((measure.value)*FACTOR_A)+FACTOR_B) <= ale_1["value"] || (((measure.value)*FACTOR_A)+FACTOR_B) >= ale_2["value"]) {
            threshold_type = ale_1["id"];
            //console.log("Alerta: ", (((measure.value)*FACTOR_A)+FACTOR_B));
            if ((((measure.value)*FACTOR_A)+FACTOR_B) <= ale_1["value"]) {
              threshold_id = ale_1["type_threshold_id"];
            } else {
              threshold_id = ale_2["type_threshold_id"];
            }
            //console.log(threshold_id);
          } else {
            threshold_type = adv_1["id"];
            if ((((measure.value)*FACTOR_A)+FACTOR_B) <= adv_1["value"] || (((measure.value)*FACTOR_A)+FACTOR_B) >= adv_2["value"]) {
              //console.log("Advertencia: ", (((measure.value)*FACTOR_A)+FACTOR_B));
              if ((((measure.value)*FACTOR_A)+FACTOR_B) <= adv_1["value"]) {
                threshold_id = adv_1["id"];
              } else {
                threshold_id = adv_2["id"];
              }
              //console.log(threshold_id);
            } 
          }           

          // Insertamos la alerta en MySQL
          if (threshold_id != 0) {
            mysql.query(
              `call setAlert(
                ${(((measure.value)*FACTOR_A)+FACTOR_B)}, 
                '${measure.timestamp.split(" ")[0].split("/")[0]}-${measure.timestamp.split(" ")[0].split("/")[1]}-${measure.timestamp.split(" ")[0].split("/")[2]} ${measure.timestamp.split(" ")[1]}',            
                ${sensorId}, 
                ${threshold_id})`,
              function(error, result, fields) {
                if (!methods.isError(error, res)) {
                  //console.log("Alerta agregada exitosamente a MySQL");
                  if (threshold_type == "Alerta") {
                    //console.log("Whatsapp");
                  } else {
                    //console.log("Email");
                  }                
                }
              }
            );
          }
        });
    } //Fin if (!methods.isError(error, res))
  });
}