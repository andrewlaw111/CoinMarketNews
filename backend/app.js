const express = require('express');

const NODE_ENV = process.env.NODE_ENV || 'development';
const knexfile = require('./knexfile')[NODE_ENV]
var knex = require('knex')(knexfile);

const app = express();

console.log("(1/3) running [knex.migrate.latest()]");
knex.migrate.latest().then(function () {
    console.log("(2/3) running [knex.seed.run()]");
    return knex.seed.run();
}).then(function () {
    console.log("(3/3) app ready");

    app.get('/', function (req, res) {
        knex.select('*').from('users').then((data) => {
            console.log(data);
            res.send(data);
            console.log('ho');
        });
    });

    app.listen(8000);
});

