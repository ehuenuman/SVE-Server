const structureController = {};

structureController.getStructuresForAdmin = (req, res) => {
  connection.query('call getStructuresAdmin', function (error, results, fields) {
    if (error) {
      res.json({
        "status": 500, "error": error, "repsonse": null
      });
    } else {
      res.json({
        "status": 200, "error": null, "response": results
      });
    }
  });
};

structureController.getStructuresOfRepr = (req, res) => {
  connection.query("call getStructuresOfRepr("+ req.user.enterprise_id +")", function (error, result, fields) {
    if (error) {
      res.json({
        "status": 500, "error": error, "response": null
      });
    } else {
      res.json({
        "status": 200, "error": null, "response": result
      });
    }
  });
};

structureController.getStructureOfResp = (req, res) => {
  connection.query("call getStructuresOfResp(?)", req.user.user_id, function (error, result, fields) {
    if (error) {
      res.json({
        "status": 500, "error": error, "response": null
      });
    } else {
      res.json({
        "status": 200, "error": null, "response": result
      });
    }
  });
};

structureController.getStructuresOfGuest = (req, res) => {
  connection.query("call getStructuresOfRepr(?)", req.user.enterprise_id, function (error, result, fields) {
    if (error) {
      res.json({
        "status": 500, "error": error, "response": null
      });
    } else {
      res.json({
        "status": 200, "error": null, "response": result
      });
    }
  });
};

structureController.getStructure = function() {}

structureController.createStructure = function() {}

structureController.editStructure = function() {}

structureController.deleteStructure = function() {}

module.exports = structureController;