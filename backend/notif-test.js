const axios = require('axios');
require('dotenv').config();

const ONESIGNAL_URI = "https://onesignal.com/api/v1/notifications";
const ONESIGNAL_APP_ID = "155944be-3bde-4703-82f1-2545b31dc1ed";
const ONESIGNAL_API_KEY = process.env.ONESIGNAL_API_KEY;

// console.log(ONESIGNAL_API_KEY);

const args = process.argv;
// console.log(args);

const notification_message = (args.length > 2) ? args.splice(2).join(' ') : 'notification test';

// console.log(notification_message);

const headers = {
    "Content-Type": "application/json",
    Authorization: `Basic ${ONESIGNAL_API_KEY}`
};

const config = {
    headers
};

var message = {
    app_id: ONESIGNAL_APP_ID,
    headings: { "en": 'CoinMarketNews - News alert' },
    contents: { "en": notification_message },
    ios_badgeType: 'Increase',
    ios_badgeCount: 1,
    // buttons:[{"id": "read-more-button", "text": "Read more", "icon": "http://i.imgur.com/MIxJp1L.png", "url": "https://www.google.com.hk/search?q=onesignal"}],
    url: 'https://www.google.com.hk/search?q=onesignal',
    filters: [
        {"field": "tag", "key": "user_id", "relation": "=", "value": 133},
        //{ "operator": "OR" }, { "field": "tag", "key": "user_id", "relation": "=", "value": 133 }
    ]
};

axios.post(ONESIGNAL_URI, message, config)
    .then(function (response) {
        console.log('notification sent: ' + notification_message);
        // console.log(response);
    })
    .catch(function (error) {
        console.log('error: ' + error);
    });