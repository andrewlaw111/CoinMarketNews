const RssFeedEmitter = require('rss-feed-emitter');
const sanitizeHtml = require('sanitize-html');
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

let feeder = new RssFeedEmitter();

feeder.add({
    url: 'https://cointelegraph.com/rss',
    refresh: 2000
});

feeder.add({
    url: 'https://www.newsbtc.com/feed/',
    refresh: 2000
});

// feeder.list();

feeder.on('new-item', function (item) {
    // TODO: test date of news
    knex('news')
        .where('link', '=', item.link.trim())  // TOTO: add index to link
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
                            knex("news")
                                .insert(news)
                                .then((insert_ok) => {
                                    if (insert_ok) {
                                        console.log('news added to DB');
                                        // TODO: add tag + push notif
                                    }
                                });
                        }
                    });
            }
        });
})