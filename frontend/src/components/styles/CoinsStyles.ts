import { StyleSheet } from "react-native";

export const styles = (darkMode: boolean) => StyleSheet.create({
    coinList: {
        backgroundColor: (darkMode) ? "#2f343f" : "#FFF",
        flex: 1,
    },
    coinListComponent: {
        backgroundColor: (darkMode) ? "#2f343f" : "#FFF",
        flex: 1,
    },
    coinName: {
        color: (darkMode) ? "#F8F8F8" : "#000",
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
        color: (darkMode) ? "#F8F8F8" : "#000",
        textAlign: "center",
        width: 37,
    },
    coinThumbnail: {
        backgroundColor: "grey",
        margin: 0,
    },
    listCoin: {
        backgroundColor: (darkMode) ? "#454951" : "#FFF",
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
        borderColor: (darkMode) ? "#5d626d" : "#d6d7da",
        backgroundColor: (darkMode) ? "#454951" : "#FFF",
        borderWidth: 0.5,
    },
    listStyle: {
        paddingTop: -100,
    },
    NoFavourites: {
        textAlign: "center",
        color: (darkMode) ? "#F8F8F8" : "#000"
    }
});