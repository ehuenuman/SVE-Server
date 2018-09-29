const methods = require('./methods.controller');

const structureController = {};

structureController.getStructuresOfAdmin = (req, res) => {
  mysql.query('call getStructuresAdmin', function (error, results, fields) {
    if (!methods.isError(error, res)) {
      res.status(200);
      res.json({
        "status": 200, "error": null, "response": results
      });
    }
  });
};

structureController.getStructuresOfRepr = (req, res) => {
  mysql.query("call getStructuresOfRepr(" + req.user.enterprise_id + ")", function (error, result, fields) {
    if (!methods.isError(error, res)) {
      res.status(200);
      res.json({
        "status": 200, "error": null, "response": result
      });
    }
  });
};

structureController.getStructureOfResp = (req, res) => {
  mysql.query("call getStructuresOfResp(" + req.user._id + ")", function (error, result, fields) {
    if (!methods.isError(error, res)) {
      res.status(200);
      res.json({
        "status": 200, "error": null, "response": result
      });
    }
  });
};

structureController.getStructuresOfGuest = (req, res) => {
  mysql.query("call getStructuresOfRepr(" + req.user.enterprise_id + ")", function (error, result, fields) {
    if (!methods.isError(error, res)) {
      res.status(200);
      res.json({
        "status": 200, "error": null, "response": result
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