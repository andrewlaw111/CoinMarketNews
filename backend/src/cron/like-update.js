const axios = require('axios');
const Queue = require('better-queue');
import { knex } from '../utils/init-app';

module.exports = () => {
    console.log('LikeUpdate CRON start -------');

    let q = new Queue(function (news, callback) {
        axios.get('https://graph.facebook.com/?id=' + news.link)
            .then(function (response) {
                response.news = news;
                callback(null, response);
            })
            .catch(function (error) {
                console.log(error);
            });
    }, { afterProcessDelay: 5000 });   // delay 5 sec between tasks

    knex.select('id', 'link')
        .from("news")
        .orderBy('id', 'desc')
        .limit(50)
        .then((news) => {
            for (const n of news) {
                // console.log(n);
                q.push(n)
                    .on('finish', function (json) {
                        const news = {};
                        if (json.data.share.share_count) {
                            knex('news')
                                .where({ id: json.news.id })
                                .update({ counter: json.data.share.share_count }).then((data) => {
                                    if (data) {
                                        // console.log(json.news.id + ' counter updated : ' + json.data.share.share_count);
                                    }
                                });
                        }
                    })
                    .on('failed', function (error) {
                        console.log('task faild');
                    })
            }
        })
        .catch(function (error) {
            console.log(error);
        });
}