const express = require('express');
const router  = express.Router();

const structureController = require('../controllers/structure.controller');
const sensorController = require('../controllers/sensor.controller');

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

/* Tipos de usuarios
 * 1: Administrador
 * 2: Representante
 * 3: Responsable
 * 4: Invitado
 */

router.post('/', auth, 
  (req, res) => {
    if ( req.user.profile_id ) {
      switch ( req.user.profile_id ) {
        case 1:
          structureController.getStructuresForAdmin(req, res);
          break;
        case 2:
          structureController.getStructuresOfRepr(req, res);
          break;
        case 3:
          structureController.getStructureOfResp(req, res);
          break;
        case 4:
          structureController.getStructuresOfGuest(req, res);
          break;
      }
    } else {
      res.sendStatus(401);
    }
});

router.get('/:id', structureController.getStructure);

router.get('/:id/sensor', sensorController.getSensors)

router.get('/:id_structure/sensor/:id_sensor', sensorController.getSensor)
//router.post('/', controller.createStructure);
//router.put('/:id', controller.editStructure);
//router.delete('/:id', controller.deleteStructure);

module.exports = router;