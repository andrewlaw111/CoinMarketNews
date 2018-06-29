
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
            };
        case ADD_NEWS_ALERT:
            const addNewsAlerts = state.newsAlerts.slice()
            addNewsAlerts.push(action.newsAlert);
            return {
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
            };
        case LOAD_ALERTS:
            return {
                newsAlerts: action.newsAlerts,
                priceAlerts: action.alerts, // Use concat to add a new link
            };

        case REMOVE_ALERT:
            let removeAlerts = state.priceAlerts.slice();

            removeAlerts = removeAlerts.filter((alert) => alert.id !== action.removeAlert.id)
            return {
                priceAlerts: removeAlerts, // Use concat to add a new link
            };

        case REMOVE_NEWS_ALERT:
            let removeNewsAlerts = state.priceAlerts.slice();

            removeNewsAlerts = removeAlerts.filter((alert) => alert.id !== action.removeNewsAlert)
            return {
                newsAlerts: removeNewsAlerts, // Use concat to add a new link
            };
        default:
            return state; // Do not change the state in case of any other actions
    }
};
