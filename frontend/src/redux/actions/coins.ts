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

export interface ILoadCoinSuccessAction extends Action {
    type: LOAD_COIN_SUCCESS;
    coins: ICoinPrice[];
}

export interface ILoadCoinFailureAction extends Action {
    type: LOAD_COIN_FAILURE;
}

// Collection of both for easier integration
export type CoinActions = ILoadCoinSuccessAction | ILoadCoinFailureAction;

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

export const getCoins = async (settings: ISettings) => {
    try {
        const token = store.getState().user.user.token;
        return axios
            .get<ICoinPrice[]>(
                `${Config.API_SERVER}/price`,
                {
                    headers: {
                        token,
                        fiat: settings.fiatCurrency,
                        crypto: settings.cryptoCurrency
                    },
                },
        ).then((result) => {
            AsyncStorage.setItem("@CoinMarketNews:coinsStore", JSON.stringify(result.data));
            const coins = result.data.filter((coin) => coin.price_crypto.market_cap !== null && coin.price_fiat.market_cap !== null && coin.rank !== null);

            store.dispatch(loadCoinSuccess(coins));
            cacheSorts(coins);
        }).catch(async () => {
            try {
                const coins = await AsyncStorage.getItem("@CoinMarketNews:coinsStore");
                if (coins !== null) {
                    store.dispatch(loadCoinSuccess(JSON.parse(coins)));
                }
            } catch (error) {
                store.dispatch(loadCoinFailure());
            }
        });

    } catch (error) {
        try {
            const coins = await AsyncStorage.getItem("@CoinMarketNews:coinsStore");
            if (coins !== null) {
                store.dispatch(loadCoinSuccess(JSON.parse(coins)));
            }
        } catch (error) {
            store.dispatch(loadCoinFailure());
        }
    }
};

