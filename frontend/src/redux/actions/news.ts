import axios from "axios";
import { AsyncStorage } from "react-native";

import { Action } from "redux";
import { INews } from "../../models";
import { store } from "../store";

// Define Actions const and type
export const LOAD_NEWS_SUCCESS = "LOAD_NEWS_SUCCESS";
export type LOAD_NEWS_SUCCESS = typeof LOAD_NEWS_SUCCESS;

export const LOAD_NEWS_FAILURE = "LOAD_NEWS_FAILURE";
export type LOAD_NEWS_FAILURE = typeof LOAD_NEWS_FAILURE;

export interface ILoadNewsSuccessAction extends Action {
    type: LOAD_NEWS_SUCCESS;
    news: INews[];
}

export interface ILoadNewsFailureAction extends Action {
    type: LOAD_NEWS_FAILURE;
}

// Collection of both for easier integration
export type NewsActions = ILoadNewsSuccessAction | ILoadNewsFailureAction;

export let loadNewsSuccess = (news: INews[]) => {
    return {
        news,
        type: LOAD_NEWS_SUCCESS,
    };
};

export let loadNewsFailure = (): ILoadNewsFailureAction => {
    return {
        type: LOAD_NEWS_FAILURE,
    };
};

export const getNews = async () => {
    try {
        const token = store.getState().user.user.token;
        axios
            .get<INews[]>(
                "http://api.coinmarketnews.app/news",
                {
                    headers: {
                        token,
                    },
                },
            ).then((result) => {
                AsyncStorage.setItem("@CoinMarketNews:newsStore", JSON.stringify(result.data));
                store.dispatch(loadNewsSuccess(result.data));
            }).catch(async () => {
                try {
                    const news = await AsyncStorage.getItem("@CoinMarketNews:newsStore");
                    if (news !== null) {
                        store.dispatch(loadNewsSuccess(JSON.parse(news)));
                    }
                } catch (error) {
                    store.dispatch(loadNewsFailure());
                }
            });

    } catch (error) {
        store.dispatch(loadNewsFailure());
    }
};
