import { knex } from "../utils/init-app";

/* ---------- WIP ----------*/
export default class UserService {
    public getUser(token: string) {
        return knex
            .select("user.id", "user.fiat_currency_id", "coin_currency_id", "email", "notifications")
            .from("users")
            .innerJoin("sessions", "user_id", "user.id")
            .where("token", token)
            .then((user) => {
                return user[0];
            });
    }
    public createUser() {
        return knex
            .insert({

            })
            .into("users")
            .returning(["user.id", "user.fiat_currency_id", "coin_currency_id", "email", "notifications"])
            .then((user) => {
                return user[0];
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
