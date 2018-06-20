import { knex } from "../utils/init-app";
interface ICoin {
    id: number;
    name: string;
    symbol: string;
    rank: number;
    circulating_supply: string;
    total_supply: string;
    max_supply: string | null;
    last_updated: number;
    coinmarketcap_id: number;
    about: string;
    type: string;
    algorithm: string;
    proof: string;
    mineable: string;
    premined: string;
    official_website: string;
    medium: string;
    reddit: string;
    twitter: string;
    telegram: string;
}

export default class CoinService {
    public lastUpdated: number;
    private coinList: ICoin[];

    public constructor() {
        this.lastUpdated = Date.now();
        this.updateList();
    }
    public checkTimer() {
        return Date.now() - this.lastUpdated;
    }
    public getCoins(token: string) {
        return new Promise((resolve, reject) => {

            // Make a query to the database if the list has not been updated for 20 seconds
            if (Date.now() - this.lastUpdated < 20000) {
                resolve(this.coinList);
            } else {
                this.updateList()
                    .then(() => {
                        console.log(this.coinList)
                        resolve(this.coinList);
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
                const findcoin = this.coinList.find((coin) => coin.id === parseInt(coinID, undefined));
                resolve(findcoin);
            } else {
                this.updateList()
                    .then(() => {
                        resolve(this.coinList.find((coin) => coin.id === parseInt(coinID, undefined)));
                    })
                    .catch((err: any) => {
                        reject(err);
                    });
            }
        });
    }
    private updateList() {
        this.lastUpdated = Date.now();
        return knex
            .select("*")
            .from("coin")
            .orderBy("rank", "asc").then((data: ICoin[]) => {
                return this.coinList = data;
            });
    }
}
