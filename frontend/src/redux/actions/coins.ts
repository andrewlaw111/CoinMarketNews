// import axios from "axios";
import { Action } from "redux";
import { ICoin } from "../../models";

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

export let loadCoinSuccess = (coins: ICoin[]) => {
    return {
        coins,
        type: LOAD_COIN_SUCCESS,
    };
};

export let loadCoinFailure = (): ILoadCoinFailureAction => {
    return {
        type: LOAD_COIN_FAILURE,
    };
};
