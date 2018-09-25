const methods = require('./methods.controller');

const uploadDataController = {};

uploadDataController.uploadDataOfSensors = (req, res) => {
    console.log(req.body);
    res.status(200);
    res.json({
        "status": 200,
        "message": "Información recepcionada correctamente"
    });
}

module.exports = uploadDataController;