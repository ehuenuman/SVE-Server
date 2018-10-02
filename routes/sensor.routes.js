const express = require('express');
const router  = express.Router();

const controller = require('../controllers/sensor.controller')

var jwt = require('express-jwt');
var auth = jwt({
  secret: process.env.SECRET_KEY || "MOTA_FLOJA",
  getToken: function fromHeaderOrQueryString (req) {
    if (req.headers.authorization && req.headers.authorization.split(' ')[0] === 'Bearer') {
      return req.headers.authorization.split(' ')[1];
    } else if (req.query && req.query.token) {
      return req.query.token;
    }
    return null;
  }
});

router.post('/', auth, controller.getDataSensor);
//router.get('/:id', auth, controller.getSensor);
//router.post('/', controller.createSensor);
//router.put('/:id', controller.editSensor);
//router.delete('/:id', controller.deleteSensor);

module.exports = router;