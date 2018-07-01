export interface ICoin {
    id: number;
    coinmarketcap_id: number;
    name: string;
    symbol: string;
    rank: number;
    icon: string | null;
    circulating_supply: string;
    total_supply: string;
    max_supply: string | null;
    last_updated: number;
    about: string;
    type: string;
    algorithm: string;
    proof: string;
    mineable: string;
    premined: string;
    website_name?: string;
    website_link?: string;
    medium_name?: string;
    medium_link?: string;
    reddit_name?: string;
    reddit_link?: string;
    twitter_name?: string;
    twitter_link?: string;
    telegram_name?: string;
    telegram_link?: string;
    whitepaper_name?: string;
    whitepaper_link?: string;
}
export interface ICoinPrice {
    id: number;
    coinmarketcap_id: number;
    name: string;
    symbol: string;
    rank: number;
    price_fiat: {
        id: number;
        coinmarketcap_id: number;
        currency_id: number;
        price: number;
        volume_24h: number;
        market_cap: number;
        percent_change_1h: number;
        percent_change_24h: number;
        percent_change_7d: number;
    };
    price_crypto: {
        id: number;
        coinmarketcap_id: number;
        currency_id: number;
        price: number;
        volume_24h: number;
        market_cap: number;
        percent_change_1h: number;
        percent_change_24h: number;
        percent_change_7d: number;
    };
}

export interface IUser {
    id: number | null;
    fiat_currency_id: number;
    coin_currency_id: number;
    email: string | null;
    notifications: boolean;
    news_alert: INewsAlert[];
    price_alert: IPriceAlert[];
    token: string | null;
}

export interface INews {
    id: number;
    title: string;
    content: string;
    source_id: string | null;
    link: string;
    created_at: string;
    counter: number;
}

export interface ISettings {
    fiatCurrency: string;
    cryptoCurrency: string;
    pushNotifications: boolean;
    darkMode: boolean;
}

export interface IAlerts {
    id?: number;
    coinmarketcap_id: number;
    currency_symbol: string;
    upper: boolean;
    price_point: number;
    active: boolean;
}

export interface IPriceAlert {
    id: number;
    coinmarketcap_id: number;
    currency_symbol: string;
    upper: boolean;
    price_point: number;
    active: boolean;
}

export interface INewsAlert {
    id: number;
    coin_id: number;
    alert: boolean;
}