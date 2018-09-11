// npm modules
const express = require('express');
const morgan = require('morgan');
const uuid = require('uuid/v4');
const session = require('express-session');

// Create server
const app = express();

// Settings
app.set('port', process.env.PORT || 80); 

// Middlewares
app.use(morgan('dev'));
app.use(express.json());
app.use(session({
  genid:  (req) => {
    console.log('Inside the session middleware');
    console.log(req.sessionID);
    return uuid();
  },
  secret: 'mota floja',
  resave: false,
  saveUninitialized: true
}));

// Routes
app.get('/', (req, res) => {
  console.log('Inside the homepage callback function');
  console.log(req.sessionID);
  //console.log(uniqueId);
  res.send('Ypu hit home page!');
});
app.use('/api/structure', require('./routes/structure.routes'));
app.use('/api/sensor', require('./routes/sensor.routes'));

// Database connection
global.connection = require('./config/database');

// Starting the server
app.listen(app.get('port'), () => {
  console.log('Server on port', app.get('port'));
});