import { AsyncStorage } from "react-native";
import {
    ADD_COIN_FAVOURITE,
    FavouriteActions,
    LOAD_COIN_FAVOURITE,
    REMOVE_COIN_FAVOURITE,
} from "../actions/favourites";

export interface IFavouritesState {
    favourites: number[];
}

const defaultFavouriteState: IFavouritesState = {
    favourites: [1, 296],
};

export const favouritesReducer = (state: IFavouritesState = defaultFavouriteState, action: FavouriteActions) => {
    switch (action.type) {
        case ADD_COIN_FAVOURITE:
            const addFavourites = state.favourites.slice();
            addFavourites.push(action.coinID);
            AsyncStorage.setItem("@CoinMarketNews:favouriteStore", JSON.stringify(addFavourites));

            return {
                favourites: addFavourites,
            };
        case LOAD_COIN_FAVOURITE:
            return {
                favourites: action.favourites,
            };
        case REMOVE_COIN_FAVOURITE:
            const removeFavourites = state.favourites.slice();
            removeFavourites.splice(removeFavourites.indexOf(action.coinID), 1);
            AsyncStorage.setItem("@CoinMarketNews:favouriteStore", JSON.stringify(removeFavourites));

            return {
                favourites: removeFavourites,
            };
        default:
            return state;
    }
};
