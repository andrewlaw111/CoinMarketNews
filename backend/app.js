const express = require('express');

const NODE_ENV = process.env.NODE_ENV;
const knexfile = require('./knexfile')[NODE_ENV]
var knex = require('knex')(knexfile);

const app = express();

app.get('/', function (req, res) {
    knex.select('*').from('users').then((data) => {
        console.log(data);
        res.send(data);
    });
});

app.listen(8080);