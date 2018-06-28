

import { app, server } from "./utils/init-app";
import LoginRouter from "./utils/login";
import * as express from "express";
const text2png = require('text2png');
const fs = require('fs');
const path = require('path');

import CoinRouter from "./routers/CoinRouter";
import NewsRouter from "./routers/NewsRouter";
import PriceRouter from "./routers/PriceRouter";
import UserRouter from "./routers/UserRouter";

import CoinService from "./services/CoinService";
import NewsService from "./services/NewsService";
import PriceService from "./services/PriceService";
import UserService from "./services/UserService";

const coinService = new CoinService();
const newsService = new NewsService();
const priceService = new PriceService();
const userService = new UserService();

import cron = require('cron');
const CoinPriceUpdate = require("./cron/coin-price-update");
const CoinInfosUpdate = require("./cron/coin-infos-update");
const PriceUpdate = require("./cron/price-update");
const NewsUpdate = require("./cron/news-update");

var CronJob = cron.CronJob;

if (process.env.CRON_COIN_PRICE === "true") {
    new CoinPriceUpdate();   // dev only
    // every hour
    // new CronJob('0 10 * * * *', function () { new CoinPriceUpdate(); }, function () { }, true, 'America/Los_Angeles');
}
if (process.env.CRON_COIN_INFOS === "true") {
    new CoinInfosUpdate();   // dev only
    // once a day
    // new CronJob('0 30 0 * * *', function () { new CoinInfosUpdate(); }, function () { }, true, 'America/Los_Angeles');
}
if (process.env.CRON_PRICE === "true") {
    new PriceUpdate();   // dev only
    // every hour
    new CronJob('0 50 * * * *', function () { new PriceUpdate(); }, function () { }, true, 'America/Los_Angeles');
}
if (process.env.CRON_NEWS === "true") {
    new NewsUpdate();   // detects new news automatically
}

const chart = fs.readFileSync('./public/chart.html', "utf8");

app.use('/chart/*', function (req, res) {
    const symbol = req.params[0].toUpperCase();
    if (symbol != '') {
        // console.log(symbol);
        res.send(chart.replace(/BTC/, symbol));
    }
    res.send('');
});

app.use('/icon', express.static('public/cryptocurrency-icons'));
app.use('/icon', function (req, res) {
    // TODO: check if coin exists?
    // TODO: move to front !!!
    const coinName = req.path.replace(/\//, '').replace(/\.png/, '').toUpperCase();
    const icon = text2png(' \n' + coinName + ' \n', { textColor: 'white', font: '70px Futura', padding: 60 });
    fs.writeFileSync('./public/cryptocurrency-icons/' + coinName + '.png', icon);
    // res.send(icon);
    res.sendFile(path.join(__dirname + '/../public/cryptocurrency-icons/' + coinName + '.png'));
});

app.use("/login", new LoginRouter().router());
app.use("/coin", new CoinRouter(coinService).router());
app.use("/news", new NewsRouter(newsService).router());
app.use("/price", new PriceRouter(priceService).router());
app.use("/user", new UserRouter(userService).router());

server.listen(8000);
// tslint:disable-next-line:no-console
console.log("server running on port 8000");
