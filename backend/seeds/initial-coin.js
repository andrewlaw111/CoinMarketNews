const axios = require('axios');

exports.seed = function (knex, Promise) {
    // Deletes ALL existing entries
    return knex('coin').del()
        .then(function () {
            // Inserts seed entries
            return axios.get('https://api.coinmarketcap.com/v2/listings/')    
                .then(function (response) {
                    const coins = [];
                    console.log(response.data);
                    for (coin of response.data.data) {
                        const insert_coin = {};
                        insert_coin.coinmarketcap_id = coin.id;
                        insert_coin.name = coin.name;
                        insert_coin.symbol = coin.symbol;
                        // {
                        //     "id": 1, 
                        //     "name": "Bitcoin", 
                        //     "symbol": "BTC", 
                        //     "website_slug": "bitcoin"
                        // }

                        console.log(insert_coin);
                        coins.push(insert_coin);
                    }
                    return knex('coin').insert(coins);
                })
                .catch(function (error) {
                    console.log(error);
                });

        });
};
