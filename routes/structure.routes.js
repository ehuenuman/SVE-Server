const express = require('express');
const router  = express.Router();

const controller = require('../controllers/structure.controller')

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
          controller.getStructuresForAdmin(req, res);
          break;
        case 2:
          controller.getStructuresOfRepr(req, res);
          break;
        case 3:
          controller.getStructureOfResp(req, res);
          break;
        case 4:
          controller.getStructuresOfGuest(req, res);
          break;
      }
    } else {
      res.sendStatus(401);
    }
});

router.get('/:id', controller.getStructure);
//router.post('/', controller.createStructure);
router.put('/:id', controller.editStructure);
router.delete('/:id', controller.deleteStructure);

module.exports = router;