const axios = require('axios');

var knex = require('knex')({
    client: 'postgresql',
    connection: {
        host: 'localhost',
        database: "postgres",
        user: "postgres",
        password: "password"
    }
});

knex.select()
    .from("currency")
    .limit(1)      // !!! TO REMOVE !!!
    .then((currencies) => {
        console.log(currencies);
        knex('coin').count()
            .then((coins) => {
                console.log(coins);
                const num_cryptocurrencies =  parseInt(coins[0].count);
                console.log(num_cryptocurrencies);
                const limit = 100;
                let start = 1;
                while (start < num_cryptocurrencies) {
                    for (const currency of currencies) {
                        const url = `https://api.coinmarketcap.com/v2/ticker/?convert=${currency.symbol}&start=${start}&limit=${limit}&structure=array`;
                        console.log(url);
                        axios.get(url)
                            .then(function (response) {
                                console.log(response.data.data);
                                for (const price of response.data.data) {
                                    console.log(price);
                                    const price_update = price.quotes[currency.symbol];
                                    console.log(price_update);
                                    // price_update.volume_24h = parseInt(price_update.volume_24h);
                                    // price_update.market_cap = parseInt(price_update.market_cap);
                                    knex('price')
                                        .where({ coinmarketcap_id: price.id, currency_id: currency.id })
                                        .update(price_update).then((data) => {
                                            if (data) {
                                                console.log(price.name + '/' + currency.symbol + ' updated');
                                            }
                                        });
                                }
                            })
                            .catch(function (error) {
                                console.log(error);
                            });
                    }
                    // start = start + limit;
                    start = start + num_cryptocurrencies;   // !!! TO REMOVE !!!
                }
            });
    });