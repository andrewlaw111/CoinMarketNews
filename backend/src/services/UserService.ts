import * as jwt from "jwt-simple";
import { knex } from "../utils/init-app";

import config from "../utils/config-passport";

export interface IUser {
    id: number;
    fiat_currency_id: number;
    coin_currency_id: number;
    email: string;
    notifications: boolean;
    price_alert?: IPriceAlert[] | null;
    news_alert?: INewsAlert[] | null;
}

export interface IPriceAlert {
    id: number;
    coinmarketcap_id: number;
    currency_symbol: string;
    upper: boolean;
    price_point: number;
    active: boolean;
}

export interface INewsAlert {
    id: number;
    coin_id: number;
    alert: boolean;
}

export interface IUserToken extends IUser {
    token: string;
}
/* ---------- WIP ----------*/
export default class UserService {
    public getUser(token: string) {
        // tslint:disable-next-line:no-console
        console.log(token);
        return knex
            .select("*")
            .from("users")
            .innerJoin("sessions", "user_id", "users.id")
            .where("token", token)
            .then((users: any) => {
                if (users.length > 0) {
                    const user = users[0];
                    return knex
                        .select("id", "coinmarketcap_id", "currency_id", "upper", "price_point", "active")
                        .from("price_alert")
                        .where("user_id", "=", user.user_id)
                        .then((priceAlert: any) => {
                            const mapIDSymbol: any = [];  // TODO: get from DB
                            mapIDSymbol[1] = "USD";
                            mapIDSymbol[2] = "EUR";
                            mapIDSymbol[3] = "CAD";
                            mapIDSymbol[4] = "GBP";
                            mapIDSymbol[5] = "HKD";
                            mapIDSymbol[6] = "BTC";
                            mapIDSymbol[7] = "ETH";
                            priceAlert.map((alert: any) => {
                                alert.currency_symbol = mapIDSymbol[alert.currency_id];
                                delete alert.currency_id;
                            });
                            return knex
                                .select("id", "coin_id", "alert")
                                .from("news_alert")
                                .where("user_id", "=", user.user_id)
                                .then((newsAlert: any) => {
                                    const userWithToken: IUserToken = {
                                        coin_currency_id: user.coin_currency_id,
                                        email: user.email,
                                        fiat_currency_id: user.fiat_currency_id,
                                        id: user.user_id,
                                        news_alert: newsAlert,
                                        notifications: user.notifications,
                                        price_alert: priceAlert,
                                        token: user.token,
                                    };
                                    // tslint:disable-next-line:no-console
                                    console.log(userWithToken);
                                    return userWithToken;
                                });
                        });
                } else {
                    return this.createUser();
                }
            })
            .catch((err: any) => {
                // tslint:disable-next-line:no-console
                console.log(err);
                return this.createUser();
            });
    }
    public createUser() {
        // console.log("new user")
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

    public changeNotifications(token: string, notifications: boolean) {
        // console.log(notifications);
        return knex
            .select("user_id")
            .from("sessions")
            .where("token", token)
            .then((users: any) => {
                // console.log(users);
                return knex("users")
                    .update({
                        notifications,
                    })
                    .where("id", users[0].user_id)
                    .then((data: any) => {
                        return data;
                    });
            });
    }
    public createPriceAlert(
        token: string,
        coinMarketCapID: number,
        currencySymbol: string,
        upper: boolean,
        pricePoint: number,
        active: boolean) {
        return knex
            .select("user_id")
            .from("sessions")
            .where("token", token)
            .then((users: any) => {
                const mapSymbolID: any = [];  // TODO: get from DB
                mapSymbolID.USD = 1;
                mapSymbolID.EUR = 2;
                mapSymbolID.CAD = 3;
                mapSymbolID.GBP = 4;
                mapSymbolID.HKD = 5;
                mapSymbolID.BTC = 6;
                mapSymbolID.ETH = 7;
                return knex
                    .insert({
                        active,
                        coinmarketcap_id: coinMarketCapID,
                        currency_id: mapSymbolID[currencySymbol],
                        price_point: pricePoint,
                        upper,
                        user_id: users[0].user_id,
                    })
                    .into("price_alert")
                    .returning("id")
                    .then((data: any) => {
                        // console.log("price alert added");
                        return data[0];
                    })
                    .catch((err: any) => {
                        // tslint:disable-next-line:no-console
                        console.log(err);
                        return err;
                    });
            })
            .catch((err: any) => {
                // tslint:disable-next-line:no-console
                console.log(err);
            });
    }
    public deletePriceAlert(token: string, priceID: number) {
        return knex
            .select("user_id")
            .from("sessions")
            .where("token", token)
            .then((users: any) => {
                return knex
                    .delete()
                    .where({
                        id: priceID,
                        user_id: users[0].user_id,
                    })
                    .from("price_alert")
                    .then((data: any) => {
                        // console.log("price alert removed");
                        return data;
                    })
                    .catch((err) => {
                        return err;
                    });
            })
            .catch((err: any) => {
                // tslint:disable-next-line:no-console
                console.log(err);
            });
    }
    public updatePriceAlert(token: string, priceID: number, active: boolean) {
        return knex
            .select("user_id")
            .from("sessions")
            .where("token", token)
            .then((users: any) => {
                return knex("price_alert")
                    .update({
                        active,
                    })
                    .where("user_id", users[0].user_id)
                    .andWhere("id", priceID)
                    .then((data: any) => {
                        return data;
                    });
            })
            .catch((err: any) => {
                // tslint:disable-next-line:no-console
                console.log(err);
            });
    }
    public createNewsAlert(token: string, coinID: number) {
        return knex
            .select("user_id")
            .from("sessions")
            .where("token", token)
            .then((users: any) => {
                return knex
                    .insert({
                        alert: true,
                        coin_id: coinID,
                        user_id: users[0].user_id,
                    })
                    .into("news_alert")
                    .returning("id")
                    .then((data: any) => {
                        // tslint:disable-next-line:no-console
                        console.log("news alert on");
                        return data;
                    })
                    .catch((err: any) => {
                        // tslint:disable-next-line:no-console
                        console.log(err);
                        return err;
                    });
            })
            .catch((err: any) => {
                // tslint:disable-next-line:no-console
                console.log(err);
            });
    }
    public deleteNewsAlert(token: string, coinID: number) {
        return knex
            .select("user_id")
            .from("sessions")
            .where("token", token)
            .then((users: any) => {
                return knex
                    .delete()
                    .where({
                        coin_id: coinID,
                        user_id: users[0].user_id,
                    })
                    .from("news_alert")
                    .then((data: any) => {
                        // console.log("news alert off");
                        return data;
                    })
                    .catch((err: any) => {
                        return err;
                    });
            })
            .catch((err: any) => {
                // tslint:disable-next-line:no-console
                console.log(err);

            });
    }
    // public deleteFavourite(token: string, coinID: number) {
    //     return knex
    //         .select("user_id")
    //         .from("sessions")
    //         .where("token", token)
    //         .then((users) => {
    //             return knex
    //                 .delete()
    //                 .where({
    //                     user_id: users[0].user_id,
    //                     coin_id: coinID,
    //                 })
    //                 .from("news_alert")
    //                 .then((data) => {
    //                     return data;
    //                 })
    //                 .catch((err) => {
    //                     return err;
    //                 })
    //         })
    //         .catch((err) => {
    //             console.log(err)

    //         });
    // }
    // public saveFavourite(token: string, coinID: number) {
    //     return knex
    //         .select("user_id")
    //         .from("sessions")
    //         .where("token", token)
    //         .then((users) => {
    //             return knex
    //                 .insert({
    //                     user_id: users[0].user_id,
    //                     coin_id: coinID,
    //                     favourite: true,
    //                     subscribe_website: false,
    //                     subscribe_medium: false,
    //                     subscribe_reddit: false,
    //                     subscribe_twitter: false,
    //                 })
    //                 .into("news_alert")
    //                 .then((data) => {
    //                     console.log('added favourite');
    //                     return data;
    //                 })
    //                 .catch((err) => {
    //                     console.log(err);
    //                     return err;
    //                 })
    //         })
    //         .catch((err) => {
    //             console.log(err)
    //         })
    // }

    // public updateUser(
    //     coinCurrencyId: number,
    //     email: string,
    //     fiatCurrencyId: number,
    //     notifications: boolean,
    //     password: string,
    //     token: string,
    // ) {
    //     return knex
    //         .where("token", token)
    //         .update({
    //             coin_currency_id: coinCurrencyId,
    //             email,
    //             fiat_currency_id: fiatCurrencyId,
    //             notifications,
    //             password,
    //             token,
    //         }, ["user.id", "user.fiat_currency_id", "coin_currency_id", "email", "notifications"])
    //         .then((data) => {
    //             return data;
    //         });
    // }
}
