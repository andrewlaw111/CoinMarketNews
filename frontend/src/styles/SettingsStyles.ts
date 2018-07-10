import { Dimensions, StyleSheet } from "react-native";
import {
    darkBackground,
    darkFont,
    darkItems,
    darkItemsBorder,
    lightBackground,
    lightFont,
    lightItems,
    lightItemsBorder,
} from "./colours";

const smallDevice = Dimensions.get("window").width < 350;

const styles = (darkMode: boolean) => StyleSheet.create({
    CoinIcon: {
        tintColor: (darkMode) ? "#FFFFFF" : "#000000",
    },
    Settings: {
        backgroundColor: (darkMode) ? darkBackground : lightBackground,
        paddingBottom: 20,
        paddingTop: 50,
    },
    SettingsIcon: {
        color: (darkMode) ? darkFont : lightFont,
        // marginRight: 15,
    },
    SettingsIconWrapper: {
        alignItems: "center",
        marginRight: (smallDevice) ? 10 : 20,
        width: 40,
    },
    picker: {
        color: (darkMode) ? darkFont : lightFont,
        height: 50,
        width: 100,
    },
    settingsItem: {
        alignItems: "center",
        backgroundColor: (darkMode) ? darkItems : lightItems,
        flex: 1,
        flexDirection: "row",
        justifyContent: "space-between",
        paddingLeft: 10,
    },
    settingsRight: {
        alignItems: "center",
        borderBottomWidth: 1,
        borderColor: (darkMode) ? darkItemsBorder : lightItemsBorder,
        flex: 1,
        flexDirection: "row",
        height: 50,
        justifyContent: "space-between",
        paddingRight: 10,
    },
    settingsText: {
        color: (darkMode) ? darkFont : lightFont,
    },
});

export default styles;
