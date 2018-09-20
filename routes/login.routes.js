const express = require('express');
const router  = express.Router();

//const controller = require('../controllers/login.controller')
const passport = require('../config/passport');
const auth_methods = require("../config/auth.methods");

router.post('/login', (req, res, next) => {
  //console.log('Inside POST /login callback function');
  //console.log(req.body);
  passport.authenticate('login', (error, user, info) => {
    if (error) {
      res.status(404).json({
        'error': error,
        'info': info.msg,
        'user': user
      });
      return;
    }

    if (user) {
      var token = auth_methods.generateJwt(user);
      res.status(200);
      res.json({
        'token': token,
        'error': error,
        'info': info.msg,
        'user': user
      });
    } else {
      res.status(404).json({
        'error': error,
        'info': info.msg,
        'user': user
      });
    }
  })(req, res, next);
});

module.exports = router;
