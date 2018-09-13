const express = require('express');
const router  = express.Router();

//const controller = require('../controllers/login.controller')
const passport = require('../config/passport');

router.post('/login', (req, res, next) => {
  //console.log('Inside POST /login callback function');
  //console.log(req.body);
  passport.authenticate('login', (error, user, info) => {
    //console.log('Inside passport.authenticate() callback');
    //console.log(`req.session.passport: ${JSON.stringify(req.session.passport)}`)
    //console.log(`req.user: ${JSON.stringify(req.user)}`)
    req.login(user, (err) => {
      //console.log('Inside req.login() callback')
      //console.log(`req.session.passport: ${JSON.stringify(req.session.passport)}`)
      //console.log(`req.user: ${JSON.stringify(req.user)}`)
      return res.json({
        'error': error,
        'info': info.msg,
        'user': req.user
      });
    })
  })(req, res, next);
});

module.exports = router;
