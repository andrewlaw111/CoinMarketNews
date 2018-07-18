
import { IAlerts, INewsAlert } from "../../models";
import {
    ADD_ALERT,
    ADD_NEWS_ALERT,
    AlertsActions,
    EDIT_ALERT,
    LOAD_ALERTS,
    REMOVE_ALERT,
    REMOVE_NEWS_ALERT,
} from "../actions/alerts";

export interface IAlertsState {
    priceAlerts: IAlerts[];
    newsAlerts: INewsAlert[];
}

const defaultAlertsState: IAlertsState = {
    newsAlerts: [],
    priceAlerts: [],
};

export const alertsReducer = (state: IAlertsState = defaultAlertsState, action: AlertsActions) => {
    switch (action.type) {
        case ADD_ALERT:
            const addAlerts = state.priceAlerts.slice();
            addAlerts.push(action.newAlert);
            return {
                newsAlerts: state.newsAlerts,
                priceAlerts: addAlerts,
            };
        case ADD_NEWS_ALERT:
            const addNewsAlerts = state.newsAlerts.slice();
            addNewsAlerts.push(action.newsAlert);
            return {
                newsAlerts: addNewsAlerts,
                priceAlerts: state.priceAlerts,
            };
        case EDIT_ALERT:
            const editAlert = state.priceAlerts.slice();
            const editedAlerts = editAlert.map((alert) => {
                if (alert.id === action.editAlert.id) {
                    alert = action.editAlert;
                }
                return alert;
            });

            return {
                newsAlerts: state.newsAlerts,
                priceAlerts: editedAlerts,
            };
        case LOAD_ALERTS:

            if (typeof action.newsAlerts === "undefined") {
                return {
                    newsAlerts: action.newsAlerts,
                    priceAlerts: action.alerts,
                };
            } else if (typeof action.alerts === "undefined") {
                return {
                    newsAlerts: action.newsAlerts,
                    priceAlerts: state.priceAlerts,
                };
            } else {
                return {
                    newsAlerts: action.newsAlerts,
                    priceAlerts: action.alerts,
                };
            }

        case REMOVE_ALERT:
            let removeAlerts = state.priceAlerts.slice();

            removeAlerts = removeAlerts.filter((alert) => alert.id !== action.removeAlert.id);
            return {
                newsAlerts: state.newsAlerts,
                priceAlerts: removeAlerts,
            };

        case REMOVE_NEWS_ALERT:
            let removeNewsAlerts = state.newsAlerts.slice();

            removeNewsAlerts = removeNewsAlerts.filter((alert) => alert.coin_id !== action.removeNewsAlert);
            return {
                // [CODE REVIEW] Use spread operator
                newsAlerts: removeNewsAlerts,
                priceAlerts: state.priceAlerts,
            };
        default:
            return state; 
        }
};
