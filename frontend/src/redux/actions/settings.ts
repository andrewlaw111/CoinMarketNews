import { AsyncStorage } from "react-native";

import { Action } from "redux";
import { store } from "../store";
import { ISettings } from "../../models";

// Define Actions const and type
export const CHANGE_SETTINGS = "CHANGE_SETTINGS";
export type CHANGE_SETTINGS = typeof CHANGE_SETTINGS;

export const LOAD_SETTINGS = "LOAD_SETTINGS";
export type LOAD_SETTINGS = typeof LOAD_SETTINGS;

export interface IChangeSettingsAction extends Action {
    type: CHANGE_SETTINGS;
    settings: ISettings;
}

export interface ILoadSettingsAction extends Action {
    type: LOAD_SETTINGS;
    settings: ISettings;
}

export type SettingsActions = IChangeSettingsAction | ILoadSettingsAction;

export const changeSettings = (settings: ISettings) => {
    AsyncStorage.setItem("@CoinMarketNews:settingsStore", JSON.stringify(settings));
    return {
        settings,
        type: CHANGE_SETTINGS,
    };
};

export const loadSettingsToStore = (settings: ISettings) => {
    return {
        settings: settings,
        type: LOAD_SETTINGS,
    };
};

export const loadSettings = async () => {

    const settings = await AsyncStorage.getItem("@CoinMarketNews:settingsStore");
    if (settings !== null) {
        store.dispatch(loadSettingsToStore(JSON.parse(settings)));
        return JSON.parse(settings);
    } else {
        return;
    }
};