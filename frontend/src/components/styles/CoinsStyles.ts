import {StyleSheet} from "react-native";

const coinsStyles = StyleSheet.create({
    coinList: {
        flex: 0,
    },
    coinListComponent: {
    },
    coinListFilters: {
        backgroundColor: "#000",
        flex: 0,
    },
    coinName: {
        fontWeight: "bold",
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
    nopadding: {
        paddingLeft: 0,
        paddingRight: 0,
    },
    smallpadding: {
        paddingLeft: 5,
        paddingRight: 5,
    },
});

export default coinsStyles