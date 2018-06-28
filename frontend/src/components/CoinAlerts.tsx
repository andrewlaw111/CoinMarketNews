import React from "react";
import { connect } from "react-redux";

import { Body, Card, CardItem, Container, Text, StyleProvider, Icon } from "native-base";
import { StyleSheet, View, Switch, TouchableOpacity, TouchableOpacityBase, ListView, FlatList } from "react-native";

import getTheme from '../../native-base-theme/components';
import commonColour from '../../native-base-theme/variables/commonColor';

import { ICoin, ICoinPrice, ISettings, IAlerts } from "../models";
import { IRootState } from "../redux/store";
import { Navigator } from "react-native-navigation";
import CoinAlertsModal from "./CoinAlertsModal";

interface ICoinsAlertsProps {
    alerts: IAlerts[];
    appSettings: ISettings;
    coin: ICoin;
    coinPrice: ICoinPrice;
    darkMode: boolean;
    navigator: Navigator;
}

class PureCoinAlerts extends React.Component<ICoinsAlertsProps, { modalVisible: boolean }> {
    public styles: typeof styles;

    constructor(props: ICoinsAlertsProps) {
        super(props);
        this.state = {
            modalVisible: false,
        };
    }
    public renderAlerts = (info: { item: IAlerts, index: number }) => {
        return (

            <View style={styles(this.props.darkMode).NewsAlertsView}>
                <Text style={styles(this.props.darkMode).text}>{info.item.currency} {info.item.amount}</Text>
                <Switch value={info.item.active}/>
            </View>
        )
    }
    public render() {
        return (
            <StyleProvider style={getTheme(commonColour)} >
                <Container style={styles(this.props.darkMode).alertsPage}>
                    <View style={styles(this.props.darkMode).NewsAlertsView}>
                        <Text style={styles(this.props.darkMode).text}>Receive news alerts about {this.props.coin.name}</Text>
                        <Switch />
                    </View>

                    <FlatList
                        data={this.props.alerts}
                        keyExtractor={this.keyExtractor}
                        renderItem={this.renderAlerts}
                    />
                    <View style={styles(this.props.darkMode).AddAlertView}>
                        <Text style={styles(this.props.darkMode).text}>Add a new price alert</Text>
                        <TouchableOpacity onPress={this.openModal} >
                            <Icon type="Ionicons" name="ios-add" />
                        </TouchableOpacity>
                    </View>
                    <CoinAlertsModal appSettings={this.props.appSettings} closeModal={this.closeModal} coinPrice={this.props.coinPrice} darkMode={this.props.darkMode} modalVisible={this.state.modalVisible} />
                </Container>
            </StyleProvider>
        );
    }
    private closeModal = () => {
        this.setState({
            modalVisible: false
        })
    }
    private keyExtractor = (item: IAlerts, index: number) => {
        return item.alertID.toString();
    }
    private openModal = () => {
        this.setState({
            modalVisible: true
        })
    }
}

const mapStateToProps = (state: IRootState) => {
    return {
        alerts: state.alerts.alerts,
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