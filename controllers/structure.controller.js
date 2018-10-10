const methods = require('./methods.controller');

const structureController = {};

structureController.getStructuresOfAdmin = (req, res) => {
  mysql.query('call getStructuresAdmin', function (error, result, fields) {
    if (!methods.isError(error, res)) {
      var structures = [];
      var data = result[0];
      data.forEach(structure => {
        if (structures.length == 0) {
          structures.push(structure);
        } else {
          var id = structure.id;
          var adv_count = structure.adv_count;
          var ale_count = structure.ale_count;
          var temp_sensor = structures[structures.length-1]
          if (temp_sensor.id == id) {
            if (temp_sensor['adv_count'] > 0 && temp_sensor['ale_count'] == 0) {
              structures[structures.length-1]['ale_count'] = ale_count;
            } 
            if (temp_sensor['adv_count'] == 0 && temp_sensor['ale_count'] > 0) {
              structures[structures.length-1]['adv_count'] = adv_count;
            }
          } else {
            structures.push(structure);
          }
        }
      });
      
      res.status(200);
      res.json({
        "status": 200, 
        "error": null, 
        "response": structures
      });
    }
  });
};

structureController.getStructuresOfRepr = (req, res) => {
  mysql.query("call getStructuresOfRepr(" + req.user.enterprise_id + ")", function (error, result, fields) {
    if (!methods.isError(error, res)) {
      var structures = [];
      var data = result[0];
      data.forEach(structure => {
        if (structures.length == 0) {
          structures.push(structure);
        } else {
          var id = structure.id;
          var adv_count = structure.adv_count;
          var ale_count = structure.ale_count;
          var temp_sensor = structures[structures.length-1]
          if (temp_sensor.id == id) {
            if (temp_sensor['adv_count'] > 0 && temp_sensor['ale_count'] == 0) {
              structures[structures.length-1]['ale_count'] = ale_count;
            } 
            if (temp_sensor['adv_count'] == 0 && temp_sensor['ale_count'] > 0) {
              structures[structures.length-1]['adv_count'] = adv_count;
            }
          } else {
            structures.push(structure);
          }
        }
      });
      
      res.status(200);
      res.json({
        "status": 200, 
        "error": null, 
        "response": structures
      });
    }
  });
};

structureController.getStructureOfResp = (req, res) => {
  mysql.query("call getStructuresOfResp(" + req.user._id + ")", function (error, result, fields) {
    if (!methods.isError(error, res)) {
      var structures = [];
      var data = result[0];
      data.forEach(structure => {
        if (structures.length == 0) {
          structures.push(structure);
        } else {
          var id = structure.id;
          var adv_count = structure.adv_count;
          var ale_count = structure.ale_count;
          var temp_sensor = structures[structures.length-1]
          if (temp_sensor.id == id) {
            if (temp_sensor['adv_count'] > 0 && temp_sensor['ale_count'] == 0) {
              structures[structures.length-1]['ale_count'] = ale_count;
            } 
            if (temp_sensor['adv_count'] == 0 && temp_sensor['ale_count'] > 0) {
              structures[structures.length-1]['adv_count'] = adv_count;
            }
          } else {
            structures.push(structure);
          }
        }
      });
      
      res.status(200);
      res.json({
        "status": 200, 
        "error": null, 
        "response": structures
      });
    }
  });
};

structureController.getStructuresOfGuest = (req, res) => {
  mysql.query("call getStructuresOfRepr(" + req.user.enterprise_id + ")", function (error, result, fields) {
    if (!methods.isError(error, res)) {
      var structures = [];
      var data = result[0];
      data.forEach(structure => {
        if (structures.length == 0) {
          structures.push(structure);
        } else {
          var id = structure.id;
          var adv_count = structure.adv_count;
          var ale_count = structure.ale_count;
          var temp_sensor = structures[structures.length-1]
          if (temp_sensor.id == id) {
            if (temp_sensor['adv_count'] > 0 && temp_sensor['ale_count'] == 0) {
              structures[structures.length-1]['ale_count'] = ale_count;
            } 
            if (temp_sensor['adv_count'] == 0 && temp_sensor['ale_count'] > 0) {
              structures[structures.length-1]['adv_count'] = adv_count;
            }
          } else {
            structures.push(structure);
          }
        }
      });
      
      res.status(200);
      res.json({
        "status": 200, 
        "error": null, 
        "response": structures
      });
    }
  });
};

structureController.getStructure = (req, res) => {  
  mysql.query("call getStructure(" + req.params.id + ")", function (error, result, fields) {
    if (!methods.isError(error, res)) {
      res.status(200);
      res.json({
        "status": 200, "error": null, "response": result[0][0] });
    }
  });
};

structureController.createStructure = function() {}

structureController.editStructure = function() {}

structureController.deleteStructure = function() {}

module.exports = structureController;