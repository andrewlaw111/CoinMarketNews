const axios = require('axios');

const currency_list = [{
    fiat: true,
    symbol: "USD",
}, {
    fiat: true,
    symbol: "EUR",
}, {
    fiat: false,
    symbol: "BTC",
}, {
    fiat: false,
    symbol: "ETH",
}, {
    fiat: false,
    symbol: "LTC",
}];

exports.seed = function (knex, Promise) {
    return knex('currency').del()
        .then(() => {
            return knex("currency")
                .insert(currency_list)
                .returning('id');
        })
        .then((currencies) => {
            return axios.get('https://api.coinmarketcap.com/v2/listings/')
                .then(function (response) {
                    const coins = [];
                    // console.log(response.data);
                    return knex
                        .select('coinmarketcap_id')
                        .from('coin')
                        .then(function (existing_ids) {
                            const coinmarketcap_ids = existing_ids.map(existing_id => existing_id.coinmarketcap_id);
                            console.log('coin ids in db:');
                            console.log(coinmarketcap_ids);
                            return Promise.all(response.data.data.map(function (coin) {
                                if (coinmarketcap_ids.indexOf(coin.id) > -1) { // coin already in DB
                                    return true;
                                } else { // new coin
                                    const empty_source = {
                                        name: null,
                                        link: null
                                    };
                                    return knex('source')
                                        .insert([empty_source, empty_source, empty_source, empty_source, empty_source])
                                        .returning('id')
                                        .then(function (ids) {
                                            const insert_coin = {};
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
                                return knex('coin')
                                    .insert(coins)
                                    .returning('coinmarketcap_id')
                                    .then(function (new_coins) {
                                        console.log(new_coins);
                                        const insert_price = [];
                                        for (const currency of currencies) {
                                            console.log('currency');
                                            console.log(currency);
                                            for (const new_coin of coins) {
                                                insert_price.push({
                                                    coinmarketcap_id: new_coin.coinmarketcap_id,
                                                    currency_id: currency
                                                });
                                            }
                                        }
                                        console.log(insert_price);
                                        return knex('price')
                                            .insert(insert_price)
                                            .then(function (data) {
                                                if (data) {
                                                    console.log('insert price');
                                                }
                                            })
                                    })
                            });
                        });
                })
                .catch(function (error) {
                    console.log(error);
                });
        });
}