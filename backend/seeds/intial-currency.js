exports.seed = (knex, Promise) => {
    return knex('currency').del()
        .then(() => {
            return knex("currency").insert([{
                fiat: true,
                symbol: "USD",
            },{
                fiat: true,
                symbol: "EUR",
            },{
                fiat: false,
                symbol: "BTC",
            },{
                fiat: false,
                symbol: "ETH",
            },{
                fiat: false,
                symbol: "LTC",
            }]);
        });
};