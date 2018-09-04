const express = require('express');
const router  = express.Router();

const controller = require('../controllers/sensor.controller')

router.get('/', controller.getSensors)
router.get('/:id', controller.getSensor);
router.post('/', controller.createSensor);
router.put('/:id', controller.editSensor);
router.delete('/:id', controller.deleteSensor);

module.exports = router;