const express = require('express');

const exampleRoutes = require('./app/routes/example');

const app = express();

app.use('/', exampleRoutes);
app.listen(8080);

console.log('Service running at http://localhost:8080');
