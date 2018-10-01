const jsonfile = require('jsonfile');

const Sensor = require('../models/sensor');

const uploadDataController = {};

uploadDataController.uploadDataOfSensors = async (req, res) => {
    const sensors = await Sensor.find();
    
    const file = './tmp/data.json';
    jsonfile.writeFile(file, req.body, { flag: 'a' }, function(err) {
        if (err) console.log(err)
    });
    res.status(200);
    res.json({
        "status": 200,
        "message": "Información recepcionada correctamente",
        "sensors": sensors
    });
}

module.exports = uploadDataController;