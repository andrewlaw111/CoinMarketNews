import { INews } from "../../models";
import { LOAD_NEWS_FAILURE, LOAD_NEWS_SUCCESS, NewsActions } from "../actions/news";

export interface INewsState {
    news: INews[];
}

export const newsReducer = (state: INewsState = { news: [] }, action: NewsActions) => {
    // Use switch to handle different actions
    switch (action.type) {
        case LOAD_NEWS_SUCCESS:
            return {
                news: action.news, // Use concat to add a new link
            };
        case LOAD_NEWS_FAILURE:
            return {
            };
        default:
            return state; // Do not change the state in case of any other actions
    }
};
