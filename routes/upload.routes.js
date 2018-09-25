const express = require('express');
const router  = express.Router();

const controller = require('../controllers/upload.controller');

router.post('/', controller.uploadDataOfSensors);

module.exports = router;