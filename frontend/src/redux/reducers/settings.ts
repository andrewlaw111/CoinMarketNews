import { CHANGE_SETTINGS, SettingsActions, LOAD_SETTINGS } from "../actions/settings";
import { ISettings } from "../../models";

export interface ISettingsState {
    settings: ISettings;
}

const defaultSettingsState: ISettingsState = {
    settings: {
        fiatCurrency: 1,
        cryptoCurrency: 1,
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
            console.log("loadSettings: ", action.settings);
            return {
                settings: action.settings, // Use concat to add a new link
            };
        default:
            return state; // Do not change the state in case of any other actions
    }
};
