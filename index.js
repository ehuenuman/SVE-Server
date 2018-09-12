// npm modules
const express = require('express');
const morgan = require('morgan');
const uuid = require('uuid/v4');
const cookieParser = require('cookie-parser');
const session = require('express-session');
const FileStore = require('session-file-store')(session);
//const passport = require('passport');
//const LocalStrategy = require('passport-local').Strategy;

// Passport configuration
//require('./config/passport')(passport);
//global.passport = require('./config/passport');
const passport = require('./config/passport');

// Create server
const app = express();

// Settings
app.set('port', process.env.PORT || 80); 

// Middlewares
app.use(morgan('dev'));
app.use(express.urlencoded({ extended: false }));
app.use(express.json());
app.use(session({
  genid: (req) => {
    console.log('Inside the session middleware');
    console.log(req.sessionID);
    return uuid();
  },
  store: new FileStore(),
  secret: 'mota floja',
  resave: false,
  saveUninitialized: true
}));
app.use(passport.initialize());
app.use(passport.session());

// Routes
app.get('/', (req, res) => {
  console.log('Inside the homepage callback function');
  console.log(req.sessionID);
  res.send('You hit home page!');
});
app.use('/auth', require('./routes/login.routes'));
app.use('/api/structure', require('./routes/structure.routes'));
app.use('/api/sensor', require('./routes/sensor.routes'));

// Database connection
global.connection = require('./config/database');

// Starting the server
app.listen(app.get('port'), () => {
  console.log('Server on port', app.get('port'));
});