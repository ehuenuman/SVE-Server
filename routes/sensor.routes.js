const express = require('express');
const router  = express.Router();

const controller = require('../controllers/sensor.controller')

var jwt = require('express-jwt');
var auth = jwt({
  secret: "MY_SECRET",
  getToken: function fromHeaderOrQueryString (req) {
    if (req.headers.authorization && req.headers.authorization.split(' ')[0] === 'Bearer') {
      return req.headers.authorization.split(' ')[1];
    } else if (req.query && req.query.token) {
      return req.query.token;
    }
    return null;
  }
});

router.post('/', auth, controller.getSensors);
router.get('/:id', controller.getSensor);
router.post('/', controller.createSensor);
router.put('/:id', controller.editSensor);
router.delete('/:id', controller.deleteSensor);

module.exports = router;