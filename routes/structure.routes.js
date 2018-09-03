const express = require('express');
const router  = express.Router();

const controller = require('../controllers/structure.controller')

router.get('/', controller.getStructures)
router.get('/:id', controller.getStructure);
router.post('/', controller.createStructure);
router.put('/:id', controller.editStructure);
router.delete('/:id', controller.deleteStructure);

module.exports = router;