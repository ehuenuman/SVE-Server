const express = require('express');
const router  = express.Router();

const controller = require('../controllers/structure.controller')

/* Tipos de usuarios
 * 1: Administrador
 * 2: Representante
 * 3: Responsable
 * 4: Invitado
 */

router.get('/', (req, res) => {
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
}
  
  /*if (req.isAuthenticated()) {
    controller.getStructuresForAdmin
  } else {
    res.redirect('/');
  }*/
);

router.get('/:id', controller.getStructure);
router.post('/', controller.createStructure);
router.put('/:id', controller.editStructure);
router.delete('/:id', controller.deleteStructure);

module.exports = router;