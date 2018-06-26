const axios = require('axios');
// import { knex } from '../utils/init-app';

var knex = require('knex')({
    client: 'postgresql',
    connection: {
        host: 'localhost',
        database: "postgres",
        user: "postgres",
        password: "password"
    }
});

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
    console.log('PriceAlert CRON start -------');

    price_alert('>');
    price_alert('<');

    function price_alert(lower_or_higher) {
        knex('price_alert')
            .join('price', 'price_alert.price_id', 'price.id')
            .join('currency', 'price.currency_id', 'currency.id')
            .join('coin', 'price.coinmarketcap_id', 'coin.coinmarketcap_id')
            .select('price_alert.id', 'coin.symbol as symbol', 'price_alert.price_point', 'price.price', 'currency.symbol as currency', 'currency.fiat')
            .where('price_alert.active', '=', true)
            .where('price_alert.upper', '=', (lower_or_higher === '>'))
            .andWhere('price.price', lower_or_higher, knex.raw('price_alert.price_point'))
            .then((alerts) => {
                console.log(alerts);
                for (const alert of alerts) {
                    const price_point = (alert.fiat === true) ? parseInt(alert.price_point) : alert.price_point;
                    const price = (alert.fiat === true) ? parseInt(alert.price) : alert.price;

                    const notification_title = 'CoinMarketNews - ' + alert.symbol + ' price alert';
                    const notification_message = alert.symbol + ' ' + lower_or_higher + ' ' + price_point + ' ' + alert.currency + ': ' + price + ' ' + alert.currency;

                    console.log(notification_message);

                    var message = {
                        app_id: ONESIGNAL_APP_ID,
                        headings: { "en": notification_title },
                        contents: { "en": notification_message },
                        ios_badgeType: 'Increase',
                        ios_badgeCount: 1,
                        included_segments: ["All"]  // TODO: add user.id
                    };

                    axios.post(ONESIGNAL_URI, message, config)
                        .then(function (response) {
                            console.log('notification sent: ' + notification_message);
                            // console.log(response);
                            const price_alert_update = {};
                            price_alert_update.active = false;
                            knex('price_alert')
                                .where({ id: alert.id })
                                .update(price_alert_update).then((data) => {
                                    if (data) {
                                        console.log('alert ' + alert.id + ' desactivated');
                                    }
                                });
                        })
                        .catch(function (error) {
                            console.log('error: ' + error);
                        });
                }
            });
    }
}