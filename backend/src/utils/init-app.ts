import * as  express from "express";

import * as bodyParser from "body-parser";
import * as cors from "cors";
import authClass from "./auth";

const NODE_ENV = process.env.NODE_ENV || "development";
import * as Knex from "knex";
import * as knexfile from "../../knexfile";

export const app = express();
export const auth = authClass();
export const knex = Knex(knexfile[NODE_ENV]);

// TEST: remove later
app.get('/', function (req: any, res: any) {
    knex.select("*").from("coin").limit(10).then((data: any) => {
        console.log(data);
        res.send(data);
    });
});

app.use(bodyParser.urlencoded({
    extended: false,
}));
app.use(bodyParser.json());
app.use(auth.initialize());
app.use(cors());