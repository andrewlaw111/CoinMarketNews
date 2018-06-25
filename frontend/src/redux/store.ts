import { applyMiddleware, combineReducers, createStore } from "redux";
import thunk from "redux-thunk";
import { coinReducer, ICoinState } from "./reducers/coins";
import { favouritesReducer, IFavouritesState } from "./reducers/favourites";
import { INewsState, newsReducer } from "./reducers/news";
import { IUserState, userReducer } from "./reducers/user";
import { ISettingsState, settingsReducer } from "./reducers/settings";

export interface IRootState {
    coins: ICoinState;
    favourites: IFavouritesState;
    news: INewsState;
    settings: ISettingsState;
    user: IUserState;
}

export const store = createStore(combineReducers({
    coins: coinReducer,
    favourites: favouritesReducer,
    news: newsReducer,
    settings: settingsReducer,
    user: userReducer,
}), applyMiddleware(thunk));
