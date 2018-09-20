const passport = require('../config/passport');
const authMethods = require("../config/auth.methods");

const authController = {};

authController.login = (req, res) => {
  console.log('Inside POST /login callback function');
  passport.authenticate('login', (error, user, info) => {
    console.log("Inside passport.authenticate callback");
    if (error) {
      res.status(404).json({
        'error': error,
        'info': info.msg,
        'user': user
      });
//      return;
    }

    if (user) {
      req.login(user, (err) => {
        var token = authMethods.generateJwt(user);
        res.status(200);
        res.json({
          'token': token,
          'error': error,
          'info': info.msg,
          'user': user
        });
      });
    } else {
      res.status(404).json({
        'error': error,
        'info': info.msg,
        'user': user
      });
    }
  })(req, res);
};

module.exports = authController;