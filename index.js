// npm modules
const express = require('express');
const morgan = require('morgan');
const bodyParser = require('body-parser');

const passport = require('./config/passport');

// Create server
const app = express();

// Settings
app.set('port', process.env.LISTEN_PORT || 80);

// Middlewares
app.use(morgan('dev'));
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());
app.use(passport.initialize());

// Routes
app.use('/api/auth', require('./routes/auth.routes'));
app.use('/api/structure', require('./routes/structure.routes'));
app.use('/api/sensor', require('./routes/sensor.routes'));
app.use('/api/upload', require('./routes/upload.routes'));

app.use(function (err, req, res, next) {
  if (err.name === 'UnauthorizedError') {
    res.status(401);
    res.json({
      "msg": err.name + ": " + err.message
    });
  }
});

// Database connection
global.connection = require('./config/database');

// Starting the server
app.listen(app.get('port'), () => {
  console.log('Server on port', app.get('port'));
});