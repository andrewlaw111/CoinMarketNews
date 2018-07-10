import { StyleSheet } from "react-native";

const styles = (darkMode: boolean) => StyleSheet.create({
    AddAlertView: {
        alignItems: "center",
        height: 60,
        justifyContent: "flex-end",
        paddingLeft: 20,
        paddingRight: 20,
    },
    NewsAlertsView: {
        alignItems: "center",
        borderBottomWidth: 1,
        borderColor: "#F8F8F8",
        flexDirection: "row",
        height: 60,
        justifyContent: "space-between",
        paddingLeft: 15,
        paddingRight: 15,
    },
    alertsPage: {
        backgroundColor: (darkMode) ? "#2f343f" : "#FFF",
    },
    cryptoCurrencySymbol: {
        color: (this.props.appSettings.darkMode) ? "#C2C2C2" : "#5E5E5E",
        fontFamily: "Font Awesome 5 Brands",
    },
    newsAlertTextView: {
        flex: 0.8,
        flexWrap: "wrap",
    },
    switch: {
        flex: 0.2,
    },
    text: {
        color: (darkMode) ? "#F8F8F8" : "#000",
    },
});

export default styles;
