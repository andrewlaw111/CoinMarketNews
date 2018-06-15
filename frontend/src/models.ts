export interface ICoin {
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

export interface IUser {
    id: number | null;
    fiat_currency_id: number;
    coin_currency_id: number;
    email: string | null;
    notifications: boolean;
    token: string | null;
}

// TODO
// export interface INews {
//     sender: string;
//     message: string;
//     time: string;
// }