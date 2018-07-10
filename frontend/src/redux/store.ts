import { applyMiddleware, combineReducers, createStore } from "redux";
import thunk from "redux-thunk";
import { alertsReducer, IAlertsState } from "./reducers/alerts";
import { coinReducer, ICoinState } from "./reducers/coins";
import { favouritesReducer, IFavouritesState } from "./reducers/favourites";
import { INewsState, newsReducer } from "./reducers/news";
import { ISettingsState, settingsReducer } from "./reducers/settings";
import { IUserState, userReducer } from "./reducers/user";

export interface IRootState {
    alerts: IAlertsState;
    coins: ICoinState;
    favourites: IFavouritesState;
    news: INewsState;
    settings: ISettingsState;
    user: IUserState;
}

export const store = createStore(combineReducers({
    alerts: alertsReducer,
    coins: coinReducer,
    favourites: favouritesReducer,
    news: newsReducer,
    settings: settingsReducer,
    user: userReducer,
}), applyMiddleware(thunk));
