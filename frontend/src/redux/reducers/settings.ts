import { ISettings } from "../../models";
import { CHANGE_SETTINGS, LOAD_SETTINGS, SettingsActions  } from "../actions/settings";

export interface ISettingsState {
    settings: ISettings;
}

const defaultSettingsState: ISettingsState = {
    settings: {
        cryptoCurrency: "BTC",
        darkMode: false,
        fiatCurrency: "USD",
        pushNotifications: false,
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
