import axios from "axios";
import { AsyncStorage } from "react-native";

import { Action } from "redux";
import { store } from "../store";
import Config from "react-native-config";
import { getUser } from "./user";

// Define Actions const and type
export const ADD_COIN_FAVOURITE = "ADD_COIN_FAVOURITE";
export type ADD_COIN_FAVOURITE = typeof ADD_COIN_FAVOURITE;

export const LOAD_COIN_FAVOURITE = "LOAD_COIN_FAVOURITE";
export type LOAD_COIN_FAVOURITE = typeof LOAD_COIN_FAVOURITE;

export const REMOVE_COIN_FAVOURITE = "REMOVE_COIN_FAVOURITE";
export type REMOVE_COIN_FAVOURITE = typeof REMOVE_COIN_FAVOURITE;

export interface IAddFavouriteAction extends Action {
    type: ADD_COIN_FAVOURITE;
    coinID: number;
}
export interface ILoadFavouriteAction extends Action {
    type: LOAD_COIN_FAVOURITE;
    favourites: number[];
}
export interface IRemoveFavouriteAction extends Action {
    type: REMOVE_COIN_FAVOURITE;
    coinID: number;
}

// Collection of both for easier integration
export type FavouriteActions = IAddFavouriteAction | ILoadFavouriteAction | IRemoveFavouriteAction;

export const loadCoinFavouritesToStore = (favourites: number[]) => {
    return {
        favourites,
        type: LOAD_COIN_FAVOURITE,
    };
};

export const removeCoinFavourite = (coinID: number, token: string) => {
    axios
        .delete(
            `${Config.API_SERVER}/user/favourites`,
            {
                headers: {
                    token,
                },
                data: {
                    coinID,
                }
            },

    )
    return {
        coinID,
        type: REMOVE_COIN_FAVOURITE,
    };
};

export const loadFavourites = async () => {
    const favourites = await AsyncStorage.getItem("@CoinMarketNews:favouriteStore");
    if (favourites !== null) {
        return store.dispatch(loadCoinFavouritesToStore(JSON.parse(favourites)));
    } else {
        return;
    }
};

export const addCoinFavourite = (coinID: number, token: string) => {
    if (token) {
        axios
            .post(
                `${Config.API_SERVER}/user/favourites`,
                {
                    data: {
                        coinID,
                    }
                },
                {
                    headers: {
                        token,
                    },
                }

            )
            
        return {
            coinID,
            type: ADD_COIN_FAVOURITE,
        };
    }
    else {
        AsyncStorage.getItem("@CoinMarketNews:userToken").then((token) => {
            addCoinFavourite(coinID, token);
            return;
        });
    };

};
