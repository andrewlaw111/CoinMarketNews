import * as express from "express";
import * as fs from "fs";
import * as  path from "path";
// tslint:disable-next-line:no-var-requires
const text2png = require("text2png");
import { app, knex, server } from "./utils/init-app";
import LoginRouter from "./utils/login";

import CoinRouter from "./routers/CoinRouter";
import NewsRouter from "./routers/NewsRouter";
import PriceRouter from "./routers/PriceRouter";
import UserRouter from "./routers/UserRouter";

import CoinService from "./services/CoinService";
import NewsService from "./services/NewsService";
import PriceService from "./services/PriceService";
import UserService from "./services/UserService";

const coinService = new CoinService(knex);
const newsService = new NewsService(knex);
const priceService = new PriceService();
const userService = new UserService();

import * as cron from "cron";
import * as CoinInfosUpdate from "./cron/coin-infos-update2";
import * as CoinPriceUpdate from "./cron/coin-price-update";
import * as LikeUpdate from "./cron/like-update";
import * as NewsUpdate from "./cron/news-update";
import * as PriceAlert from "./cron/price-alert";
import * as PriceUpdate from "./cron/price-update";

const CronJob = cron.CronJob;

if (process.env.CRON_COIN_PRICE === "true") {
    // new CoinPriceUpdate();   // dev only
    // every hour at 10 minutes
    // tslint:disable-next-line:no-unused-expression
    new CronJob("0 10 * * * *", () => {
        CoinPriceUpdate();
        // tslint:disable-next-line:no-empty
    }, () => {
    }, true, "America/Los_Angeles");
}
if (process.env.CRON_COIN_INFOS === "true") {
    CoinInfosUpdate();   // one shot
}
if (process.env.CRON_PRICE === "true") {
    // new PriceUpdate();   // dev only
    // every hour at 50 minutes
    // tslint:disable-next-line:no-unused-expression
    new CronJob("0 50 * * * *", () => {
        PriceUpdate();
        // tslint:disable-next-line:no-empty
    }, () => {
    }, true, "America/Los_Angeles");
}
if (process.env.CRON_PRICE_ALERT === "true") {
    // new PriceAlert();   // dev only
    // every hour at 15
    // tslint:disable-next-line:no-unused-expression
    new CronJob("0 15 * * * *", () => {
        PriceAlert();
        // tslint:disable-next-line:no-empty
    }, () => {
    }, true, "America/Los_Angeles");
}
if (process.env.CRON_LIKE === "true") {
    // new LikeUpdate();   // dev only
    // every 20 minutes at 30 sec
    // tslint:disable-next-line:no-unused-expression
    new CronJob("30 */20 * * * *", () => {
        LikeUpdate();
        // tslint:disable-next-line:no-empty
    }, () => {
    }, true, "America/Los_Angeles");
}
if (process.env.CRON_NEWS === "true") {
    NewsUpdate();   // detects new news automatically
}

// const chart = fs.readFileSync('./public/chart.html', "utf8");

// app.use('/chart/*', function (req, res) {
//     const symbol = req.params[0].toUpperCase();
//     if (symbol != '') {
//         // console.log(symbol);
//         res.send(chart.replace(/BTC/, symbol));
//     }
//     res.send('');
// });

app.use("/source-icons", express.static("public/source-icons"));
app.use("/media-icons", express.static("public/media-icons"));
app.use("/icon", express.static("public/cryptocurrency-icons"));
app.use("/icon", (req, res) => {
    const coinName = req.path.replace(/\//, "").replace(/\.png/, "").toUpperCase();
    const icon = text2png(" \n" + coinName + " \n", { textColor: "white", font: "70px Futura", padding: 60 });
    fs.writeFileSync("./public/cryptocurrency-icons/" + coinName + ".png", icon);
    // res.send(icon);
    res.sendFile(path.join(__dirname + "/../public/cryptocurrency-icons/" + coinName + ".png"));
});

app.use("/login", new LoginRouter().router());
app.use("/coin", new CoinRouter(coinService).router());
app.use("/news", new NewsRouter(newsService).router());
app.use("/price", new PriceRouter(priceService).router());
app.use("/user", new UserRouter(userService).router());

app.use("/", (req, res, next) => {
    if (req.hostname.match(/^www/) == null) {
        res.redirect(301, "https://www.coinmarketnews.app" + req.url);
    } else if (req.url === "/support" || req.url === "/support/") {
        res.redirect(301, "https://www.coinmarketnews.app");
    } else if (req.url === "/download" || req.url === "/download/") {
        res.redirect(301, "http://onelink.to/r6hy6s");
        // redirect to Play Store (android), App Store (iOS), or https://www.coinmarketnews.app (default)
    } else {
        next();
    }
}, express.static("public/"));

server.listen(8000);
// tslint:disable-next-line:no-console
console.log("server running on port 8000");
