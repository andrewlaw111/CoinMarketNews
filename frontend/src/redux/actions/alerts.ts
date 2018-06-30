import { AsyncStorage } from "react-native";

import { Action, Dispatch } from "redux";
import { store } from "../store";
import { IAlerts, IUser, IPriceAlert, INewsAlert } from "../../models";
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

export type AlertsActions = IAddAlertsAction | IEditAlertsAction | ILoadAlertsAction | IRemoveAlertsAction | IAddNewsAlertsAction | IRemoveNewsAlertsAction;

export const addAlertsToStore = (alerts: IAlerts): IAddAlertsAction => {
    return {
        newAlert: alerts,
        type: ADD_ALERT,
    };

}

export const addAlerts = (alerts: IAlerts, token: string) => {
    const alertToServer = {
        coinmarketcap_id: alerts.coinmarketcap_id,
        currency_symbol: alerts.currency_symbol,
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
                    return dispatch(addAlertsToStore(alerts))
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

export const loadAlertsToStore = (alerts: IPriceAlert[], newsAlert: INewsAlert[]) => {
    return {
        alerts: alerts,
        newsAlerts: newsAlert,
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
        newsAlert: newsAlert,
        type: ADD_NEWS_ALERT,
    };
}
export const removeNewsAlertFromStore = (coinID: number): IRemoveNewsAlertsAction => {
    return {
        removeNewsAlert: coinID,
        type: REMOVE_NEWS_ALERT,
    };
}
export const addNewsAlert = (coinID: number, token: string) => {
    return (dispatch: Dispatch<IAddNewsAlertsAction>) => {
        return axios
            .post(
                `${Config.API_SERVER}/user/news_alert`,
                {
                    coinID: coinID
                },
                {
                    headers: {
                        token,
                    },
                }

            ).then((response) => {
                const alert = {
                    id: response.data[0],
                    coin_id: coinID,
                    alert: true,
                }
                return dispatch(addNewsAlertToStore(alert))
            }).catch((err) => {
                console.error(err);
            })
    }
};

export const removeNewsAlert = (coinID: number, token: string) => {
    return (dispatch: Dispatch<IRemoveNewsAlertsAction>) => {
        return axios
            .delete(
                `${Config.API_SERVER}/user/news_alert`,
                {
                    headers: {
                        token,
                    },
                    data: {
                        coinID: coinID
                    }
                },
        ).then((response) => {
            // console.error("remove", response.data)
            return dispatch(removeNewsAlertFromStore(coinID))
        }).catch((err) => {
            console.error(err);
        })
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
