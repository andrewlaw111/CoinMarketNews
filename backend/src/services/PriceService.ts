import { knex } from "../utils/init-app";

interface IPrice {
    id: number;
    price: number;
    volume_24h: number;
    market_cap: number;
    percent_change_1h: number;
    percent_change_24h: number;
    percent_change_7d: number;
}

interface ICoin {
    id: number;
    name: string;
    symbol: string;
    rank: number;
    price_fiat: IPrice[];
    price_crypto: IPrice[];
}

export default class CoinService {
    public lastUpdated: number;
    private priceList: ICoin[];

    public constructor() {
        this.lastUpdated = Date.now();
        this.updatePriceList();
    }
    public checkTimer() {
        return Date.now() - this.lastUpdated;
    }
    public getPrice(token: string) {
        return new Promise((resolve, reject) => {
            // Make a query to the database if the list has not been updated for 20 seconds
            if (Date.now() - this.lastUpdated < 20000) {
                resolve(this.priceList);
            } else {
                this.updatePriceList()
                    .then(() => {
                        console.log(this.priceList)
                        resolve(this.priceList);
                    })
                    .catch((err: any) => {
                        reject(err);
                    });
            }
        });
    }
    public getSpecificCoin(token: string, coinID: string) {
        return new Promise((resolve, reject) => {
            // Make a query to the database if the list has not been updated for 20 seconds
            if (Date.now() - this.lastUpdated < 20000) {
                const findcoin = this.priceList.find((coin) => coin.id === parseInt(coinID, undefined));
                resolve(findcoin);
            } else {
                this.updatePriceList()
                    .then(() => {
                        resolve(this.priceList.find((coin) => coin.id === parseInt(coinID, undefined)));
                    })
                    .catch((err: any) => {
                        reject(err);
                    });
            }
        });
    }
    private updatePriceList() {
        this.lastUpdated = Date.now();
        return knex('price')
            .then((prices: any[]) => {
                const price_array: any = [];
                prices.map(function (price: any) {
                    if (!(price.coinmarketcap_id in price_array)) {
                        price_array[price.coinmarketcap_id] = [];
                    }
                    price_array[price.coinmarketcap_id][price.currency_id] = price;
                });
                // console.log(price_array);
                return knex.select('id', 'coinmarketcap_id', 'name', 'symbol', 'rank')
                    .from('coin')
                    .orderBy("rank", "asc")
                    .then((coins: ICoin[]) => {
                        coins.map(function (coin: any) {
                            coin.price_fiat = price_array[coin.coinmarketcap_id][1];
                            coin.price_crypto = price_array[coin.coinmarketcap_id][3];
                        })
                        return this.priceList = coins;
                    });
            });
    }
}
