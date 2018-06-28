import React from "react";
import { connect } from "react-redux";

import { Body, Card, CardItem, Container, Text, StyleProvider, Icon } from "native-base";
import { StyleSheet, View, Switch, TouchableOpacity } from "react-native";

import getTheme from '../../native-base-theme/components';
import commonColour from '../../native-base-theme/variables/commonColor';

import { ICoin } from "../models";
import { IRootState } from "../redux/store";

interface ICoinsAlertsProps {
    coin: ICoin;
    darkMode: boolean;
}

class PureCoinAlerts extends React.Component<ICoinsAlertsProps> {
    public styles: typeof styles;

    public render() {
        return (
            <StyleProvider style={getTheme(commonColour)} >
                <Container style={styles(this.props.darkMode).alertsPage}>
                    <View style={styles(this.props.darkMode).NewsAlertsView}>
                        <Text style={styles(this.props.darkMode).text}>Receive news alerts about {this.props.coin.name}</Text>
                        <Switch />
                    </View>
                    <View style={styles(this.props.darkMode).AddAlertView}>
                        <Text style={styles(this.props.darkMode).text}>Add a new price alert</Text>
                        <TouchableOpacity>
                            <Icon type="Ionicons" name="ios-add" />
                        </TouchableOpacity>
                    </View>
                </Container>
            </StyleProvider>
        );
    }
}

const mapStateToProps = (state: IRootState) => {
    return {
        coins: state.coins.coins,
        user: state.user.user,
    };
};

const CoinAlerts = connect(mapStateToProps)(PureCoinAlerts);
export default CoinAlerts;

const styles = (darkMode: boolean) => StyleSheet.create({
    AddAlertView: {
        flexDirection: "row",
        justifyContent: "space-between",
        alignItems: "center",
        height: 60,
        paddingLeft: 20,
        paddingRight: 20,
    },
    card: {
        borderColor: (darkMode) ? "#41444c" : "#E1E1E1",
        backgroundColor: (darkMode) ? "#454951" : "#FFF",
    },
    cardItem: {
        backgroundColor: (darkMode) ? "#454951" : "#FFF",
    },
    cardText: {
        color: (darkMode) ? "#F8F8F8" : "#000"
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
        flex: 1,
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