
import { IAlerts } from "../../models";
import { AlertsActions, ADD_ALERT, REMOVE_ALERT, LOAD_ALERTS, EDIT_ALERT } from "../actions/alerts";

export interface IAlertsState {
    alerts: IAlerts[];
}

const defaultAlertsState: IAlertsState = {
    alerts: []
};

export const alertsReducer = (state: IAlertsState = defaultAlertsState, action: AlertsActions) => {
    switch (action.type) {
        case ADD_ALERT:
            const addAlerts = state.alerts.slice()
            addAlerts.push(action.newAlert);
            return {
                alerts: addAlerts, // Use concat to add a new link
            };

        case EDIT_ALERT:
            const editAlert = state.alerts.slice()
            const editedAlerts = editAlert.map((alert) => {
                if (alert.id === action.editAlert.id) {
                    alert = action.editAlert;
                }
                return alert;
            });

            return {
                alerts: editedAlerts, // Use concat to add a new link
            };
        case LOAD_ALERTS:
            return {
                alerts: action.alerts, // Use concat to add a new link
            };

        case REMOVE_ALERT:
            let removeAlerts = state.alerts.slice();
            
            removeAlerts = removeAlerts.filter((alert) => alert.id !== action.removeAlert.id)
            return {
                alerts: removeAlerts, // Use concat to add a new link
            };
        default:
            return state; // Do not change the state in case of any other actions
    }
};
