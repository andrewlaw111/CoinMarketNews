import { INews } from "../../models";
import { LOAD_NEWS_FAILURE, LOAD_NEWS_SUCCESS, NewsActions } from "../actions/news";

export interface INewsState {
    news: INews[];
}

export const newsReducer = (state: INewsState = { news: [] }, action: NewsActions) => {
    switch (action.type) {
        case LOAD_NEWS_SUCCESS:
            return {
                news: action.news, 
            };
        case LOAD_NEWS_FAILURE:
            return {
            };
        default:
            return state; 
    }
};
