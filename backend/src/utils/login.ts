import * as express from "express";
import * as jwt from "jwt-simple";

import { checkPassword, hashPassword } from "./bcrypt";
import config from "./config-passport";
import { knex } from "./init-app";

/* DELETE LATER */

export default class LoginRouter {
    public router() {
        const router = express.Router();
        router.route("/")
            .post(this.login)
            .put(this.updateLogin);
        // router.post("/:userID", this.newUser);
        return router;
    }

    private login = (req: express.Request, res: express.Response) => {
        if (req.body.email && req.body.password) {
            const email = req.body.email;
            const password = req.body.password;

            knex.select("*").from("users").where("email", email).then(async (users: any) => {
                if (users.length === 0) {
                    res.sendStatus(401);
                } else {
                    const user = users[0];
                    const result = await checkPassword(password, users[0].password);
                    if (result) {
                        const payload = {
                            id: user.id,
                        };
                        const token = jwt.encode(payload, config.jwtSecret);
                        res.json({
                            token,
                        });
                    } else {
                        res.sendStatus(401);
                    }
                }
            });
        } else {
            res.sendStatus(401);
        }
    }

    private updateLogin = (req: express.Request, res: express.Response) => {
        if (req.body.email && req.body.password) {
            const email = req.body.email;
            const password = req.body.password;
            const newPassword = req.body.newPassword;
            const token = parseInt(req.body.token, undefined);

            return knex.select("*").from("users").where("email", email).then((users) => {
                if (users.length > 0) {
                    return checkPassword(password, users[0].password)
                        .then(() => {
                            const subquery = knex.select("user_id").from("sessions").where("token", token);
                            return hashPassword(newPassword).then((hashedPassword) => {
                                return knex("users")
                                    .update({ email, password: hashedPassword })
                                    .where("id", "in", subquery)
                                    .returning("*")
                                    .then((user) => {
                                        return res.json(user[0]);
                                    })
                                    .catch((err) => {
                                        return res.json(err);
                                    });
                            });
                        })
                        .catch((err) => res.sendStatus(401));
                } else {
                    return res.sendStatus(401);
                }
            });
        } else {
            return res.sendStatus(401);
        }
    }
}
