import { StyleSheet } from "react-native";

const styles = (darkMode: boolean, active?: boolean) => StyleSheet.create({
    buttonText: {
        color: (darkMode) ? "#F8F8F8" : (active) ? "#F8F8F8" : "#6b6b6b",
        paddingLeft: 0,
        paddingRight: 0,
    },
    buttons: {
        backgroundColor: (darkMode) ? (active) ? "#3f78ba" : "#343a44" : (active) ? "#3f78ba" : "#F8F8F8",
        borderColor: (darkMode) ? "#343a44" : "#F8F8F8",
        borderRadius: 5,
        paddingLeft: 5,
        paddingRight: 5,
    },
    coinListFilters: {
        backgroundColor: (darkMode) ? "#343a44" : "#F8F8F8",
    },
    gridStyle: {
        borderBottomColor: (darkMode) ? "#555" : "#888",
        borderBottomWidth: 0.5,
        flex: 0,
    },
});

export default styles;