import * as passport from "passport";
import * as passportJWT from "passport-jwt";

import config from "./config-passport";
// import { knex } from "./init-app";

const ExtractJwt = passportJWT.ExtractJwt;

export default () => {
    const strategy = new passportJWT.Strategy({
        jwtFromRequest: ExtractJwt.fromAuthHeaderAsBearerToken(),
        secretOrKey: config.jwtSecret,
    }, (payload, done) => {

        // TODO Write the knex query to get user
        // knex.select("*").from("users").where("token", payload.id).then((user) => {
        // if (user) {
        //     return done(null, { id: user.id });
        // } else {
        //     return done(new Error("User not found"), null);
        // }
        // });
    });
    passport.use(strategy);

    return {
        authenticate: () => {
            return passport.authenticate("jwt", config.jwtSession);
        },
        initialize: () => {
            return passport.initialize();
        },
    };
};
