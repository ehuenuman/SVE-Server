// npm modules
const express = require('express');
const morgan = require('morgan');
const uuid = require('uuid/v4');

// Create server
const app = express();

// Settings
app.set('port', process.env.PORT || 80); 

// Middlewares
app.use(morgan('dev'));
app.use(express.json());

// Routes
app.get('/', (req, res) => {
    //console.log(req);
    const uniqueId = uuid();
    //console.log(uniqueId);
    res.send('Hit home page. Recieved the unique id: ${uniqueId}');
});
app.use('/api/structure', require('./routes/structure.routes'));
app.use('/api/sensor', require('./routes/sensor.routes'));

// Database connection
global.connection = require('./config/database');

// Starting the server
app.listen(app.get('port'), () => {
    console.log('Server on port', app.get('port'));
});