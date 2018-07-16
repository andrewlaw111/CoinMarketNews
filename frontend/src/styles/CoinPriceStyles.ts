import { Dimensions, StyleSheet } from "react-native";

const styles = (darkMode: boolean) => StyleSheet.create({
    bold: {
        fontWeight: 'bold',
    },
    card: {
        backgroundColor: (darkMode) ? "#454951" : "#FFF",
        borderColor: (darkMode) ? "#41444c" : "#E1E1E1",
        flex: 0.4
    },
    cardItem: {
        backgroundColor: (darkMode) ? "#454951" : "#FFF",
    },
    cardMarketData: {
        backgroundColor: (darkMode) ? "#454951" : "#FFF",
        borderColor: (darkMode) ? "#41444c" : "#E1E1E1",
        marginBottom: 20,
    },
    coinInfoStats: {
        flex: 1,
    },
    coinInfoStatsLine: {
        flex: 1,
        flexDirection: "row",
        justifyContent: "space-between",
    },
    coinInfoStatsText: {
        color: (darkMode) ? "#F8F8F8" : "#000",
    },
    coinInfoStatsTextRight: {
        marginLeft: 40,
    },
    price: {
        backgroundColor: (darkMode) ? "#2f343f" : "#FFF",
        flex: 1,
    },
    priceWidgetCard: {
        backgroundColor: (darkMode) ? "#454951" : "#FFF",
        borderColor: (darkMode) ? "#41444c" : "#E1E1E1",
        flex: 0.4,
    },
    webView: {
        backgroundColor: (darkMode) ? "#2f343f" : "#FFF",
        borderColor: (darkMode) ? "#41444c" : "#E1E1E1",
        height: (Dimensions.get("window").height - 140) / 2,
    },
})

export default styles;