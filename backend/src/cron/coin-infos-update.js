const Crawler = require("crawler");
import { knex } from '../utils/init-app';

module.exports = () => {
    console.log('CoinInfosUpdate CRON start -------');
    var c = new Crawler({
        maxConnections: 1,
        rateLimit: 10000, // 1 query every 10 seconds
        userAgent: 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.87 Safari/537.36',
        referer: 'https://coinlib.io/',
        retries: 1,
        // This will be called for each crawled page
        callback: function (error, res, done) {
            if (error) {
                console.log(error);
            } else {
                var $ = res.$;

                if ($.html().includes('captcha-bypass') || $.html().includes('This IP has been blocked')) {
                    // console.log($.html());
                    console.log('captcha or IP blocked !!!');
                    process.exit();

                } else {
                    const update_coin = {};
                    // console.log($.html());
                    console.log('-----');

                    const about = $('.coin-description').clone().children('strong, a').remove().end().text().trim();
                    if (about != '') {
                        update_coin.about = about;
                    } else {
                        const about2 = $('.coin-description').text().trim();
                        if (about2 != '') {
                            update_coin.about = about2;
                        }
                    }

                    // infos
                    for (let i = 0; i < $('#info div.col-6').length;) {
                        const k = $('#info div.col-6').eq(i).text().trim();
                        const v = $('#info div.col-6').eq(i + 1).text().trim();
                        if (k == 'Type') {
                            update_coin.type = v;
                        } else if (k == 'Algorithm') {
                            update_coin.algorithm = v;
                        } else if (k == 'Proof') {
                            update_coin.proof = v;
                        } else if (k == 'Mineable') {
                            update_coin.mineable = (v == 'Yes') ? true : false;
                        } else if (k == 'Premined') {
                            update_coin.premined = (v == 'Yes') ? true : false;
                        }
                        i = i + 2;
                    }

                    // websites
                    if ($('#info i').eq(0).hasClass('fa-link')) {   // official_website
                        update_coin.website_name = $('#info a').eq(0).text().trim();
                        update_coin.website_link = $('#info a').eq(0).attr('href').trim();
                    }
                    $('#info a').each(function () {
                        const link = $(this).attr('href').trim();
                        // console.log(link);
                        if (link.match(/reddit\.com/)) {
                            update_coin.reddit_name = $(this).text().trim();
                            update_coin.reddit_link = link;
                        } else if (link.match(/twitter\.com/)) {
                            update_coin.twitter_name = $(this).text().trim();
                            update_coin.twitter_link = link;
                        } else if (link.match(/t\.me/) || link.match(/telegram/)) {
                            update_coin.telegram_name = $(this).text().trim();
                            update_coin.telegram_link = link;
                        } else if (link.match(/medium\.com/)) {
                            update_coin.medium_name = $(this).text().trim();
                            update_coin.medium_link = link;
                        }
                    });

                    console.log(update_coin);

                    if (Object.keys(update_coin).length !== 0) {
                        knex('coin')
                            .where('id', '=', res.options.coin.id)
                            .update(update_coin).then((data) => {
                                if (data) {
                                    console.log(res.options.coin.name + ' infos updated');
                                }
                            });
                    } else {
                        console.log('NO INFO for ' + res.options.coin.name + ' !!!');
                    }

                }
            }
            done();
        }
    });

    knex.select()
        .from("coin")
        .whereNull('type')
        .orderBy('rank', 'asc')
        .then((coins) => {
            console.log(coins);

            const coin_fix = [];    // manually fix URL problems
            coin_fix['MIOTA'] = 'IOT';
            coin_fix['VEN'] = 'VET';
            coin_fix['WICC'] = 'WICEXT';

            for (let coin of coins) {
                if (coin.symbol in coin_fix) {
                    coin.symbol = coin_fix[coin.symbol];
                }
                const url = 'https://coinlib.io/coin/' + coin.symbol + '/';
                console.log(url);
                c.queue({
                    uri: url,
                    coin: coin
                });
            }
        });
}