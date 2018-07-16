import { StyleSheet } from "react-native";

const styles = (darkMode: boolean) => StyleSheet.create({
    card: {
        backgroundColor: (darkMode) ? "#454951" : "#F8F8F8",
        borderColor: (darkMode) ? "#41444c" : "#E1E1E1",
    },
    cardItem: {
        backgroundColor: (darkMode) ? "#454951" : "#F8F8F8",
        paddingBottom: 10,
        paddingLeft: 10,
        paddingRight: 10,
        paddingTop: 10,
    },
    cardText: {
        color: (darkMode) ? "#F8F8F8" : "#000",
    },
    headingText: {
        color: (darkMode) ? "#F8F8F8" : "#000",
        fontSize: 14,
        fontWeight: "bold",
        paddingRight: 25,
    },
    news: {
        backgroundColor: (darkMode) ? "#2f343f" : "#F8F8F8",
    },
    newsCounter: {
        color: "#ffa236",
        fontSize: 14,
    },
    newsCounterIcon: {
        color: "#ffa236",
        fontSize: 15,
        width: 13,
    },
    newsIcons: {
        backgroundColor: "grey",
        borderRadius: 50,
        height: 25,
        marginRight: 6,
        width: 25,
    },
    newsSourceIcon: {
        height: 30,
        marginRight: 8,
        width: 30,
    },
    newsText: {
        color: (darkMode) ? "#F8F8F8" : "#a3a3a2",
        fontSize: 14,
    },
});
export default styles;