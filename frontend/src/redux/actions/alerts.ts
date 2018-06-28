import { AsyncStorage } from "react-native";

import { Action, Dispatch } from "redux";
import { store } from "../store";
import { IAlerts, IUser, IPriceAlert } from "../../models";
import axios from "axios";
import Config from "react-native-config";

// Define Actions const and type
export const ADD_ALERT = "ADD_ALERT";
export type ADD_ALERT = typeof ADD_ALERT;

export const LOAD_ALERTS = "LOAD_ALERTS";
export type LOAD_ALERTS = typeof LOAD_ALERTS;

export const EDIT_ALERT = "EDIT_ALERT";
export type EDIT_ALERT = typeof EDIT_ALERT;

export const REMOVE_ALERT = "REMOVE_ALERT";
export type REMOVE_ALERT = typeof REMOVE_ALERT;

export interface IAddAlertsAction extends Action {
    type: ADD_ALERT;
    newAlert: IAlerts;
}

export interface IEditAlertsAction extends Action {
    type: EDIT_ALERT;
    editAlert: IAlerts;
}

export interface ILoadAlertsAction extends Action {
    type: LOAD_ALERTS;
    alerts: IAlerts;
}

export interface IRemoveAlertsAction extends Action {
    type: REMOVE_ALERT;
    removeAlert: IAlerts;
}

export type AlertsActions = IAddAlertsAction | IEditAlertsAction | ILoadAlertsAction | IRemoveAlertsAction;

export const addAlertsToStore = (alerts: IAlerts):IAddAlertsAction => {
    return {
        newAlert: alerts,
        type: ADD_ALERT,
    };

}

export const addAlerts = (alerts: IAlerts, token: string) => {
    const alertToServer = {
        coinmarketcap_id: alerts.coinmarketcap_id,
        currency_symbol: alerts.currency,
        upper: alerts.upper,
        price_point: alerts.price_point,
        active: true
    }
    if (token) {
        return (dispatch: Dispatch<IAddAlertsAction>) => {
            return axios
                .post(
                    `${Config.API_SERVER}/user/price_alert`,
                    alertToServer,
                    {
                        headers: {
                            token,
                        },
                    }

                ).then((response) => {
                    alerts.id = response.data;
                    dispatch(addAlertsToStore(alerts))
                })
        }
    }
    else {
        AsyncStorage.getItem("@CoinMarketNews:userToken").then((token) => {
            addAlerts(alerts, token);
            return;
        });
    };
}
export const editAlert = (alerts: IAlerts, token: string) => {
    if (token) {
        axios
            .put(
                `${Config.API_SERVER}/user/price_alert`,
                {
                    priceID: alerts.id,
                    active: alerts.active
                },
                {
                    headers: {
                        token,
                    },
                }

            )
        return {
            editAlert: alerts,
            type: EDIT_ALERT,
        };
    }
    else {
        AsyncStorage.getItem("@CoinMarketNews:userToken").then((token) => {
            addAlerts(alerts, token);
            return;
        });
    };
}

export const loadAlertsToStore = (alerts: IPriceAlert[]) => {
    return {
        alerts: alerts,
        type: LOAD_ALERTS,
    };
};

export const loadAlerts = async (user: IUser) => {
    if (user.price_alert) {
        store.dispatch(loadAlertsToStore(user.price_alert));
    }

};

export const removeAlerts = (alerts: IAlerts, token: string) => {
    if (token) {
        axios
            .delete(
                `${Config.API_SERVER}/user/price_alert`,
                {
                    headers: {
                        token,
                    },
                    data: {
                        priceID: alerts.id,
                    }
                },
        )
        return {
            removeAlert: alerts,
            type: REMOVE_ALERT,
        };
    } else {
        AsyncStorage.getItem("@CoinMarketNews:userToken").then((token) => {
            removeAlerts(alerts, token);
            return;
        });
    }
}
