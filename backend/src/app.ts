
import CoinRouter from "./routers/CoinRouter";
import UserRouter from "./routers/UserRouter";
import CoinService from "./services/CoinService";
import UserService from "./services/UserService";
import { app, server } from "./utils/init-app";
import LoginRouter from "./utils/login";
import * as express from "express";
const text2png = require('text2png');
const fs = require('fs');

import Cron from "./utils/cron";

const coinService = new CoinService();
const userService = new UserService();

Cron.price();

app.use('/icon', express.static('public/cryptocurrency-icons'));
app.use('/icon', function (req, res) {
    // TODO: check if coin exists?
    const coinName = req.path.replace(/\//, '').replace(/\.png/, '').toUpperCase();
    const icon = text2png(coinName, { textColor: 'grey', font: '70px Futura' });
    fs.writeFileSync('./public/cryptocurrency-icons/' + coinName + '.png', icon);
    res.send(icon);
});

app.use("/login", new LoginRouter().router());
app.use("/coin", new CoinRouter(coinService).router());
app.use("/user", new UserRouter(userService).router());

server.listen(8000);
// tslint:disable-next-line:no-console
console.log("server running on port 8000");
