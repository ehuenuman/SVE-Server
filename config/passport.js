const passport = require('passport');
const LocalStrategy = require('passport-local').Strategy;

// Configure passport.js to use the local strategy
passport.use('local', new LocalStrategy(
  { 
    usernameField: 'username',
    passwordField: 'password',
    passReqToCallback: true
  },
  (username, password, done) => {
    console.log('Inside local strategy callback');
    connection.query('call loginUser(' + username + ',' + password + ')', function (error, rows) {      
      console.log(error);
      if (error) {
          return done(error);  
      }
      if (!rows.length) {
        console.log('Usuario no existe');
        return done(null, false);
      }
      if (!(rows[0].password == password)) {
        console.log('Error de contraseña');
        return done(null, false);
      }
      console.log('Usuario correcto');
      return done(null, rows[0]);
    });
  }
));

// Tell passport how to serialize the user
passport.serializeUser((user, done) => {
  console.log('Inside serializeUser callback. User id is save to session file store here.');
  done(null, user.id);
});

passport.deserializeUser((id, done) => {
  console.log('Inside deserializeUser callback')
  console.log(`The user id passport saved in the session file store is: ${id}`)
  connection.query('call deserializeUser(' + id + ')', function(error, rows) {
    done(error, rows[0]);
  });
});



module.exports = passport;