import * as  express from "express";

const NODE_ENV = process.env.NODE_ENV || "development";
// tslint:disable-next-line:no-var-requires
const knexfile = require("../knexfile")[NODE_ENV];
// tslint:disable-next-line:no-var-requires
const knex = require("knex")(knexfile);
const app = express();

knex.migrate.latest().then(() => {
    console.log("(2/3) running [knex.seed.run()]");
    return knex.seed.run();
}).then(function () {
    console.log("(3/3) app ready");

    app.get('/', function (req: any, res: any) {
        knex.select("*").from("users").then((data: any) => {
            console.log(data);
            res.send(data);
            console.log("ho");
        });
    });

});

app.listen(8000);