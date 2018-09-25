const jsonfile = require('jsonfile');

const uploadDataController = {};

uploadDataController.uploadDataOfSensors = (req, res) => {
    var date = new Date();
    const file = './tmp/data.json';
    jsonfile.writeFile(file, req.body, { flag: 'a' }, function(err) {
        if (err) console.log(err)
    });
    res.status(200);
    res.json({
        "status": 200,
        "message": "Información recepcionada correctamente"
    });
}

module.exports = uploadDataController;