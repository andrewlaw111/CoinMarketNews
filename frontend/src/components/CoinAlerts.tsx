import React from "react";
import { connect } from "react-redux";

import { Body, Card, CardItem, Container, Text, StyleProvider, Icon } from "native-base";
import { StyleSheet, View, Switch, TouchableOpacity, TouchableOpacityBase, ListView, FlatList, ScrollView } from "react-native";

import getTheme from '../../native-base-theme/components';
import commonColour from '../../native-base-theme/variables/commonColor';

import { ICoin, ICoinPrice, ISettings, IAlerts, IUser, INewsAlert } from "../models";
import { IRootState } from "../redux/store";
import { Navigator } from "react-native-navigation";
import CoinAlertsModal from "./CoinAlertsModal";
import { editAlert, removeAlerts, addNewsAlert, removeNewsAlert } from "../redux/actions/alerts";

interface ICoinsAlertsProps {
    alerts: IAlerts[];
    appSettings: ISettings;
    coin: ICoin;
    coinPrice: ICoinPrice;
    darkMode: boolean;
    navigator: Navigator;
    newsAlerts: INewsAlert[];
    user: IUser;
    addNewsAlert: (coinID: number, token: string) => void;
    removeNewsAlert: (coinID: number, token: string) => void;
    editAlert: (alert: IAlerts, token: string) => void;
    removeAlerts: (alert: IAlerts, token: string) => void;
}
interface ICoinsAlertsState {
    alerts: IAlerts[];
    modalVisible: boolean
    newsAlerts: boolean;
}
class PureCoinAlerts extends React.Component<ICoinsAlertsProps, ICoinsAlertsState> {
    public styles: typeof styles;

    constructor(props: ICoinsAlertsProps) {
        super(props);
        this.state = {
            alerts: this.props.alerts.filter((alert) => alert.coinmarketcap_id === this.props.coin.coinmarketcap_id),
            modalVisible: false,
            newsAlerts: (this.props.newsAlerts.map((alerts) => alerts.coin_id).indexOf(this.props.coin.id) > -1) ? true : false,
        };
    }
    componentWillReceiveProps(nextProps: ICoinsAlertsProps) {
        const alerts = nextProps.alerts.filter((alert) => alert.coinmarketcap_id === this.props.coin.coinmarketcap_id)
        this.setState({
            alerts
        })
        if (nextProps.newsAlerts.map((alerts) => alerts.coin_id).indexOf(this.props.coin.id) > -1) {
            this.setState({
                newsAlerts: true
            })
        } else {
            this.setState({
                newsAlerts: false
            })
        }
    }
    public renderAlerts = (info: { item: IAlerts, index: number }) => {
        return (
            <View style={styles(this.props.darkMode).NewsAlertsView}>
                <Text style={styles(this.props.darkMode).text}>{this.props.coin.symbol} {(info.item.upper)?'>':'<'} {info.item.price_point} {info.item.currency_symbol}</Text>
                <Switch value={info.item.active} onValueChange={this.handleValueChange.bind(this, info.item)} />
                <Icon type="FontAwesome" name="trash-o" onPress={this.handleDelete.bind(this, info.item)} />
            </View>
        )
    }
    public render() {
        return (
            <StyleProvider style={getTheme(commonColour)} >
                <Container style={styles(this.props.darkMode).alertsPage}>
                    <View style={styles(this.props.darkMode).NewsAlertsView}>
                        <Text style={styles(this.props.darkMode).text}>Receive news alerts about {this.props.coin.name}</Text>
                        <Switch value={this.state.newsAlerts} onValueChange={this.handlenewsAlertChange} />
                    </View>
                    <ScrollView>
                        <FlatList
                            data={this.state.alerts}
                            keyExtractor={this.keyExtractor}
                            renderItem={this.renderAlerts}
                        />
                    </ScrollView>
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
        return item.id.toString();
    }
    private handleDelete = (alert: IAlerts) => {
        return this.props.removeAlerts(alert, this.props.user.token)
    }
    private handlenewsAlertChange = () => {
        if (this.state.newsAlerts) {
            this.props.removeNewsAlert(this.props.coin.id, this.props.user.token)
            this.setState({
                newsAlerts: false
            })
        } else {

            this.props.addNewsAlert(this.props.coin.id, this.props.user.token)
            this.setState({
                newsAlerts: true
            })
        }
    }
    private handleValueChange = (alert: IAlerts) => {
        alert.active = !alert.active
        return this.props.editAlert(alert, this.props.user.token)
    }
    private openModal = () => {
        this.setState({
            modalVisible: true
        })
    }
}

const mapDispatchToProps = (dispatch: any) => {
    return {
        addNewsAlert: (coinID: number, token: string) => dispatch(addNewsAlert(coinID, token)),
        removeNewsAlert: (coinID: number, token: string) => dispatch(removeNewsAlert(coinID, token)),
        editAlert: (alert: IAlerts, token: string) => dispatch(editAlert(alert, token)),
        removeAlerts: (alert: IAlerts, token: string) => dispatch(removeAlerts(alert, token)),
    };
};
const mapStateToProps = (state: IRootState) => {
    return {
        alerts: state.alerts.priceAlerts,
        coins: state.coins.coins,
        newsAlerts: state.alerts.newsAlerts,
        user: state.user.user,
    };
};

const CoinAlerts = connect(mapStateToProps, mapDispatchToProps)(PureCoinAlerts);
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