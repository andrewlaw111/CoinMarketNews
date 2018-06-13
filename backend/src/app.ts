import * as express from "express";

const NODE_ENV = process.env.NODE_ENV || "development";
// tslint:disable-next-line:no-var-requires
const knexfile = require("../knexfile")[NODE_ENV];
// tslint:disable-next-line:no-var-requires
const knex = require("knex")(knexfile);
const app = express();

app.get('/', function (req: any, res: any) {
    knex.select("*").from("coin").limit(10).then((data: any) => {
        console.log(data);
        res.send(data);
        console.log("ho");
    });
});

app.listen(8000);