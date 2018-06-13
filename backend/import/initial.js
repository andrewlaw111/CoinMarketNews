const NODE_ENV = process.env.NODE_ENV || 'development';
const knexfile = require('../knexfile')[NODE_ENV]
const knex = require('knex')(knexfile);
const axios = require('axios');

axios.get('https://api.coinmarketcap.com/v2/listings/')
    .then(function (response) {
        console.log(response.data);
        for (coin of response.data.data) {
            console.log(coin);
            const insert_coin = {};
            insert_coin.coinmarketcap_id = coin.id;
            insert_coin.name = coin.name;
            insert_coin.symbol = coin.symbol;
            knex('coin')
                .insert(insert_coin)
                .then(() => {
                    console.log(coin.name + 'inserted');
                })
        }
    })
    .catch(function (error) {
        console.log(error);
    });