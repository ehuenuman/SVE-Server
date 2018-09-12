const passport = require('../config/passport');

const loginController = {};

loginController.loginUser = passport.authenticate('local', (req, res, next) => {
  req.session.save((err) => {
    console.log(err);
      if (err) {
        return next(err);
      }
      res.redirect('/');
  });
});

module.exports = loginController;