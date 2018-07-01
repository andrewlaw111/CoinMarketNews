const axios = require('axios');

const currency_list = [
    {
        fiat: true,
        symbol: "USD",
    },
    {
        fiat: true,
        symbol: "EUR",
    },
    {
        fiat: true,
        symbol: "CAD",
    },
    {
        fiat: true,
        symbol: "GBP",
    },
    {
        fiat: true,
        symbol: "HKD",
    },
    {
        fiat: false,
        symbol: "BTC",
    },
    {
        fiat: false,
        symbol: "ETH",
    }
];

const news_source = [
    {
        name: 'Cointelegraph',
        link: 'https://cointelegraph.com',
        feed: 'https://cointelegraph.com/rss',
    },
    {
        name: 'NewsBTC',
        link: 'https://www.newsbtc.com',
        feed: 'https://www.newsbtc.com/feed/',
    },
    {
        name: 'CoinDesk',
        link: 'https://www.coindesk.com',
        feed: 'https://feeds.feedburner.com/CoinDesk',
    },
    {
        name: 'CCN',
        link: 'https://www.ccn.com',
        feed: 'https://www.ccn.com/feed',
    },
    {
        name: 'Toshi Times',
        link: 'https://toshitimes.com',
        feed: 'https://toshitimes.com/feed/',
    }
];

exports.seed = function (knex, Promise) {
    return knex('currency')
        .select('symbol')
        .then((currencies) => {
            currencies = currencies.map(row => row.symbol);
            const currency_list_insert = currency_list.filter(function (currency) {
                return !currencies.includes(currency.symbol);
            });
            console.log(currency_list_insert);
            return knex("currency")
                .insert(currency_list_insert)
                .then(() => {
                    return knex("currency")
                        .select('id')
                })

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
                            response.data.data.map(function (coin) {
                                if (coinmarketcap_ids.indexOf(coin.id) > -1) { // coin already in DB
                                    // do nothing
                                } else { // new coin
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
                                    coins.push(insert_coin);
                                }
                            });
                            console.log('insert coins:');
                            console.log(coins);
                            return knex('coin')
                                .insert(coins)
                                .returning('coinmarketcap_id')
                                .then(function (new_coins) {
                                    if (coins.length>0)
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
                                                console.log('price inserted');
                                            }
                                        });
                                });
                        });
                });
        })
        .then(function () {
            return knex('source')
                .select('feed')
                .then((sources) => {
                    sources = sources.map(row => row.feed);
                    const news_source_insert = news_source.filter(function (source) {
                        return !sources.includes(source.feed);
                    });
                    return knex("source")
                        .insert(news_source_insert)
                        .then(function (data) {
                            if (data) {
                                console.log('source inserted');
                                console.log(news_source_insert);
                            }
                        });
                });
        })
        .catch(function (error) {
            console.log(error);
        });
}