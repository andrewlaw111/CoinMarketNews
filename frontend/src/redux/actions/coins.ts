import axios from "axios";
import { AsyncStorage } from "react-native";
import Config from "react-native-config";

import { Action } from "redux";
import { ICoinPrice, IUser, ISettings } from "../../models";
import { store } from "../store";
import { cacheSorts } from "../../components/functions/CoinsSort";

// Define Actions const and type
export const LOAD_COIN_SUCCESS = "LOAD_COIN_SUCCESS";
export type LOAD_COIN_SUCCESS = typeof LOAD_COIN_SUCCESS;

export const LOAD_COIN_FAILURE = "LOAD_COIN_FAILURE";
export type LOAD_COIN_FAILURE = typeof LOAD_COIN_FAILURE;

export const UPDATE_COIN_SUCCESS = "UPDATE_COIN_SUCCESS";
export type UPDATE_COIN_SUCCESS = typeof UPDATE_COIN_SUCCESS;
export interface ILoadCoinSuccessAction extends Action {
    type: LOAD_COIN_SUCCESS;
    coins: ICoinPrice[];
}

export interface ILoadCoinFailureAction extends Action {
    type: LOAD_COIN_FAILURE;
}
export interface IUpdateCoinSuccessAction extends Action {
    type: UPDATE_COIN_SUCCESS;
    coins: ICoinPrice[];
}
// Collection of both for easier integration
export type CoinActions = ILoadCoinSuccessAction | ILoadCoinFailureAction | IUpdateCoinSuccessAction;

export const loadCoinSuccess = (coins: ICoinPrice[]) => {
    return {
        coins,
        type: LOAD_COIN_SUCCESS,
    };
};

export const loadCoinFailure = (): ILoadCoinFailureAction => {
    return {
        type: LOAD_COIN_FAILURE,
    };
};
const updateCoinSuccess = (coins: ICoinPrice[]) => {
    return {
        coins,
        type: UPDATE_COIN_SUCCESS,
    };
};

export const getCoins = async (settings: ISettings, rangeStart?: number, nb?: number) => {
    try {
        const token = store.getState().user.user.token;
        let fiatCurrency: string;
        let cryptoCurrency: string;

        if (typeof settings !== "undefined") {
            fiatCurrency = settings.fiatCurrency;
            cryptoCurrency = settings.cryptoCurrency;
        } else {
            fiatCurrency = "USD"
            cryptoCurrency = "BTC"
        }
        if (typeof rangeStart === "undefined") {
            return axios
                .get<ICoinPrice[]>(
                    `${Config.API_SERVER}/price`,
                    {
                        headers: {
                            token,
                            fiat: fiatCurrency,
                            crypto: cryptoCurrency
                        },
                    },
            ).then((result) => {
                AsyncStorage.setItem("@CoinMarketNews:coinsStore", JSON.stringify(result.data));
                const coins = result.data.filter((coin) => coin.price_crypto.market_cap !== null && coin.price_fiat.market_cap !== null && coin.rank !== null);

                store.dispatch(loadCoinSuccess(coins));
                cacheSorts(coins);
            }).catch(async (err) => {
                console.error(err);
                try {
                    const coins = await AsyncStorage.getItem("@CoinMarketNews:coinsStore");
                    if (coins !== null) {
                        store.dispatch(loadCoinSuccess(JSON.parse(coins)));
                    }
                } catch (error) {
                    store.dispatch(loadCoinFailure());
                }
            })
        } else {
            return axios
                .get<ICoinPrice[]>(
                    `${Config.API_SERVER}/price`,
                    {
                        headers: {
                            token,
                            fiat: fiatCurrency,
                            crypto: cryptoCurrency,
                            start: rangeStart,
                            limit: nb,
                        },
                    },
            ).then((result) => {
                const coins = result.data.filter((coin) => {
                    if (coin.rank === null || typeof coin.name === "undefined" || typeof coin.symbol === "undefined" || typeof coin.price_crypto === "undefined" || typeof coin.price_fiat === "undefined") {
                        return false
                    } else {
                        // for (let i in coin.price_fiat) {
                        //     if (typeof coin.price_fiat[i] === "undefined") {
                        //         return false
                        //     }
                        // }
                        // for (let i in coin.price_fiat) {
                        //     if (typeof coin.price_crypto[i] === "undefined") {
                        //         return false
                        //     }
                        // }
                        return true
                    }
                });

                store.dispatch(loadCoinSuccess(coins));
                cacheSorts(coins);
            }).catch(async (err) => {
                console.error(err);
                try {
                    const coins = await AsyncStorage.getItem("@CoinMarketNews:coinsStore");
                    if (coins !== null) {
                        store.dispatch(loadCoinSuccess(JSON.parse(coins)));
                    }
                } catch (error) {
                    store.dispatch(loadCoinFailure());
                }
            })
        }
        ;

    } catch (error) {
        console.error(error)
        try {
            const coins = await AsyncStorage.getItem("@CoinMarketNews:coinsStore");
            if (coins !== null) {
                store.dispatch(loadCoinSuccess(JSON.parse(coins)));
            }
        } catch (error) {
            store.dispatch(loadCoinFailure());
        }
    }
}
