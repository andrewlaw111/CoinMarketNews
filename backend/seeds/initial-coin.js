const axios = require('axios');

exports.seed = function (knex, Promise) {
    // Inserts seed entries
    return axios.get('https://api.coinmarketcap.com/v2/listings/')
        .then(function (response) {
            const coins = [];
            console.log(response.data);
            return Promise.all(response.data.data.map(function (coin) {
                const empty_source = {
                    name: null,
                    link: null
                };
                const insert_coin = {};
                return knex('source')
                    .insert([empty_source, empty_source, empty_source, empty_source, empty_source])
                    .returning('id')
                    .then(function (ids) {
                        console.log(ids);
                        if (ids && ids.length == 5) {
                            insert_coin.official_website = ids[0];
                            insert_coin.medium = ids[1];
                            insert_coin.reddit = ids[2];
                            insert_coin.twitter = ids[3];
                            insert_coin.telegram = ids[4];
                        }
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
                    });
            })).then(function () {
                return knex('coin').insert(coins);
            })
        })
        .catch(function (error) {
            console.log(error);
        });
}