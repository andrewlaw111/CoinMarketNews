import * as jwt from "jwt-simple";
import { knex } from "../utils/init-app";

import config from "../utils/config-passport";

export interface IUser {
    id: number;
    fiat_currency_id: number;
    coin_currency_id: number;
    email: string;
    notifications: boolean;
}

export interface IUserToken extends IUser {
    token: string;
}
/* ---------- WIP ----------*/
export default class UserService {
    public getUser(token: string) {
        return knex
            .select("*")
            .from("users")
            .innerJoin("sessions", "user_id", "users.id")
            .where("token", token)
            .then((users) => {
                const user = users[0];
                const userWithToken: IUserToken = {
                    coin_currency_id: user.coin_currency_id,
                    email: user.email,
                    fiat_currency_id: user.fiat_currency_id,
                    id: user.user_id,
                    notifications: user.notifications,
                    token: user.token,
                };
                return userWithToken;

            });
    }
    public createUser() {
        return knex
            .insert({ fiat_currency_id: null, coin_currency_id: null, notifications: false })
            .into("users")
            .returning(["id", "fiat_currency_id", "coin_currency_id", "email", "notifications"])
            .then((users: IUser[]) => {
                const user = users[0];
                const payload = {
                    id: user.id,
                };
                const token = jwt.encode(payload, config.jwtSecret);
                return knex("sessions")
                    .insert({
                        token,
                        user_id: user.id,
                    })
                    .then(() => {
                        const userWithToken: IUserToken = {
                            coin_currency_id: user.coin_currency_id,
                            email: user.email,
                            fiat_currency_id: user.fiat_currency_id,
                            id: user.id,
                            notifications: user.notifications,
                            token,
                        };
                        return userWithToken;
                    });
            });
    }
    public updateUser(
        coinCurrencyId: number,
        email: string,
        fiatCurrencyId: number,
        notifications: boolean,
        password: string,
        token: string,
    ) {
        return knex
            .where("token", token)
            .update({
                coin_currency_id: coinCurrencyId,
                email,
                fiat_currency_id: fiatCurrencyId,
                notifications,
                password,
                token,
            }, ["user.id", "user.fiat_currency_id", "coin_currency_id", "email", "notifications"])
            .then((data) => {
                return data;
            });
    }
}
