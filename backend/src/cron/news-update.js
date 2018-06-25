const RssFeedEmitter = require('rss-feed-emitter');
const sanitizeHtml = require('sanitize-html');
const axios = require('axios');
import { knex } from '../utils/init-app';

const ONESIGNAL_URI = "https://onesignal.com/api/v1/notifications";
const ONESIGNAL_APP_ID = "155944be-3bde-4703-82f1-2545b31dc1ed";
const ONESIGNAL_API_KEY = process.env.ONESIGNAL_API_KEY;

const headers = {
    "Content-Type": "application/json",
    Authorization: `Basic ${ONESIGNAL_API_KEY}`
};

const config = {
    headers
};

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
                // TODO: test date of news (only insert recent news)
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
                                                        // send push notif
                                                        news_alert(news, coin_id);
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
                                            }
                                        });
                                });
                        }
                    });
            });
        });

    function news_alert(news, coin_id); {
        knex
            .select('user_id')
            .from('news_alert')
            .where('coin_id', '=', coin_id)
            .andWhere('favorite', '=', true)
            .then(function (ids) {
                console.log(ids);
                const notification_title = 'CoinMarketNews - ' + alert.symbol + ' news alert';
                const notification_message = news.title;

                console.log(notification_message);

                var message = {
                    app_id: ONESIGNAL_APP_ID,
                    headings: { "en": notification_title },
                    contents: { "en": notification_message },
                    url: news.link,
                    included_segments: ["All"]  // TODO: add all ids
                };
                axios.post(ONESIGNAL_URI, message, config)
                    .then(function (response) {
                        console.log('notification sent: ' + notification_message);
                    })
                    .catch(function (error) {
                        console.log('error: ' + error);
                    });
            })
    }
}