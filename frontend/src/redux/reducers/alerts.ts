
import { IAlerts, INewsAlert } from "../../models";
import { AlertsActions, ADD_ALERT, REMOVE_ALERT, LOAD_ALERTS, EDIT_ALERT, ADD_NEWS_ALERT, REMOVE_NEWS_ALERT } from "../actions/alerts";

export interface IAlertsState {
    priceAlerts: IAlerts[];
    newsAlerts: INewsAlert[];
}

const defaultAlertsState: IAlertsState = {
    priceAlerts: [],
    newsAlerts: []
};

export const alertsReducer = (state: IAlertsState = defaultAlertsState, action: AlertsActions) => {
    switch (action.type) {
        case ADD_ALERT:
            const addAlerts = state.priceAlerts.slice()
            addAlerts.push(action.newAlert);
            return {
                priceAlerts: addAlerts, // Use concat to add a new link
                newsAlerts: state.newsAlerts
            };
        case ADD_NEWS_ALERT:
            const addNewsAlerts = state.newsAlerts.slice()
            addNewsAlerts.push(action.newsAlert);
            return {
                priceAlerts: state.priceAlerts,
                newsAlerts: addNewsAlerts, // Use concat to add a new link
            };
        case EDIT_ALERT:
            const editAlert = state.priceAlerts.slice()
            const editedAlerts = editAlert.map((alert) => {
                if (alert.id === action.editAlert.id) {
                    alert = action.editAlert;
                }
                return alert;
            });

            return {
                priceAlerts: editedAlerts, // Use concat to add a new link 87
                newsAlerts: state.newsAlerts
            };
        case LOAD_ALERTS:

            if (typeof action.newsAlerts === "undefined") {
                return {
                    priceAlerts: action.alerts, // Use concat to add a new link
                    newsAlerts: action.newsAlerts,
                }
            } else if (typeof action.alerts === "undefined") {
                return {
                    priceAlerts: state.priceAlerts,
                    newsAlerts: action.newsAlerts,
                };
            } else {
                return {
                    newsAlerts: action.newsAlerts,
                    priceAlerts: action.alerts, // Use concat to add a new link
                };
            }

        case REMOVE_ALERT:
            let removeAlerts = state.priceAlerts.slice();

            removeAlerts = removeAlerts.filter((alert) => alert.id !== action.removeAlert.id)
            return {
                priceAlerts: removeAlerts, // Use concat to add a new link
                newsAlerts: state.newsAlerts
            };

        case REMOVE_NEWS_ALERT:
            let removeNewsAlerts = state.newsAlerts.slice();

            removeNewsAlerts = removeNewsAlerts.filter((alert) => alert.coin_id !== action.removeNewsAlert)
            return {
                priceAlerts: state.priceAlerts,
                newsAlerts: removeNewsAlerts, // Use concat to add a new link
            };
        default:
            return state; // Do not change the state in case of any other actions
    }
};
