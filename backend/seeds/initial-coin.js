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
                        
                        // https://api.coinmarketcap.com/v2/ticker/?structure=array
                        // insert_coin.rank = coin.rank;
                        // insert_coin.circulating_supply = (coin.circulating_supply !== null) ? parseInt(coin.circulating_supply) : null;
                        // insert_coin.total_supply = (coin.total_supply !== null) ? parseInt(coin.total_supply) : null;
                        // insert_coin.max_supply = (coin.max_supply !== null) ? parseInt(coin.max_supply) : null;
                        // insert_coin.last_updated = coin.last_updated;
                        // {
                        //     "id": 1, 
                        //     "name": "Bitcoin", 
                        //     "symbol": "BTC", 
                        //     "website_slug": "bitcoin", 
                        //     "rank": 1, 
                        //     "circulating_supply": 17090637.0, 
                        //     "total_supply": 17090637.0, 
                        //     "max_supply": 21000000.0, 
                        //     "quotes": {
                        //         "USD": {
                        //             "price": 6569.15, 
                        //             "volume_24h": 4532520000.0, 
                        //             "market_cap": 112270958049.0, 
                        //             "percent_change_1h": -0.37, 
                        //             "percent_change_24h": -4.46, 
                        //             "percent_change_7d": -13.82
                        //         }
                        //     }, 
                        //     "last_updated": 1528879767
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
