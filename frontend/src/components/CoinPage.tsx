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
import IonIcons from "react-native-vector-icons/Ionicons";

import { Navigator, NavigatorEvent } from "react-native-navigation";
import CoinAlerts from "./CoinAlerts";
import CoinInfo from "./CoinInfo";
import CoinNews from "./CoinNews";
import CoinPrice from "./CoinPrice";
import { addCoinFavourite, removeCoinFavourite } from "../redux/actions/favourites";


interface ICoinsPageProps {
    appSettings: ISettings;
    coinID: number;
    coinPrice: ICoinPrice;
    coins: ICoinPrice[];
    favourite: boolean;
    favourites: number[];
    user: IUser;
    navigator: Navigator;
    addCoinFavourite: (coinID: number, token: string) => void;
    removeCoinFavourite: (coinID: number, token: string) => void;
}
interface ICoinsPageState {
    coin?: ICoin;
    favourite: boolean;
    priceWidget: string;
}

class PureCoinsList extends React.Component<ICoinsPageProps, ICoinsPageState> {
    public styles: typeof styles;

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
            favourite: this.props.favourite,
        };
        this.getCoin();
        this.props.navigator.setOnNavigatorEvent(this.onNavigatorEvent.bind(this));
    }

    public onNavigatorEvent(event: NavigatorEvent) {
        if (event.type == 'NavBarButtonPress') {
            if (event.id == 'like') {
                Promise.all([
                    IonIcons.getImageSource("ios-star", 24, "grey"),
                ]).then((sources) => {
                    this.props.navigator.setButtons({
                        rightButtons: [{
                            buttonColor: (this.state.favourite) ? "gold" : "grey",
                            buttonFontSize: 18,
                            buttonFontWeight: "600",
                            id: "like",
                            showAsAction: "ifRoom",
                            icon: sources[0],
                        }],
                    })
                })
                if (!this.state.favourite) {
                    this.setState({
                        favourite: true,
                    })
                    return this.props.addCoinFavourite(this.props.coinID, this.props.user.token);
                } else {
                    this.setState({
                        favourite: false,
                    })
                    return this.props.removeCoinFavourite(this.props.coinID, this.props.user.token);
                }
            } else if (event.id == "back") {
                this.props.navigator.dismissModal({
                    animationType: 'slide-down' // 'none' / 'slide-down' , dismiss animation for the modal (optional, default 'slide-down')
                });
            };
        }
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
        let backgroundColour: string;
        let textColour: string;
        if (this.props.appSettings.darkMode) {
            backgroundColour = "#343a44";
            textColour = "#F8F8F8"
        } else {
            backgroundColour = "#F8F8F8";
            textColour = "#000"
        }

        return (
            <StyleProvider style={getTheme(commonColour)}>
                <Container style={this.styles.pageBackground}>
                    <Tabs springTension={2} initialPage={0} >
                        <Tab
                            heading="Info"
                            activeTabStyle={{ backgroundColor: backgroundColour }}
                            activeTextStyle={{ color: textColour }}
                            tabStyle={{ backgroundColor: backgroundColour }}
                            textStyle={{ color: textColour }}
                        >
                            {(typeof this.state.coin === "undefined") ? this.renderNoConnection() : <CoinInfo coin={this.state.coin} darkMode={this.props.appSettings.darkMode} />}
                        </Tab>
                        <Tab
                            heading="News"
                            activeTabStyle={{ backgroundColor: backgroundColour }}
                            activeTextStyle={{ color: textColour }}
                            tabStyle={{ backgroundColor: backgroundColour }}
                            textStyle={{ color: textColour }}
                        >
                            {(typeof this.state.coin === "undefined") ? this.renderNoConnection() : <CoinNews appSettings={this.props.appSettings} coin={this.state.coin} coins={this.props.coins} favourites={this.props.favourites} darkMode={this.props.appSettings.darkMode} navigator={this.props.navigator} />}
                        </Tab>
                        <Tab
                            heading="Price"
                            activeTabStyle={{ backgroundColor: backgroundColour }}
                            activeTextStyle={{ color: textColour }}
                            tabStyle={{ backgroundColor: backgroundColour }}
                            textStyle={{ color: textColour }}
                        >
                            {(typeof this.state.coin === "undefined") ? this.renderNoConnection() : <CoinPrice coin={this.state.coin} coinPrice={this.props.coinPrice} darkMode={this.props.appSettings.darkMode} priceWidget={this.state.priceWidget} />}
                        </Tab>
                        <Tab
                            heading="Alerts"
                            activeTabStyle={{ backgroundColor: backgroundColour }}
                            activeTextStyle={{ color: textColour }}
                            tabStyle={{ backgroundColor: backgroundColour }}
                            textStyle={{ color: textColour }}
                        >
                            {(typeof this.state.coin === "undefined") ? this.renderNoConnection() : <CoinAlerts appSettings={this.props.appSettings} coin={this.state.coin} coinPrice={this.props.coinPrice} darkMode={this.props.appSettings.darkMode} navigator={this.props.navigator} />}
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

const mapDispatchToProps = (dispatch: any) => {
    return {
        addCoinFavourite: (coinID: number, token: string) => dispatch(addCoinFavourite(coinID, token)),
        removeCoinFavourite: (coinID: number, token: string) => dispatch(removeCoinFavourite(coinID, token)),
    };
};

const mapStateToProps = (state: IRootState) => {
    return {
        coins: state.coins.coins,
        favourites: state.favourites.favourites,
        user: state.user.user,
    };
};

const CoinsList = connect(mapStateToProps, mapDispatchToProps)(PureCoinsList);
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
