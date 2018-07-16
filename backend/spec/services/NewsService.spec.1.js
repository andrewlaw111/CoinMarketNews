require('ts-node/register');
const NewsService = require('../../src/services/NewsService').default;
const knex = require('knex')({
    client: 'postgresql',
    connection: {
        database: "coinmarketnews-testing",
        port: 5433,
        user: "andrew",
        password: "password"
    },
}, );

describe("NewsService ", () => {
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
    const newsItem = {
        "title": "eToro Executive: Crypto Correction in 2018 is a Blessing in Disguise, Bull Market Expected",
        "content": "The UK head of eToro has revealed how many crypto assets the social trading platform is looking to add and criticized reporting on blockchain technology by mainstream media. In an interview with NewsB",
        "link": "https://www.newsbtc.com/2018/07/12/etoro-interview-bitcoin-crypto-correction/",
        "counter": 14
    };
    beforeEach((done) => {
        newsService = new NewsService(knex);
        return knex("coin_news").del()
            .then(() => {
                return knex("coin_news").select("*")
                    .then(() => {
                        return knex("coin").del()
                            .then(() => {
                                return knex("news").del()
                                    .then(() => {
                                        return knex("news")
                                            .insert(newsItem)
                                            .returning('id')
                                            .then((id) => {
                                                return knex
                                                    .insert(bitCoin)
                                                    .into("coin")
                                                    .returning('id')
                                                    .then((coinID) => {
                                                        let coinNews = {
                                                            coin_id: coinID[0],
                                                            news_id: id[0]
                                                        }
                                                        return knex("coin_news")
                                                            .insert(coinNews)
                                                            .then(() => {
                                                                done();
                                                            });
                                                    })
                                            });
                                    });
                            });
                    })
            });
    });
    afterEach((done) => {
        return knex("coin_news").del()
            .then(() => {
                return knex("coin_news").select("*")
                    .then(() => {
                        return knex("coin").del()
                            .then(() => {
                                return done()
                            });
                    });
            });
    });

    it("should support get method", (done) => {
        newsService.getNews()
            .then((data) => {
                expect(data.length).toEqual(1);
                // expect(data[0].id).toEqual(1);
                expect(data[0].title).toEqual("eToro Executive: Crypto Correction in 2018 is a Blessing in Disguise, Bull Market Expected");
                expect(data[0].content).toEqual("The UK head of eToro has revealed how many crypto assets the social trading platform is looking to add and criticized reporting on blockchain technology by mainstream media. In an interview with NewsB");
                expect(data[0].link).toEqual("https://www.newsbtc.com/2018/07/12/etoro-interview-bitcoin-crypto-correction/");
                // expect(data[0].created_at).toEqual(Date("2018-07-12T05:00:15.000Z"));
                expect(data[0].counter).toEqual(14);
                done();
            })
            .catch((err) => {
                console.log(err)
            });;
    });
    it("should support getCoinNews method", (done) => {
        newsService.getCoinNews(null, 1)
            .then((data) => {
                expect(data[0].title).toEqual("eToro Executive: Crypto Correction in 2018 is a Blessing in Disguise, Bull Market Expected");
                expect(data[0].content).toEqual("The UK head of eToro has revealed how many crypto assets the social trading platform is looking to add and criticized reporting on blockchain technology by mainstream media. In an interview with NewsB");
                expect(data[0].link).toEqual("https://www.newsbtc.com/2018/07/12/etoro-interview-bitcoin-crypto-correction/");
                expect(data[0].counter).toEqual(14);
                done();
            })
            .catch((err) => {
                console.log(err)
            });;
    });
});