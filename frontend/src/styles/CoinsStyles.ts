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

export const styles = (darkMode: boolean) => StyleSheet.create({
    NoFavourites: {
        color: (darkMode) ? darkFont : lightFont,
        textAlign: "center",
    },
    coinList: {
        backgroundColor: (darkMode) ? darkBackground : lightBackground,
        flex: 1,
    },
    coinListComponent: {
        backgroundColor: (darkMode) ? darkBackground : lightBackground,
        flex: 1,
    },
    coinName: {
        color: (darkMode) ? darkFont : lightFont,
        fontSize: 18,
        fontWeight: "bold",
        marginRight: (smallDevice) ? 5 : 10,
    },
    coinPrice: {
        color: (darkMode) ? "#C2C2C2" : "#666",
        fontSize: 16,
        fontWeight: "bold",
    },
    coinSymbol: {
        color: (darkMode) ? "#D8D8D8" : "#666",
    },
    coinText: {
        color: (darkMode) ? darkFont : lightFont,
        textAlign: "center",
        width: 37,
    },
    coinThumbnail: {
        backgroundColor: "grey",
        borderRadius: (smallDevice) ? 40 : 50,
        height: (smallDevice) ? 40 : 50,
        margin: 0,
        width: (smallDevice) ? 40 : 50,
    },
    cryptoSymbol: {
        color: (this.props.appSettings.darkMode) ? "#C2C2C2" : "#5E5E5E",
        fontFamily: "Font Awesome 5 Brands",
    },
    listCoin: {
        backgroundColor: (darkMode) ? darkItems : lightItems,
        flex: 1,
        flexDirection: "row",
    },
    listCoinBody: {
        flex: 0.46,
        justifyContent: "center",
        paddingLeft: (smallDevice) ? 5 : 10,
        paddingRight: (smallDevice) ? 5 : 10,
    },
    listCoinLeft: {
        alignItems: "center",
        flex: 0.26,
        flexDirection: "row",
        justifyContent: "space-between",
        paddingLeft: (smallDevice) ? 5 : 10,
    },
    listCoinName: {
        flexDirection: "row",
    },
    listCoinRight: {
        alignItems: "center",
        flex: 0.28,
        flexDirection: "row",
        justifyContent: "flex-end",
        paddingRight: (smallDevice) ? 5 : 10,
    },
    listCoinRightText: {
    },
    listItem: {
        backgroundColor: (darkMode) ? darkItems : lightItems,
        borderColor: (darkMode) ? darkItemsBorder : lightItemsBorder,
        borderWidth: 0.5,
    },
    listStyle: {
        paddingTop: -100,
    },
    safeAreaView: {
        backgroundColor: (darkMode) ? "#343a44" : "#F8F8F8",
        flex: 1,
    },
});
