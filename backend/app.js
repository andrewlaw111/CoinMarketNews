const express = require('express');
var knex = require('knex')({
    client: 'postgresql',
    connection: {
        host: 'db',
        database: "postgres",
        user: "postgres",
        password: "password"
    }
});

const app = express();

knex.schema.createTable('user', (table) => {
    table.increments('id')
    table.string('name')
})
    .then(() => {
        knex('user')
            .insert({ name: 'Andrew' })
            .then(() => {
                console.log('insert done');
            })
    })

app.get('/', function (req, res) {
    knex.select('*').from('user').then((data) => {
        console.log(data);
        res.send(data);
    });
});

app.listen(8080);