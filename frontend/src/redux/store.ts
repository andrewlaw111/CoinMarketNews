import { applyMiddleware, combineReducers, createStore } from "redux";
import thunk from "redux-thunk";
import { coinReducer, ICoinState } from "./reducers/coins";
import { IUserState, userReducer } from "./reducers/user";
import { INewsState, newsReducer } from "./reducers/news";
// import { newsReducer, INewsState } from "./reducers/newsReducers";

export interface IRootState {
    coins: ICoinState;
    news: INewsState;
    user: IUserState;
}

export const store = createStore(combineReducers({
    coins: coinReducer,
    news: newsReducer,
    user: userReducer,
}), applyMiddleware(thunk));
