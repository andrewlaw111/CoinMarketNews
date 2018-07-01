const axios = require('axios');
const Queue = require('better-queue');
import { knex } from '../utils/init-app';

module.exports = () => {
    console.log('CoinInfosUpdate2 CRON start -------');

    let q = new Queue(function (p, callback) {
        axios.get(p.url)
            .then(function (r) {
                r.data.coin = p.coin;
                callback(null, r.data);
            })
            .catch(function (error) {
                console.log(error);
            });
    }, { afterProcessDelay: 10000 });   // delay 10 sec between tasks

    axios.get('https://api.coinmarketcap.com/v2/listings/')
        .then(function (response) {
            response.data.data.map(function (coin) {
                const url = 'https://coincheckup.com/data/prod/201806301104/assets/' + coin.website_slug + '.json';
                knex('coin')
                    .whereNull('whitepaper_link')
                    .andWhere('coinmarketcap_id', '=', coin.id)
                    .then((exists) => {
                        // console.log(exists);
                        if (exists.length === 1) {
                            // console.log(url);
                            q.push({ url: url, coin: coin })
                                .on('finish', function (data) {
                                    // console.log(data);
                                    const whitepaper_link = (data && data.research && data.research.whitepaper_url) ? data.research.whitepaper_url : '';
                                    const update_coin = {};
                                    if (whitepaper_link != '' && whitepaper_link != 'n/a') {
                                        update_coin.whitepaper_name = (whitepaper_link.substr(-4) == '.pdf') ? 'whitepaper.pdf' : 'whitepaper.html';
                                        update_coin.whitepaper_link = whitepaper_link;
                                        console.log(update_coin);
                                        knex('coin')
                                            .where('coinmarketcap_id', '=', data.coin.id)
                                            .update(update_coin).then((res) => {
                                                if (res) {
                                                    console.log(data.coin.name + ' infos updated');
                                                }
                                            });
                                    } else {
                                        update_coin.whitepaper_link = 'n/a';
                                        console.log(update_coin);
                                        knex('coin')
                                            .where('coinmarketcap_id', '=', data.coin.id)
                                            .update(update_coin).then((res) => {
                                                if (res) {
                                                    console.log(data.coin.name + ' n/a');
                                                }
                                            });
                                    }
                                })
                                .on('failed', function (error) {
                                    console.log('task faild');
                                });
                        } else {
                            // console.log('already');
                        }
                    })
            });
        })
        .catch(function (error) {
            console.log(error);
        });

}