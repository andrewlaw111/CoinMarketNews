import { Dimensions, Platform, StyleSheet } from "react-native";
import { darkItemsBorder, lightItemsBorder } from "./colours";

const style = (darkMode: boolean) => StyleSheet.create({
    activeButtonTextAndroid: {
        color: "#F8F8F8",
    },
    alertArrow: {
        backgroundColor: "transparent",
        flexDirection: "row",
        height: 40,
        justifyContent: "center",
    },
    buttons: {
        alignItems: "center",
        backgroundColor: ((Platform.OS === "android") ? "#3f78ba" : "#007aff"),
        borderColor: (darkMode) ? "#F8F8F8" : "#454951",
        borderRadius: 5,
        flexDirection: "row",
        justifyContent: "center",
        marginBottom: 10,
        marginTop: 10,
        width: 200,
    },
    buttonsView: {
        alignItems: "center",
    },
    modalForm: {
        backgroundColor: (darkMode) ? "#454951" : "#F8F8F8",
        borderColor: (darkMode) ? darkItemsBorder : lightItemsBorder,
        borderRadius: 10,
        borderWidth: 1,
        bottom: -Dimensions.get("window").height - 50,
        elevation: 20,
        height: Dimensions.get("window").height + 150,
        marginLeft: 5,
        marginRight: 5,
        paddingBottom: Dimensions.get("window").height - 250,
        shadowColor: "#000",
        shadowOffset: { width: 15, height: 15 },
        shadowOpacity: 0.1,
        shadowRadius: 10,
    },
    modalFormComponentsWrapper: {
        alignItems: "center",
        flex: 0.8,
        justifyContent: "space-between",
        paddingLeft: 20,
        paddingRight: 20,
    },
    modalHeading: {
        backgroundColor: "transparent",
        flex: 0.2,
        flexDirection: "row",
        justifyContent: "center",
    },
    segment: {
        backgroundColor: (darkMode) ? "#454951" : "#F8F8F8",
    },
    segmentButton: {
        borderColor: (darkMode) ? darkItemsBorder : lightItemsBorder,
    },
    text: {
        color: (darkMode) ? "#F8F8F8" : "#000",
    },
    textButton: {
        color: (darkMode) ? "#F8F8F8" : "#fff",
    },
    textInput: {
        backgroundColor: "#F8F8F8",
        borderColor: "gray",
        borderRadius: 5,
        borderWidth: 1,
        flex: 1,
        height: 40,
        paddingLeft: 4,
    },
    textSegmentButton: {
        color: (darkMode) ? "#007aff" : "#000",
    },
    textSegmentButtonActive: {
        color: "#F8F8F8",
    },
});

export default style;