import React from "react";

import { IAlerts, ICoin, ISettings, IUser } from "../models";
import { Animated, View, Switch, Text, Dimensions } from "react-native";
import styles from "./styles/CoinAlertsStyles";
import { Icon } from "native-base";
import { IRootState } from "../redux/store";
import { connect } from "react-redux";
import { editAlert, removeAlerts } from "../redux/actions/alerts";

interface IRenderAlertsProps {
    alert: IAlerts;
    appSettings: ISettings;
    coin: ICoin;
    darkMode: boolean;
    user: IUser;
    editAlert: (alert: IAlerts, token: string) => void;
    removeAlerts: (alert: IAlerts, token: string) => void;
}

interface IRenderAlertsState {
    animatedValue: Animated.Value;
}
class PureAlertItem extends React.PureComponent<IRenderAlertsProps, IRenderAlertsState> {
    constructor(props: IRenderAlertsProps) {
        super(props);
        this.state = {
            animatedValue: new Animated.Value(600),
        };
    }
    public currencySymbols: { [key: string]: JSX.Element } = {
        USD: <Text style={{ color: (this.props.appSettings.darkMode) ? "#C2C2C2" : "#5E5E5E" }}>$</Text>,
        EUR: <Text style={{ color: (this.props.appSettings.darkMode) ? "#C2C2C2" : "#5E5E5E" }}>€</Text>,
        CAD: <Text style={{ color: (this.props.appSettings.darkMode) ? "#C2C2C2" : "#5E5E5E" }}>$</Text>,
        GBP: <Text style={{ color: (this.props.appSettings.darkMode) ? "#C2C2C2" : "#5E5E5E" }}>£</Text>,
        HKD: <Text style={{ color: (this.props.appSettings.darkMode) ? "#C2C2C2" : "#5E5E5E" }}>$</Text>,
        BTC: <Text style={{ fontFamily: "Font Awesome 5 Brands", color: (this.props.appSettings.darkMode) ? "#C2C2C2" : "#5E5E5E" }}>&#xf15a;</Text>,
        ETH: <Text style={{ fontFamily: "Font Awesome 5 Brands", color: (this.props.appSettings.darkMode) ? "#C2C2C2" : "#5E5E5E" }}>&#xf42e;</Text>,
    }
    public componentDidMount() {
        Animated.timing(this.state.animatedValue, {
            toValue: 0,
            duration: 300,
        }).start();
    }
    public render() {
        const alertAnimationStyle = {
            // opacity: this.state.animatedValue,
            transform: [{ translateX: this.state.animatedValue }]
        }

        return (
            <Animated.View style={[styles(this.props.darkMode).NewsAlertsView, alertAnimationStyle]} >
                <View style={{ flexDirection: "row" }}>
                    <Text style={styles(this.props.darkMode).text}>{this.props.coin.symbol} {(this.props.alert.upper) ? '>' : '<'} {this.currencySymbols[this.props.alert.currency_symbol]} {this.props.alert.price_point} </Text>

                </View>
                <View style={{ flexDirection: "row" }}>
                    <Switch value={this.props.alert.active} onValueChange={this.handleValueChange.bind(this, this.props.alert)} style={{ marginRight: 15 }} />
                    <Icon type="Entypo" style={(this.props.darkMode) ? { color: "white" } : { color: "black" }} name="cross" onPress={this.handleDelete.bind(this, this.props.alert)} />
                </View>
            </Animated.View>
        )
    }
    private handleValueChange = (alert: IAlerts) => {
        alert.active = !alert.active
        return this.props.editAlert(alert, this.props.user.token)
    }
    private handleDelete = (alert: IAlerts) => {
        Animated.timing(this.state.animatedValue, {
            toValue: 300,
            duration: 1000,
        }).start(() => this.props.removeAlerts(alert, this.props.user.token));
    }
}



const mapDispatchToProps = (dispatch: any) => {
    return {
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

const AlertItem = connect(mapStateToProps, mapDispatchToProps)(PureAlertItem);
export default AlertItem;
