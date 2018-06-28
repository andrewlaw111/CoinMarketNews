
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
            console.log(addAlerts);
            return {
                alerts: addAlerts, // Use concat to add a new link
            };

        case EDIT_ALERT:
            const editAlert = state.alerts.slice()
            const editedAlerts = editAlert.map((alert) => {
                if (alert.alertID === action.editAlert.alertID) {
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
            const removeAlerts = state.alerts.slice();

            removeAlerts.filter((alert) => alert.alertID !== action.removeAlert.alertID)

            return {
                alerts: removeAlerts, // Use concat to add a new link
            };
        default:
            return state; // Do not change the state in case of any other actions
    }
};
