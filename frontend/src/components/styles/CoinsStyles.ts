import { StyleSheet } from "react-native";

let template = (darkMode: boolean) => StyleSheet.create({
    coinList: {
        backgroundColor: (darkMode) ? "#2f343f" : null,
        flex: 0,
    },
    coinListComponent: {
        backgroundColor: (darkMode) ? "#454951" : null,
        flex: 1,
    },
    coinName: {
        color: (darkMode) ? "#F8F8F8" : null,
        fontSize: 18,
        fontWeight: "bold",
        marginRight: 10,
    },
    coinPrice: {
        color: "#C2C2C2",
        fontWeight: "bold",
        fontSize: 16,
    },
    coinSymbol: {
        color: "#D8D8D8"
    },
    coinText: {
        color: (darkMode) ? "#F8F8F8" : null,
        textAlign: "center",
        width: 37,
    },
    coinThumbnail: {
        backgroundColor: "grey",
        margin: 0,
    },
    listCoin: {
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
        // justifyContent: "space-between",
    },
    listCoinRight: {
        alignItems: "center",
        flex: 0.30,
        flexDirection: "row",
        justifyContent: "flex-end",
        paddingRight: 10,
        // right: -,
    },
    listCoinRightText: {
        // textAlign: "right",
    },
    listItem: {
        borderColor: (darkMode) ? "#5d626d" : "#d6d7da",
        backgroundColor: (darkMode) ? "#454951" : null,
        borderWidth: 0.5,
    },
    listStyle: {
        paddingTop: -100,
    },
    NoFavourites: {
        textAlign: "center",
    }
});

export const coinsStyles = template(false);

export const darkCoinsStyles = template(true);