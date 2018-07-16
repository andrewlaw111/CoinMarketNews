import axios from "axios";
import { AsyncStorage } from "react-native";
import Config from "react-native-config";

import { IUser } from "../../models";
import { store } from "../store";

export const LOGIN_SUCCESS = "LOGIN_SUCCESS";
export type LOGIN_SUCCESS = typeof LOGIN_SUCCESS;

export interface ILoginSuccessAction {
    type: LOGIN_SUCCESS;
    user: IUser;
}

export type LoginActions = ILoginSuccessAction;

export function loginSuccess(user: IUser): ILoginSuccessAction {
    return {
        type: LOGIN_SUCCESS,
        user,
    };
}

export const getUser = async () => {
    try {
        const token = await AsyncStorage.getItem("@CoinMarketNews:userToken");
        if (token !== null) {
            return axios
                .get<IUser>(
                    `${Config.API_SERVER}/user`,
                    {
                        headers: {
                            token,
                        },
                    },
            ).then((result) => {
                store.dispatch(loginSuccess(result.data));
                return result.data;
            }).catch((err) => {
                // tslint:disable-next-line:no-console
                console.log(err);
            });
        } else {
            return axios
                .post<IUser>(
                    `${Config.API_SERVER}/user`,
            ).then((result) => {
                store.dispatch(loginSuccess(result.data));
            }).catch((err) => {
                // tslint:disable-next-line:no-console
                console.log(err);
            });
        }
    } catch (error) {
        // tslint:disable-next-line:no-console
        console.log("error", error);
        return error;
    }
};
