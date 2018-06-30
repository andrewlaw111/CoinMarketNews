import { StyleSheet } from "react-native";

const styles = (darkMode: boolean) => StyleSheet.create({
    AddAlertView: {
        justifyContent: "flex-end",
        alignItems: "center",
        height: 60,
        paddingLeft: 20,
        paddingRight: 20,
    },
    alertsPage: {
        backgroundColor: (darkMode) ? "#2f343f" : "#FFF",
        flex: 1,
        paddingBottom: 20,
    },
    NewsAlertsView: {
        flexDirection: "row",
        justifyContent: "space-between",
        alignItems: "center",
        height: 60,
        paddingLeft: 15,
        paddingRight: 15,
        borderBottomWidth: 1,
        borderColor: "#F8F8F8",
    },
    text: {
        color: (darkMode) ? "#F8F8F8" : "#000"
    }
});

export default styles