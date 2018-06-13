const axios = require('axios');

exports.seed = function (knex, Promise) {
    // Deletes ALL existing entries
    return knex('coin').del()
        .then(function () {
            // Inserts seed entries
            return axios.get('https://api.coinmarketcap.com/v2/ticker/?structure=array')
                .then(function (response) {
                    const coins = [];
                    console.log(response.data);
                    for (coin of response.data.data) {
                        const insert_coin = {};
                        insert_coin.coinmarketcap_id = coin.id;
                        insert_coin.name = coin.name;
                        insert_coin.symbol = coin.symbol;
                        insert_coin.rank = coin.rank;
                        // insert_coin.circulating_supply = coin.circulating_supply;
                        // insert_coin.total_supply = coin.total_supply;
                        // insert_coin.max_supply = coin.max_supply;
                        //insert_coin.last_updated = coin.last_updated;
                        console.log(insert_coin);
                        // "id": 1, 
                        // "name": "Bitcoin", 
                        // "symbol": "BTC", 
                        // "website_slug": "bitcoin", 
                        // "rank": 1, 
                        // "circulating_supply": 17090600.0, 
                        // "total_supply": 17090600.0, 
                        // "max_supply": 21000000.0, 
                        // "quotes": {
                        //     "USD": {
                        //         "price": 6564.82, 
                        //         "volume_24h": 4547920000.0, 
                        //         "market_cap": 112196712692.0, 
                        //         "percent_change_1h": -0.59, 
                        //         "percent_change_24h": -4.5, 
                        //         "percent_change_7d": -13.87
                        //     }
                        // }, 
                        // "last_updated": 1528877972
                        coins.push(insert_coin);
                    }
                    return knex('coin').insert(coins);
                })
                .catch(function (error) {
                    console.log(error);
                });

        });
};
