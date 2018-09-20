const express = require('express');
const router  = express.Router();

const authMethods = require('../config/auth.methods');
const passport = require('../config/passport');

const controller = require('../controllers/auth.controller');

router.post('/login', (req, res) => {
  controller.login(req, res);
});

module.exports = router;
