import React from "react";

import { StyleSheet, Text, View } from "react-native";

export default class Splash extends React.Component {
    public render() {
        return (
            <View style={styles.splash}>
                <View>
                    <Text>Coin Market News</Text>
                </View>
            </View>
        );
    }
}

const styles = StyleSheet.create({
    splash: {
        alignItems: "center",
        justifyContent: "center",
    },
});
