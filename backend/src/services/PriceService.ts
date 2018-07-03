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
    coinmarketcap_id: number;
    name: string;
    symbol: string;
    rank: number;
    price_fiat: IPrice;
    price_crypto: IPrice;
}

export default class CoinService {
    public lastUpdated: number;
    public priceList: ICoin[];
    public prices: IPrice[][] = [];

    public constructor() {
        this.lastUpdated = Date.now();
        this.updatePriceList();
    }
    public checkTimer() {
        return Date.now() - this.lastUpdated;
    }
    public getPrice(token: string, fiat: string = 'USD', crypto: string = 'BTC', start: string = '0', limit: string = '100') {
        return new Promise((resolve, reject) => {
            // Make a query to the database if the list has not been updated for 5 minutes
            if (Date.now() - this.lastUpdated < 300000) {
                resolve(this.selectCurrency(fiat, crypto, start, limit));
            } else {
                this.updatePriceList()
                    .then(() => {
                        resolve(this.selectCurrency(fiat, crypto, start, limit));
                    })
                    .catch((err: any) => {
                        reject(err);
                    });
            }
        });
    }
    public getBySearch(token: string, searchInput: string, fiat: string = 'USD', crypto: string = 'BTC') {
        return new Promise((resolve, reject) => {
            // Make a query to the database if the list has not been updated for 5 minutes
            if (Date.now() - this.lastUpdated < 300000) {
                const findcoins = this.selectCurrency(fiat, crypto).filter((coin) => RegExp(searchInput.toLowerCase()).test(coin.name.toLowerCase()) || RegExp(searchInput.toLowerCase()).test(coin.symbol.toLowerCase()));
                resolve(findcoins);
            } else {
                this.updatePriceList()
                    .then(() => {
                        const findcoins = this.selectCurrency(fiat, crypto).filter((coin) => RegExp(searchInput.toLowerCase()).test(coin.name.toLowerCase()) || RegExp(searchInput.toLowerCase()).test(coin.symbol.toLowerCase()));
                        resolve(findcoins);
                    })
                    .catch((err: any) => {
                        reject(err);
                    });
            }
        });
    }
    public getSpecificCoin(token: string, coinID: string, fiat: string = 'USD', crypto: string = 'BTC') {
        return new Promise((resolve, reject) => {
            // Make a query to the database if the list has not been updated for 5 minutes
            if (Date.now() - this.lastUpdated < 300000) {
                const findcoin = this.selectCurrency(fiat, crypto, "0", this.priceList.length.toString()).find((price) => price.id === parseInt(coinID, undefined));
                resolve(findcoin);
            } else {
                this.updatePriceList()
                    .then(() => {
                        resolve(this.selectCurrency(fiat, crypto).find((coin) => coin.id === parseInt(coinID, undefined)));
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
                for (const price of prices) {
                    if (!(price.coinmarketcap_id in this.prices)) {
                        this.prices[price.coinmarketcap_id] = [];
                    }
                    // TODO?: adapt decimals for each currency ( 3 = BTC ) => 8 decimals
                    price.price = (price.currency_id == 6) ? parseFloat(price.price).toFixed(8) : parseFloat(price.price);
                    price.volume_24h = parseFloat(price.volume_24h);
                    price.market_cap = parseFloat(price.market_cap);
                    price.percent_change_1h = parseFloat(price.percent_change_1h);
                    price.percent_change_24h = parseFloat(price.percent_change_24h);
                    price.percent_change_7d = parseFloat(price.percent_change_7d);
                    this.prices[price.coinmarketcap_id][price.currency_id] = price;
                }
                // console.log(price_array);
                return knex.select('id', 'coinmarketcap_id', 'name', 'symbol', 'rank')
                    .from('coin')
                    .whereNotNull('rank')
                    .orderBy("rank", "asc")
                    .then((coins: ICoin[]) => {
                        return this.priceList = coins;
                    });
            });
    }

    private selectCurrency(fiat: string = 'USD', crypto: string = 'BTC', start: string = '0', limit: string = '100') {
        const map_symbol_id: any = [];  // TODO: get from DB
        map_symbol_id["USD"] = 1;
        map_symbol_id["EUR"] = 2;
        map_symbol_id["CAD"] = 3;
        map_symbol_id["GBP"] = 4;
        map_symbol_id["HKD"] = 5;
        map_symbol_id["BTC"] = 6;
        map_symbol_id["ETH"] = 7;
        const startInt = parseInt(start);
        const nb = startInt + parseInt(limit);
        const priceList = this.priceList.slice(startInt, nb);
        for (const coin of priceList) {
            if (coin.coinmarketcap_id in this.prices && map_symbol_id[fiat] in this.prices[coin.coinmarketcap_id]) {
                coin.price_fiat = this.prices[coin.coinmarketcap_id][map_symbol_id[fiat]];
            }
            if (coin.coinmarketcap_id in this.prices && map_symbol_id[crypto] in this.prices[coin.coinmarketcap_id]) {
                coin.price_crypto = this.prices[coin.coinmarketcap_id][map_symbol_id[crypto]];
            }
        };
        return priceList;
    }
}
