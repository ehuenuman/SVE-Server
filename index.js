const express = require('express');
const morgan = require('morgan');
const app = express();

// Settings
app.set('port', process.env.PORT || 80); 

// Middlewares
app.use(morgan('dev'));
app.use(express.json());

// Routes
app.use('/api/structure', require('./routes/structure.routes'));

// Database connection
global.connection = require('./database');

// Starting the server
app.listen(app.get('port'), () => {
    console.log('Server on port', app.get('port'));
});