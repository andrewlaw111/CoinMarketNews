// import { knex } from "../utils/init-app";
interface ICoin {
    id: number;
    name: string;
    symbol: string;
    rank: number;
    circulating_supply: string;
    total_supply: string;
    max_supply: string;
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
    private coinList: ICoin[];

    public constructor() {
        this.coinList = [];
    }
    public getAllCoins() {
        return this.coinList;
    }
    public getSpecificCoin() {
        return;
    }
}
