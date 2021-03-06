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
    console.log('PriceAlert CRON start -------');

    price_alert('>');
    price_alert('<');

    function price_alert(lower_or_higher) {
        knex('price_alert')
            .join('users', 'price_alert.user_id', 'users.id')
            .join('price', function () {
                this.on('price_alert.coinmarketcap_id', '=', 'price.coinmarketcap_id').andOn('price_alert.currency_id', '=', 'price.currency_id')
            })
            .join('currency', 'price.currency_id', 'currency.id')
            .join('coin', 'price.coinmarketcap_id', 'coin.coinmarketcap_id')
            .select('price_alert.id', 'price_alert.user_id', 'coin.symbol as symbol', 'price_alert.price_point', 'price.price', 'currency.symbol as currency', 'currency.fiat')
            .where('users.notifications', '=', true)
            .andWhere('price_alert.active', '=', true)
            .andWhere('price_alert.upper', '=', (lower_or_higher === '>'))
            .andWhere('price.price', lower_or_higher, knex.raw('price_alert.price_point'))
            .then((alerts) => {
                // console.log(alerts);
                for (const alert of alerts) {
                    const price_point = (alert.fiat === true) ? parseInt(alert.price_point) : alert.price_point;
                    const price = (alert.fiat === true) ? parseInt(alert.price) : alert.price;

                    const notification_title = 'CoinMarketNews - ' + alert.symbol + ' price alert';
                    const notification_message = alert.symbol + ' ' + lower_or_higher + ' ' + price_point + ' ' + alert.currency + ': ' + price + ' ' + alert.currency;

                    var message = {
                        app_id: ONESIGNAL_APP_ID,
                        headings: { "en": notification_title },
                        contents: { "en": notification_message },
                        ios_badgeType: 'Increase',
                        ios_badgeCount: 1,
                        // included_segments: ["All"],
                        filters: [
                            { "field": "tag", "key": "user_id", "relation": "=", "value": alert.user_id }
                        ]
                    };

                    console.log(message);

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
                                        // console.log('alert ' + alert.id + ' desactivated');
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