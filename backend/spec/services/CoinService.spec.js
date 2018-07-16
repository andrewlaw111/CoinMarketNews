require('ts-node/register');
const CoinService = require('../../src/services/CoinService').default;
const knex = require('knex')({
    client: 'postgresql',
    connection: {
        database: "coinmarketnews-testing",
        port: 5433,
        user: "andrew",
        password: "password"
    },
}, );

describe("CoinService ", () => {
    const bitCoin = {
        "id": 1,
        "name": "Bitcoin",
        "symbol": "BTC",
        "rank": 1,
        "circulating_supply": "17143237",
        "total_supply": "17143237",
        "max_supply": "21000000",
        "last_updated": 1531303768,
        "coinmarketcap_id": 1,
        "about": "Bitcoin is a cryptocurrency and worldwide payment system. It is the first decentralized digital currency, as the system works without a central bank or single administrator. The network is peer-to-peer and transactions take place between users directly, without an intermediary. These transactions are verified by network nodes through the use of cryptography and recorded in a public distributed ledger called a blockchain. Bitcoin was invented by an unknown person or group of people under the name Satoshi Nakamoto and released as open-source software in 2009.\nBitcoins are created as a reward for a process known as mining. They can be exchanged for other currencies, products, and services. As of February 2015, over 100,000 merchants and vendors accepted bitcoin as payment. Research produced by the University of Cambridge estimates that in 2017, there are 2.9 to 5.8 million unique users using a cryptocurrency wallet, most of them using bitcoin.",
        "type": "Coin",
        "algorithm": "SHA256",
        "proof": "PoW",
        "mineable": true,
        "premined": false,
        "website_name": "bitcoin.org",
        "website_link": "https://bitcoin.org/",
        "medium_name": null,
        "medium_link": null,
        "reddit_name": "/r/bitcoin",
        "reddit_link": "https://reddit.com/r/bitcoin",
        "twitter_name": null,
        "twitter_link": null,
        "telegram_name": null,
        "telegram_link": null,
        "whitepaper_name": "whitepaper.pdf",
        "whitepaper_link": "https://bitcoin.org/bitcoin.pdf"
    }
    beforeEach((done) => {
        coinService = new CoinService(knex);

        return knex("coin").del()
            .then(() => {
                return knex
                    .insert(bitCoin)
                    .into("coin")
                    .then(() => {
                        return done();
                    })
            });
    });
    // afterEach((done) => {
    //     return knex("coin").del()
    //         .then(() => {
    //             return done()
    //         });
    // });

    it("should support get method", (done) => {
        coinService.getCoins()
            .then((data) => {
                expect(data.length).toEqual(1);
                expect(data[0].id).toEqual(1);
                expect(data[0].name).toEqual("Bitcoin");
                expect(data[0].symbol).toEqual("BTC");
                expect(data[0].rank).toEqual(1);
                expect(data[0].circulating_supply).toEqual("17143237");
                expect(data[0].total_supply).toEqual("17143237");
                expect(data[0].max_supply).toEqual("21000000");
                expect(data[0].last_updated).toEqual(1531303768);
                expect(data[0].coinmarketcap_id).toEqual(1);
                expect(data[0].about).toEqual("Bitcoin is a cryptocurrency and worldwide payment system. It is the first decentralized digital currency, as the system works without a central bank or single administrator. The network is peer-to-peer and transactions take place between users directly, without an intermediary. These transactions are verified by network nodes through the use of cryptography and recorded in a public distributed ledger called a blockchain. Bitcoin was invented by an unknown person or group of people under the name Satoshi Nakamoto and released as open-source software in 2009.\nBitcoins are created as a reward for a process known as mining. They can be exchanged for other currencies, products, and services. As of February 2015, over 100,000 merchants and vendors accepted bitcoin as payment. Research produced by the University of Cambridge estimates that in 2017, there are 2.9 to 5.8 million unique users using a cryptocurrency wallet, most of them using bitcoin.");
                expect(data[0].type).toEqual("Coin");
                expect(data[0].algorithm).toEqual("SHA256");
                expect(data[0].proof).toEqual("PoW");
                expect(data[0].mineable).toEqual(true);
                expect(data[0].premined).toEqual(false);
                expect(data[0].website_name).toEqual("bitcoin.org");
                expect(data[0].website_link).toEqual("https://bitcoin.org/");
                expect(data[0].medium_name).toEqual(null);
                expect(data[0].medium_link).toEqual(null);
                expect(data[0].reddit_name).toEqual("/r/bitcoin");
                expect(data[0].reddit_link).toEqual("https://reddit.com/r/bitcoin");
                expect(data[0].twitter_name).toEqual(null);
                expect(data[0].twitter_link).toEqual(null);
                expect(data[0].telegram_name).toEqual(null);
                expect(data[0].telegram_link).toEqual(null);
                expect(data[0].whitepaper_name).toEqual("whitepaper.pdf");
                expect(data[0].whitepaper_link).toEqual("https://bitcoin.org/bitcoin.pdf");
                done();
            })
            .catch((err) => {
                console.log(err)
            });;
    });

    it("should support get specific coin method", (done) => {
        coinService.getSpecificCoin(null, "1")
            .then((data) => {
                expect(data.id).toEqual(1);
                expect(data.name).toEqual("Bitcoin");
                expect(data.symbol).toEqual("BTC");
                expect(data.rank).toEqual(1);
                expect(data.circulating_supply).toEqual("17143237");
                expect(data.total_supply).toEqual("17143237");
                expect(data.max_supply).toEqual("21000000");
                expect(data.last_updated).toEqual(1531303768);
                expect(data.coinmarketcap_id).toEqual(1);
                expect(data.about).toEqual("Bitcoin is a cryptocurrency and worldwide payment system. It is the first decentralized digital currency, as the system works without a central bank or single administrator. The network is peer-to-peer and transactions take place between users directly, without an intermediary. These transactions are verified by network nodes through the use of cryptography and recorded in a public distributed ledger called a blockchain. Bitcoin was invented by an unknown person or group of people under the name Satoshi Nakamoto and released as open-source software in 2009.\nBitcoins are created as a reward for a process known as mining. They can be exchanged for other currencies, products, and services. As of February 2015, over 100,000 merchants and vendors accepted bitcoin as payment. Research produced by the University of Cambridge estimates that in 2017, there are 2.9 to 5.8 million unique users using a cryptocurrency wallet, most of them using bitcoin.");
                expect(data.type).toEqual("Coin");
                expect(data.algorithm).toEqual("SHA256");
                expect(data.proof).toEqual("PoW");
                expect(data.mineable).toEqual(true);
                expect(data.premined).toEqual(false);
                expect(data.website_name).toEqual("bitcoin.org");
                expect(data.website_link).toEqual("https://bitcoin.org/");
                expect(data.medium_name).toEqual(null);
                expect(data.medium_link).toEqual(null);
                expect(data.reddit_name).toEqual("/r/bitcoin");
                expect(data.reddit_link).toEqual("https://reddit.com/r/bitcoin");
                expect(data.twitter_name).toEqual(null);
                expect(data.twitter_link).toEqual(null);
                expect(data.telegram_name).toEqual(null);
                expect(data.telegram_link).toEqual(null);
                expect(data.whitepaper_name).toEqual("whitepaper.pdf");
                expect(data.whitepaper_link).toEqual("https://bitcoin.org/bitcoin.pdf");
                done();
            })
            .catch((err) => {
                console.log(err)
            });
    });
    it("should not return a coin that does not exit", (done) => {
        coinService.getSpecificCoin(null, "2")
            .then((data) => {
                expect(typeof data).toEqual("undefined")
                done();
            })
            .catch((err) => {
                console.log(err)
            });
    });
    it("call update the coin list only after 20 seconds", (done) => {
        spyOn(coinService, "updateCoinList").and.callThrough();
        coinService.lastUpdated = Date.now() - 50000;
        coinService.getCoins();
        expect(coinService.updateCoinList).toHaveBeenCalled();
        done();
    })
    it("should not update the coin list before 20 seconds", (done) => {
        spyOn(coinService, "updateCoinList").and.callThrough();
        coinService.getCoins();
        expect(coinService.updateCoinList).not.toHaveBeenCalled();
        done();
    })
});