import { AsyncStorage } from "react-native";
import { IUser } from "../../models";
import { LOGIN_SUCCESS, LoginActions } from "../actions/user";

export interface IUserState {
    user: IUser;
}

const defaultUserState: IUserState = {
    user: {
        coin_currency_id: 2,
        email: null,
        fiat_currency_id: 1,
        id: null,
        notifications: false,
        token: null,
    },
};

export function userReducer(state: IUserState = defaultUserState, action: LoginActions) {
    switch (action.type) {
        case LOGIN_SUCCESS:
            AsyncStorage.setItem("@CoinMarketNews:userToken", action.user.token);
            return {
                user: action.user,
            };
        default:
            return state;
    }
}
