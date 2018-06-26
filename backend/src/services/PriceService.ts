import { knex } from "../utils/init-app";

interface IPrice {
    id: number;
    price: number;
    volume_24h: number | string;
    market_cap: number | string;
    percent_change_1h: number | string;
    percent_change_24h: number | string;
    percent_change_7d: number | string;
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
                        // console.log(this.priceList)
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
            .then((prices: IPrice[]) => {
                const price_array: any = [];
                prices.map(function (price: any) {
                    if (!(price.coinmarketcap_id in price_array)) {
                        price_array[price.coinmarketcap_id] = [];
                    }
                    // TODO: adapt decimals for each currency ( 3 = BTC ) => 8 decimals
                    price.price = (price.currency_id == 3) ? parseFloat(price.price).toFixed(8) : parseFloat(price.price);
                    price.volume_24h = parseFloat(price.volume_24h);
                    price.market_cap = parseFloat(price.market_cap);
                    price.percent_change_1h = parseFloat(price.percent_change_1h);
                    price.percent_change_24h = parseFloat(price.percent_change_24h);
                    price.percent_change_7d = parseFloat(price.percent_change_7d);
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
