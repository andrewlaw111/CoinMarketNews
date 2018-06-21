import axios from "axios";
import { AsyncStorage } from "react-native";
import Config from "react-native-config";

import { Action } from "redux";
import { ICoin } from "../../models";
import { store } from "../store";

// Define Actions const and type
export const LOAD_COIN_SUCCESS = "LOAD_COIN_SUCCESS";
export type LOAD_COIN_SUCCESS = typeof LOAD_COIN_SUCCESS;

export const LOAD_COIN_FAILURE = "LOAD_COIN_FAILURE";
export type LOAD_COIN_FAILURE = typeof LOAD_COIN_FAILURE;

export interface ILoadCoinSuccessAction extends Action {
    type: LOAD_COIN_SUCCESS;
    coins: ICoin[];
}

export interface ILoadCoinFailureAction extends Action {
    type: LOAD_COIN_FAILURE;
}

// Collection of both for easier integration
export type CoinActions = ILoadCoinSuccessAction | ILoadCoinFailureAction;

export const loadCoinSuccess = (coins: ICoin[]) => {
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

export const getCoins = async () => {
    try {
        const token = store.getState().user.user.token;
        axios
            .get<ICoin[]>(
                `${Config.API_SERVER}/coin`,
                // `http://10.0.0.22:8000/coin`,
                {
                    headers: {
                        token,
                    },
                },
        ).then((result) => {
            AsyncStorage.setItem("@CoinMarketNews:coinsStore", JSON.stringify(result.data));
            store.dispatch(loadCoinSuccess(result.data));
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
