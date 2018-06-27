import axios from "axios";
import React from "react";
import Config from "react-native-config";
import { connect } from "react-redux";

import { Container, Content, Spinner, Tab, Tabs, ScrollableTab, StyleProvider } from "native-base";
import { StyleSheet, View } from "react-native";

import getTheme from "../../native-base-theme/components";
import commonColour from '../../native-base-theme/variables/commonColor';

import { ICoin, ICoinPrice, IUser, ISettings } from "../models";
import { IRootState } from "../redux/store";

import { Navigator } from "react-native-navigation";
import CoinAlerts from "./CoinAlerts";
import CoinInfo from "./CoinInfo";
import CoinNews from "./CoinNews";
import CoinPrice from "./CoinPrice";


interface ICoinsPageProps {
    appSettings: ISettings;
    coinID: number;
    coinPrice: ICoinPrice;
    user: IUser;
    navigator: Navigator;
}
interface ICoinsPageState {
    coin?: ICoin;
    priceWidget: string;
}

class PureCoinsList extends React.Component<ICoinsPageProps, ICoinsPageState> {
    public styles: typeof styles;

    public static navigatorStyle = {
        tabBarHidden: true,
    };
    public componentWillMount() {
        this.styles = (this.props.appSettings.darkMode) ? darkStyles : styles;
    }
    public componentWillReceiveProps(nextProps: ICoinsPageProps) {
        this.styles = (this.props.appSettings.darkMode) ? darkStyles : styles;
    }

    constructor(props: ICoinsPageProps) {
        super(props);
        this.state = {
            coin: undefined,
            priceWidget: "",
        };
        this.getCoin();
    }
    public renderNoConnection() {
        console.log("no connection");
        return (
            <View style={this.styles.pageBackground}>
                <Spinner />
            </View>
        );
    }
    public render() {
        return (
            <StyleProvider style={getTheme(commonColour)}>
                <Container style={this.styles.pageBackground}>
                    <Tabs springTension={2} initialPage={0} >
                        <Tab heading="Info">
                            {(typeof this.state.coin === "undefined") ? this.renderNoConnection() : <CoinInfo coin={this.state.coin} darkMode={this.props.appSettings.darkMode} />}
                        </Tab>
                        <Tab heading="News">
                            {(typeof this.state.coin === "undefined") ? this.renderNoConnection() : <CoinNews coin={this.state.coin} darkMode={this.props.appSettings.darkMode} />}
                        </Tab>
                        <Tab heading="Price">
                            {(typeof this.state.coin === "undefined") ? this.renderNoConnection() : <CoinPrice coin={this.state.coin} coinPrice={this.props.coinPrice} darkMode={this.props.appSettings.darkMode} priceWidget={this.state.priceWidget} />}
                        </Tab>
                        <Tab heading="Alerts">
                            {(typeof this.state.coin === "undefined") ? this.renderNoConnection() : <CoinAlerts coin={this.state.coin} darkMode={this.props.appSettings.darkMode} />}
                        </Tab>
                    </Tabs>
                </Container>
            </StyleProvider>
        );
    }
    private getCoin = () => {
        axios
            .get<ICoin>(`${Config.API_SERVER}/coin/${this.props.coinID}`)
            .then((response) => {

                const priceWidget = "https://s.tradingview.com/widgetembed/?frameElementId=tradingview_fd207&symbol=BTCUSD&interval=D&symboledit=0&saveimage=0&toolbarbg=f1f3f6&studies=%5B%5D&theme=Dark&style=1&timezone=Etc%2FUTC&studies_overrides=%7B%7D&overrides=%7B%7D&enabled_features=%5B%5D&disabled_features=%5B%5D&locale=en&utm_medium=widget&utm_campaign=chart&utm_term=BTCUSD".replace(/BTC/, response.data.symbol);

                this.setState({
                    coin: response.data,
                    priceWidget,
                });
            });
    }
}

const mapStateToProps = (state: IRootState) => {
    return {
        coins: state.coins.coins,
        user: state.user.user,
    };
};

const CoinsList = connect(mapStateToProps)(PureCoinsList);
export default CoinsList;

const styles = StyleSheet.create({
    pageBackground: {
        flex: 1,
    },
});

const darkStyles = StyleSheet.create({
    pageBackground: {
        backgroundColor: "#2f343f",
        flex: 1,
    },
});
