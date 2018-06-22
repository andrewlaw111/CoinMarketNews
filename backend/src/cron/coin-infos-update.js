const Crawler = require("crawler");
import { knex } from '../utils/init-app';

module.exports = () => {
    console.log('CoinInfosUpdate CRON start -------');
    var c = new Crawler({
        maxConnections: 2,
        // This will be called for each crawled page
        callback: function (error, res, done) {
            if (error) {
                console.log(error);
            } else {
                var $ = res.$;
                const update_coin = {};

                console.log('-----');

                update_coin.about = $('.coin-description').clone().children('strong, a').remove().end().text().trim();

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
                    const update_source = {};
                    update_source.name = $('#info a').eq(0).text().trim();
                    update_source.link = $('#info a').eq(0).attr('href').trim();
                    updateSource(res.options.coin.official_website, update_source);
                }
                $('#info a').each(function () {
                    const link = $(this).attr('href').trim();
                    console.log(link);
                    if (link.match(/reddit\.com/)) {
                        const update_source = {};
                        update_source.name = $(this).text().trim();
                        update_source.link = link;
                        updateSource(res.options.coin.reddit, update_source);
                    } else if (link.match(/twitter\.com/)) {
                        const update_source = {};
                        update_source.name = $(this).text().trim();
                        update_source.link = link;
                        updateSource(res.options.coin.twitter, update_source);
                    } else if (link.match(/t\.me/) || link.match(/telegram/)) {
                        const update_source = {};
                        update_source.name = $(this).text().trim();
                        update_source.link = link;
                        updateSource(res.options.coin.telegram, update_source);
                    } else if (link.match(/medium\.com/)) {
                        const update_source = {};
                        update_source.name = $(this).text().trim();
                        update_source.link = link;
                        updateSource(res.options.coin.medium, update_source);
                    }
                });

                console.log(update_coin);

                knex('coin')
                    .where('id', '=', res.options.coin.id)
                    .update(update_coin).then((data) => {
                        if (data) {
                            console.log(res.options.coin.name + ' infos updated');
                        }
                    });
            }
            done();
        }
    });

    knex.select()
        .from("coin")
        .offset(0)
        .limit(3)
        .orderBy('rank', 'asc')
        .then((coins) => {
            console.log(coins);
            for (let coin of coins) {
                if (coin.symbol == 'MIOTA') {
                    coin.symbol = 'IOT';
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
function updateSource(source_id, source) {
    knex('source')
        .where('id', '=', source_id)
        .update(source).then((data) => {
            if (data) {
                console.log(source.name + ' source updated');
            }
        });
}