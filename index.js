const express = require('express');
const morgan = require('morgan');
const app = express();

global.connection = require('./database');

// Settings
app.set('port', process.env.PORT || 80); 

// Middlewares
app.use(morgan('dev'));
app.use(express.json());

// Routes
app.use('/api/structure', require('./routes/structure.routes'));

// Starting the server
app.listen(app.get('port'), () => {
    console.log('Server on port', app.get('port'));
});