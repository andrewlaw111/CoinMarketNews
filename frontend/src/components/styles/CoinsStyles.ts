import { StyleSheet } from "react-native";
import { darkBackground, lightBackground, darkFont, lightFont, darkItems, lightItems, darkItemsBorder, lightItemsBorder } from "./colours";

export const styles = (darkMode: boolean) => StyleSheet.create({
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
        marginRight: 10,
    },
    coinPrice: {
        color: (darkMode) ? "#C2C2C2" : "#666",
        fontWeight: "bold",
        fontSize: 16,
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
        margin: 0,
        width: 50,
        height: 50,
        borderRadius:50,
    },
    listCoin: {
        backgroundColor: (darkMode) ? darkItems : lightItems,
        flex: 1,
        flexDirection: "row",
    },
    listCoinBody: {
        flex: 0.44,
        justifyContent: "center",
        paddingLeft: 10,
        paddingRight: 10,
    },
    listCoinLeft: {
        alignItems: "center",
        flex: 0.26,
        flexDirection: "row",
        justifyContent: "space-between",
        paddingLeft: 10,
    },
    listCoinName: {
        flexDirection: "row",
    },
    listCoinRight: {
        alignItems: "center",
        flex: 0.30,
        flexDirection: "row",
        justifyContent: "flex-end",
        paddingRight: 10,
    },
    listCoinRightText: {
    },
    listItem: {
        borderColor: (darkMode) ? darkItemsBorder : lightItemsBorder,
        backgroundColor: (darkMode) ? darkItems : lightItems,
        borderWidth: 0.5,
    },
    listStyle: {
        paddingTop: -100,
    },
    NoFavourites: {
        textAlign: "center",
        color: (darkMode) ? darkFont : lightFont
    },
    safeAreaView: {
        flex: 1,
        backgroundColor: (darkMode) ? "#343a44" : '#F8F8F8'
    }
});