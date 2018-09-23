var jwt = require("jsonwebtoken");
const passport = require('../config/passport');
const authMethods = require("../config/auth.methods");

const authController = {};

authController.login = (req, res) => {
  //console.log('Inside POST /login callback function');
  passport.authenticate('login', { session: false }, (error, user, info) => {
    //console.log("Inside passport.authenticate callback");
    if (error || !user ) {
      res.status(404).json({
        'error': error,
        'info': info.msg,
        'user': user
      });
//      return;
    }
    if (user) {
      const payload = authMethods.generatePayload(user);
      req.login(payload, { session: false }, (err) => {
        if (err) {
          res.status(404).json({
            'error': err
          });
        }
        
        var token = authMethods.generateJwt(payload);
        user.salt = "salt";
        user.password = "password";
        //console.log(req);
        //res.cookie('jwt', token, { httpOnly: true, secure: true });
        res.status(200).json({
          'token': token,
          'error': error,
          'info': info.msg,
          'user': payload
        });
      });
    } 
  })(req, res);
};

module.exports = authController;