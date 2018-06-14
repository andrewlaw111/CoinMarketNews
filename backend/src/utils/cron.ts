import cron = require('cron');
import axios from 'axios';
import { knex } from './init-app';
var CronJob = cron.CronJob;

export default class Cron {
    static price() {
        new CronJob('1 * * * * *', function () {
            console.log('cron price start');
            axios.get('https://api.coinmarketcap.com/v2/ticker/?structure=array')
                .then(function (response) {
                    // console.log(response.data);
                    for (const coin of response.data.data) {
                        const update_coin: any = {};
                        update_coin.rank = coin.rank;
                        update_coin.circulating_supply = (coin.circulating_supply !== null) ? parseInt(coin.circulating_supply) : null;
                        update_coin.total_supply = (coin.total_supply !== null) ? parseInt(coin.total_supply) : null;
                        update_coin.max_supply = (coin.max_supply !== null) ? parseInt(coin.max_supply) : null;
                        update_coin.last_updated = coin.last_updated;
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
                        // console.log(update_coin);
                        knex('coin')
                            .where('coinmarketcap_id', '=', coin.id)
                            .update(update_coin).then((data: any) => {
                                if(data) {
                                    // console.log(coin.name + ' infos updated');
                                }
                            });
                    }
                })
                .catch(function (error) {
                    console.log(error);
                });
        }, function () {
            console.log('cron price stop');
        },
            true, /* Start the job right now */
            'America/Los_Angeles'
        );
    }
}
