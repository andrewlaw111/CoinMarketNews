const axios = require('axios');
const Queue = require('better-queue');
import { knex } from '../utils/init-app';

module.exports = () => {
    console.log('PriceUpdate CRON start -------');

    let q = new Queue(function (p, callback) {
        console.log('Fetching price: ' + p.start);
        const url = `https://api.coinmarketcap.com/v2/ticker/?convert=${p.currency.symbol}&start=${p.start}&limit=${p.limit}&structure=array`;
        console.log(url);
        axios.get(url)
            .then(function (response) {
                callback(null, response);
            })
            .catch(function (error) {
                console.log(error);
            });
    }, { afterProcessDelay: 10000 });   // delay 10 sec between tasks

    knex.select()
        .from("currency")
        .then((currencies) => {
            console.log(currencies);
            return knex('coin').count()
                .then((coins) => {
                    //console.log(coins);
                    const num_cryptocurrencies = parseInt(coins[0].count);
                    console.log(num_cryptocurrencies);
                    const limit = 100;
                    let start = 1;
                    while (start < num_cryptocurrencies) {
                        for (const currency of currencies) {
                            q.push({ start: start, limit: limit, currency: currency })
                                .on('finish', function (response) {
                                    // console.log(response.data.data);
                                    for (const price of response.data.data) {
                                        // console.log(price);
                                        const price_update = price.quotes[currency.symbol];
                                        // console.log(price_update);
                                        knex('price')
                                            .where({ coinmarketcap_id: price.id, currency_id: currency.id })
                                            .update(price_update).then((data) => {
                                                if (data) {
                                                    //console.log(price.name + '/' + currency.symbol + ' updated');
                                                }
                                            });
                                    }
                                    console.log(currency.symbol + ' price updated');
                                })
                                .on('failed', function (error) {
                                    console.log('task faild');
                                })
                        }
                        start = start + limit;
                    }
                });
        })
        .catch(function (error) {
            console.log(error);
        });
}