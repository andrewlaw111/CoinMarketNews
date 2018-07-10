import axios from "axios";
import React from "react";
import Config from "react-native-config";
import { Navigator } from "react-native-navigation";
import OneSignal from "react-native-onesignal";
import { connect } from "react-redux";
import styles from "../styles/CoinAlertsStyles";

import { Container, StyleProvider, Text } from "native-base";
import { FlatList, ScrollView, Switch, View } from "react-native";

import getTheme from "../../native-base-theme/components";
import commonColour from "../../native-base-theme/variables/commonColor";

import { addNewsAlert, removeNewsAlert } from "../redux/actions/alerts";
import { changeSettings } from "../redux/actions/settings";
import { IRootState } from "../redux/store";

import { IAlerts, ICoin, ICoinPrice, INewsAlert, ISettings, IUser } from "../models";

import AlertItem from "../components/CoinAlerts/CoinAlertItem";
import CoinAlertsModal from "../components/CoinAlerts/CoinAlertsModal";

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
    changeSettings: (settings: ISettings) => void;
    removeNewsAlert: (coinID: number, token: string) => void;
}
interface ICoinsAlertsState {
    alerts: IAlerts[];
    newsAlerts: boolean;
}
class PureCoinAlerts extends React.Component<ICoinsAlertsProps, ICoinsAlertsState> {
    constructor(props: ICoinsAlertsProps) {
        super(props);
        this.state = {
            alerts: this.props.alerts.filter((alert) => alert.coinmarketcap_id === this.props.coin.coinmarketcap_id),
            newsAlerts: (this.props.newsAlerts.map(
                (alerts) => alerts.coin_id).indexOf(this.props.coin.id) > -1) ?
                true : false,
        };
    }

    public componentWillReceiveProps(nextProps: ICoinsAlertsProps) {
        const alerts = nextProps.alerts.filter((alert) => alert.coinmarketcap_id === this.props.coin.coinmarketcap_id);
        this.setState({
            alerts,
        });
        if (nextProps.newsAlerts.map((newsAlert) => newsAlert.coin_id).indexOf(this.props.coin.id) > -1) {
            this.setState({
                newsAlerts: true,
            });
        } else {
            this.setState({
                newsAlerts: false,
            });
        }

    }
    public renderAlerts = (info: { item: IAlerts, index: number }) => {
        return (
            <AlertItem
                key={info.item.id}
                alert={info.item}
                appSettings={this.props.appSettings}
                coin={this.props.coin}
                darkMode={this.props.darkMode}
            />
        );
    }
    public render() {
        return (
            <StyleProvider style={getTheme(commonColour)} >
                <Container style={styles(this.props.darkMode).alertsPage}>

                    <View >
                        <View style={styles(this.props.darkMode).NewsAlertsView}>
                            <View style={styles(this.props.darkMode).newsAlertTextView}>
                                <Text
                                    style={styles(this.props.darkMode).text}
                                >
                                    Receive news alerts about {this.props.coin.name}
                                </Text>
                            </View>
                            <View style={styles(this.props.darkMode).switch} >
                                <Switch value={this.state.newsAlerts} onValueChange={this.handlenewsAlertChange} />
                            </View>
                        </View>
                        <ScrollView style={{ marginBottom: 40 }}>
                            <FlatList
                                data={this.state.alerts}
                                keyExtractor={this.keyExtractor}
                                renderItem={this.renderAlerts}
                            />
                        </ScrollView>
                    </View>
                    <CoinAlertsModal
                        appSettings={this.props.appSettings}
                        coinPrice={this.props.coinPrice}
                        darkMode={this.props.darkMode}
                    />
                </Container>
            </StyleProvider>
        );
    }
    private keyExtractor = (item: IAlerts) => {
        return item.id.toString();
    }
    private handlenewsAlertChange = () => {
        if (this.state.newsAlerts) {
            this.props.removeNewsAlert(this.props.coin.id, this.props.user.token);
            this.setState({
                newsAlerts: false,
            });
        } else {
            const settings = { ...this.props.appSettings };
            settings.pushNotifications = true;
            this.props.changeSettings(settings);
            OneSignal.sendTag("user_id", this.props.user.id.toString());
            axios
                .patch(
                    `${Config.API_SERVER}/user`,
                    {
                        data: {
                            notifications: settings.pushNotifications,
                        },
                    },
                    {
                        headers: {
                            token: this.props.user.token,
                        },
                    },
            );

            this.props.addNewsAlert(this.props.coin.id, this.props.user.token);
            this.setState({
                newsAlerts: true,
            });
        }
    }
}

const mapDispatchToProps = (dispatch: any) => {
    return {
        addNewsAlert: (coinID: number, token: string) => dispatch(addNewsAlert(coinID, token)),
        changeSettings: (settings: ISettings) => dispatch(changeSettings(settings)),
        removeNewsAlert: (coinID: number, token: string) => dispatch(removeNewsAlert(coinID, token)),
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
