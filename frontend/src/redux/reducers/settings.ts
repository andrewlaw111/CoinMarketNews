import { CHANGE_SETTINGS, SettingsActions, LOAD_SETTINGS } from "../actions/settings";
import { ISettings } from "../../models";

export interface ISettingsState {
    settings: ISettings;
}

const defaultSettingsState: ISettingsState = {
    settings: {
        fiatCurrency: "USD",
        cryptoCurrency: "BTC",
        pushNotifications: false,
        darkMode: false,
    },
};

export const settingsReducer = (state: ISettingsState = defaultSettingsState, action: SettingsActions) => {
    switch (action.type) {
        case CHANGE_SETTINGS:
            return {
                settings: action.settings, // Use concat to add a new link
            };

        case LOAD_SETTINGS:
            return {
                settings: action.settings, // Use concat to add a new link
            };
        default:
            return state; // Do not change the state in case of any other actions
    }
};
