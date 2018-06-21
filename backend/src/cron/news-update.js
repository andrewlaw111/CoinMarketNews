const RssFeedEmitter = require('rss-feed-emitter');
const sanitizeHtml = require('sanitize-html');
const axios = require('axios');
import { knex } from '../utils/init-app';

module.exports = () => {
    console.log('NewsUpdate CRON start -------');

    knex.select('id', 'name', 'symbol')
        .from('coin')
        .orderBy('rank')
        .then((coins) => {
            let feeder = new RssFeedEmitter();

            feeder.add({
                url: 'https://cointelegraph.com/rss',
                refresh: 2000
            });

            feeder.add({
                url: 'https://www.newsbtc.com/feed/',
                refresh: 2000
            });

            feeder.add({
                url: 'https://feeds.feedburner.com/CoinDesk',
                refresh: 2000
            });

            feeder.add({
                url: 'https://www.ccn.com/feed',
                refresh: 2000
            });

            feeder.add({
                url: 'https://toshitimes.com/feed/',
                refresh: 2000
            });

            // feeder.list();

            feeder.on('new-item', function (item) {
                // TODO: test date of news
                knex('news')
                    .where('link', '=', item.link.trim())  // TOTO: add index to link IN DB
                    .then((data) => {
                        // console.log(data);
                        if (data.length > 0) {
                            console.log('news already in DB');
                        } else {
                            console.log();
                            console.log(item.title);
                            console.log(sanitizeHtml(item.description, { allowedTags: [] }));
                            console.log(item.link);
                            console.log(item.pubDate);
                            const news = {};
                            news.title = item.title.trim();
                            news.content = sanitizeHtml(item.description, { allowedTags: [] }).trim();
                            news.link = item.link.trim();
                            news.created_at = item.pubDate;
                            axios.get('https://graph.facebook.com/?id=' + news.link)
                                .then(function (json) {
                                    console.log(json.data);
                                    if (json) {
                                        news.counter = json.data.share.share_count;
                                    }
                                    knex("news")
                                        .insert(news)
                                        .returning('id')
                                        .then((insert_news_ok) => {
                                            if (insert_news_ok) {
                                                console.log('news added to DB');
                                                console.log(insert_news_ok);
                                                const coin_news = []
                                                coins.map(function (coin) {
                                                    if (news.title.includes(coin.name) || news.title.includes(coin.symbol)) {
                                                        coin_news.push({ coin_id: coin.id, news_id: insert_news_ok[0] });
                                                    }
                                                    // TODO: same for content ?
                                                });
                                                console.log(coin_news);
                                                if (coin_news.length > 0) {
                                                    knex("coin_news")
                                                        .insert(coin_news)
                                                        .returning('id')
                                                        .then((insert_coin_news_ok) => {
                                                            if (insert_coin_news_ok) {
                                                                console.log('coin news added to DB');
                                                                console.log(insert_coin_news_ok[0]);
                                                            }
                                                        });
                                                }
                                                // TODO: push notif
                                            }
                                        });

                                });
                        }
                    });
            });
        });
}