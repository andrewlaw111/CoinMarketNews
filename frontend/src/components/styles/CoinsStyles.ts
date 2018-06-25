import { StyleSheet } from "react-native";

export const coinsStyles = StyleSheet.create({
    coinList: {
        flex: 0,
        marginBottom: 35,
    },
    coinListComponent: {
    },
    coinName: {
        fontWeight: "bold",
        marginRight: 10,
    },
    coinPrice: {
        fontWeight: "bold",
        fontSize: 16,
    },
    coinSymbol: {
        color: "#D8D8D8"
    },
    coinText: {

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
        justifyContent: "space-between",
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
        borderColor: "#d6d7da",
        borderWidth: 0.5,
    },
    listStyle: {
        paddingTop: -100,
    },
});

export const darkCoinsStyles = StyleSheet.create({
    coinList: {
        backgroundColor: "#2f343f",
        flex: 0,
    },
    coinListComponent: {
        backgroundColor: "#454951",
        flex: 1,
    },
    coinName: {
        color: "#F8F8F8",
        fontWeight: "bold",
        fontSize: 18,
        marginRight: 10,
    },
    coinPrice: {
        fontWeight: "bold",
        color: "#E2E2E2",
        fontSize: 16
    },
    coinSymbol: {
        color: "#D8D8D8"
    },
    coinText: {
        color: "#F8F8F8"
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
        justifyContent: "flex-start",
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
        borderColor: "#5d626d",
        backgroundColor: "#454951",
        borderWidth: 0.5,
    },
    listStyle: {
        paddingTop: -100,
    },
});