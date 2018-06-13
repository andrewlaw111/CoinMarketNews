import * as  express from "express";

import * as bodyParser from "body-parser";
import * as cors from "cors";
import * as http from "http";
import authClass from "./auth";

const NODE_ENV = process.env.NODE_ENV || "development";
import * as Knex from "knex";
import * as knexfile from "../../knexfile";

export const app = express();
export const server = new http.Server(app);
export const auth = authClass();
export const knex = Knex(knexfile[NODE_ENV]);

app.use(bodyParser.urlencoded({
    extended: false,
}));
app.use(bodyParser.json());
app.use(auth.initialize());
app.use(cors());
