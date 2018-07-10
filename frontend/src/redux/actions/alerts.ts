import axios from "axios";
import { AsyncStorage } from "react-native";
import Config from "react-native-config";
import { Action, Dispatch } from "redux";

import { IAlerts, INewsAlert, IPriceAlert, IUser } from "../../models";
import { store } from "../store";

// Define Actions const and type
export const ADD_ALERT = "ADD_ALERT";
export type ADD_ALERT = typeof ADD_ALERT;

export const LOAD_ALERTS = "LOAD_ALERTS";
export type LOAD_ALERTS = typeof LOAD_ALERTS;

export const EDIT_ALERT = "EDIT_ALERT";
export type EDIT_ALERT = typeof EDIT_ALERT;

export const REMOVE_ALERT = "REMOVE_ALERT";
export type REMOVE_ALERT = typeof REMOVE_ALERT;

export const ADD_NEWS_ALERT = "ADD_NEWS_ALERT";
export type ADD_NEWS_ALERT = typeof ADD_NEWS_ALERT;

export const REMOVE_NEWS_ALERT = "REMOVE_NEWS_ALERT";

export type REMOVE_NEWS_ALERT = typeof REMOVE_NEWS_ALERT;

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
    newsAlerts: INewsAlert;
}

export interface IRemoveAlertsAction extends Action {
    type: REMOVE_ALERT;
    removeAlert: IAlerts;
}
export interface IAddNewsAlertsAction extends Action {
    type: ADD_NEWS_ALERT;
    newsAlert: INewsAlert;
}
export interface IRemoveNewsAlertsAction extends Action {
    type: REMOVE_NEWS_ALERT;
    removeNewsAlert: number;
}

export type AlertsActions = (
    IAddAlertsAction |
    IEditAlertsAction |
    ILoadAlertsAction |
    IRemoveAlertsAction |
    IAddNewsAlertsAction |
    IRemoveNewsAlertsAction
);

export const addAlertsToStore = (alerts: IAlerts): IAddAlertsAction => {
    return {
        newAlert: alerts,
        type: ADD_ALERT,
    };
};

export const addAlerts = (alerts: IAlerts, token: string) => {
    const alertToServer = {
        active: true,
        coinmarketcap_id: alerts.coinmarketcap_id,
        currency_symbol: alerts.currency_symbol,
        price_point: alerts.price_point,
        upper: alerts.upper,
    };
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
                    },

            ).then((response) => {
                alerts.id = response.data;
                return dispatch(addAlertsToStore(alerts));
            });
        };
    } else {
        AsyncStorage.getItem("@CoinMarketNews:userToken").then((storageToken) => {
            addAlerts(alerts, storageToken);
            return;
        });
    }
};

export const editAlert = (alerts: IAlerts, token: string) => {
    if (token) {
        axios
            .put(
                `${Config.API_SERVER}/user/price_alert`,
                {
                    active: alerts.active,
                    priceID: alerts.id,
                },
                {
                    headers: {
                        token,
                    },
                },
        );
        return {
            editAlert: alerts,
            type: EDIT_ALERT,
        };
    } else {
        AsyncStorage.getItem("@CoinMarketNews:userToken").then((storageToken) => {
            addAlerts(alerts, storageToken);
            return;
        });
    }
};

export const loadAlertsToStore = (alerts: IPriceAlert[], newsAlerts: INewsAlert[]) => {
    return {
        alerts,
        newsAlerts,
        type: LOAD_ALERTS,
    };
};

export const loadAlerts = async (user: IUser) => {
    if (typeof user !== "undefined") {
        store.dispatch(loadAlertsToStore(user.price_alert, user.news_alert));
    }
};
export const addNewsAlertToStore = (newsAlert: INewsAlert): IAddNewsAlertsAction => {
    return {
        newsAlert,
        type: ADD_NEWS_ALERT,
    };
};
export const removeNewsAlertFromStore = (coinID: number): IRemoveNewsAlertsAction => {
    return {
        removeNewsAlert: coinID,
        type: REMOVE_NEWS_ALERT,
    };
};
export const addNewsAlert = (coinID: number, token: string) => {
    return (dispatch: Dispatch<IAddNewsAlertsAction>) => {
        return axios
            .post(
                `${Config.API_SERVER}/user/news_alert`,
                {
                    coinID,
                },
                {
                    headers: {
                        token,
                    },
                },
        ).then((response) => {
            const alert = {
                alert: true,
                coin_id: coinID,
                id: response.data[0],
            };
            return dispatch(addNewsAlertToStore(alert));
        }).catch((err) => {
            // tslint:disable-next-line:no-console
            console.error(err);
        });
    };
};

export const removeNewsAlert = (coinID: number, token: string) => {
    return (dispatch: Dispatch<IRemoveNewsAlertsAction>) => {
        return axios
            .delete(
                `${Config.API_SERVER}/user/news_alert`,
                {
                    data: {
                        coinID,
                    },
                    headers: {
                        token,
                    },
                },
        ).then(() => {
            return dispatch(removeNewsAlertFromStore(coinID));
        }).catch((err) => {
            // tslint:disable-next-line:no-console
            console.error(err);
        });
    };

};

export const removeAlerts = (alerts: IAlerts, token: string) => {
    if (token) {
        axios
            .delete(
                `${Config.API_SERVER}/user/price_alert`,
                {
                    data: {
                        priceID: alerts.id,
                    },
                    headers: {
                        token,
                    },
                },
        );
        return {
            removeAlert: alerts,
            type: REMOVE_ALERT,
        };
    } else {
        AsyncStorage.getItem("@CoinMarketNews:userToken").then((storageToken) => {
            removeAlerts(alerts, storageToken);
            return;
        });
    }
};
