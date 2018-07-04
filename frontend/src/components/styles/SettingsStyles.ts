import { StyleSheet, Dimensions } from "react-native";
import { darkItemsBorder, lightItemsBorder, darkBackground, lightBackground, darkFont, lightFont, darkItems, lightItems } from "./colours";

const small_device = Dimensions.get("window").width < 350;

const styles = (darkMode: boolean) => StyleSheet.create({
    settingsItem: {
        backgroundColor: (darkMode) ? darkItems : lightItems,
        flex: 1,
        flexDirection: "row",
        justifyContent: "space-between",
        alignItems: "center",
        paddingLeft: 10,
    },
    CoinIcon: {
        tintColor: (darkMode) ? "#FFFFFF" : "#000000",
    },
    picker: {
        color: (darkMode) ? darkFont : lightFont,
        height: 50,
        width: 100
    },
    Settings: {
        paddingTop: 50,
        paddingBottom: 20,
        backgroundColor: (darkMode) ? darkBackground : lightBackground,
    },
    SettingsIcon: {
        color: (darkMode) ? darkFont : lightFont,
        // marginRight: 15,
    },
    SettingsIconWrapper: {
        width: 40,
        marginRight: (small_device) ? 10 : 20,
        alignItems: "center"
    },
    settingsRight: {
        flex: 1,
        flexDirection: "row",
        justifyContent: "space-between",
        alignItems: "center",
        borderColor: (darkMode) ? darkItemsBorder : lightItemsBorder,
        height: 50,
        paddingRight: 10,
        borderBottomWidth: 1,
    },
    settingsText: {
        color: (darkMode) ? darkFont : lightFont,
    }
})

export default styles;