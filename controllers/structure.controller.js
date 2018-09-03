const structureController = {};

structureController.getStructures = (req, res) => {
    connection.query('call getStructures', function (error, results, fields) {
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
}

structureController.getStructure = function () {}

structureController.createStructure = function() {}

structureController.editStructure = function() {}

structureController.deleteStructure = function() {}


module.exports = structureController;