import { applyMiddleware, combineReducers, createStore } from "redux";
import thunk from "redux-thunk";
import { coinReducer, ICoinState } from "./reducers/coins";
import { IUserState, userReducer } from "./reducers/user";
// import { newsReducer, INewsState } from "./reducers/newsReducers";

export interface IRootState {
    coins: ICoinState;
    user: IUserState;
}

export const store = createStore(combineReducers({
    coins: coinReducer,
    user: userReducer,
}), applyMiddleware(thunk));
