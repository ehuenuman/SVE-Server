const passport = require("passport");
const LocalStrategy = require("passport-local").Strategy;
const bcrypt = require('bcrypt-nodejs');

// Configure passport.js to use the local strategy
passport.use("login", new LocalStrategy(
  { 
    usernameField: "username",
    passwordField: "password",
    passReqToCallback: true
  },
  (req, username, password, done) => {
    console.log("Inside local strategy callback");    
    connection.query("call loginUser('"+username+"')", function (error, rows) {       
      if (error) {
        console.log("Error DB");
        return done(error);  
      }
      if (!rows[0].length) {
        console.log("Usuario no existe");
        return done(null, false);
      }
      if (!(bcrypt.compareSync(password, rows[0][0].password))) {
        console.log("Error de contraseña");
        return done(null, false);
      }
      console.log("Usuario correcto");
      const user =rows[0][0];
      return done(null, user);
    });
  }
));

// Tell passport how to serialize the user
passport.serializeUser((user, done) => {
  console.log("Inside serializeUser callback. User id is save to session file store here.");
  done(null, user.user_id);
});

passport.deserializeUser((id, done) => {
  console.log("Inside deserializeUser callback")
  console.log(`The user id passport saved in the session file store is: ${id}`)
  connection.query("call deserializeUser(" + id + ")", function(error, rows) {
    done(error, rows[0][0]);
  });
});

module.exports = passport;