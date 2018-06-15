const axios = require('axios');

exports.seed = function (knex, Promise) {
    // Inserts seed entries
    return axios.get('https://api.coinmarketcap.com/v2/listings/')
        .then(function (response) {
            const coins = [];
            console.log(response.data);
            return knex
                .select('coinmarketcap_id')
                .from('coin')
                .then(function (existing_ids) {
                    const coinmarketcap_ids = existing_ids.map(coin => coin.coinmarketcap_id);
                    console.log('coin ids in db:');
                    console.log(coinmarketcap_ids);
                    return Promise.all(response.data.data.map(function (coin) {
                        if (coinmarketcap_ids.indexOf(coin.id) > -1) {    // coin already in DB
                            return true;
                        } else {    // new coin
                            const empty_source = {
                                name: null,
                                link: null
                            };
                            const insert_coin = {};
                            return knex('source')
                                .insert([empty_source, empty_source, empty_source, empty_source, empty_source])
                                .returning('id')
                                .then(function (ids) {
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
                                    coins.push(insert_coin);
                                });
                        }
                    })).then(function () {
                        console.log('insert coins:');
                        console.log(coins);
                        return knex('coin').insert(coins);
                    });
                });
        })
        .catch(function (error) {
            console.log(error);
        });
}